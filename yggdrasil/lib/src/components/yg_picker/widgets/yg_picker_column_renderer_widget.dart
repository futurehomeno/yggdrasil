import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// Renders and animates the values within a [YgPickerColumn].
class YgPickerColumnRendererWidget<T extends Object> extends LeafRenderObjectWidget {
  const YgPickerColumnRendererWidget({
    super.key,
    required this.offset,
    required this.entries,
    required this.rowHeight,
    required this.minWidth,
    required this.textDefaultStyle,
    required this.textSelectedStyle,
    required this.looping,
  });

  final List<YgPickerEntry<T>> entries;
  final ViewportOffset offset;
  final bool looping;
  final double rowHeight;
  final double minWidth;
  final TextStyle textDefaultStyle;
  final TextStyle textSelectedStyle;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return PickerValueRenderer<T>(
      offset: offset,
      entries: entries,
      textDefaultStyle: textDefaultStyle,
      textSelectedStyle: textSelectedStyle,
      rowHeight: rowHeight,
      minWidth: minWidth,
      looping: looping,
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant PickerValueRenderer<T> renderObject) {
    renderObject.offset = offset;
    renderObject.entries = entries;
    renderObject.textDefaultStyle = textDefaultStyle;
    renderObject.textSelectedStyle = textSelectedStyle;
    renderObject.rowHeight = rowHeight;
    renderObject.minWidth = minWidth;
    renderObject.looping = looping;
  }
}

class PickerValueRenderer<T extends Object> extends RenderBox {
  PickerValueRenderer({
    required ViewportOffset offset,
    required List<YgPickerEntry<T>> entries,
    required bool looping,
    required double rowHeight,
    required double minWidth,
    required TextStyle textDefaultStyle,
    required TextStyle textSelectedStyle,
  }) : _offset = offset,
       _entries = entries,
       _looping = looping,
       _rowHeight = rowHeight,
       _minWidth = minWidth,
       _textDefaultStyle = textDefaultStyle,
       _textSelectedStyle = textSelectedStyle;

  final TextPainter _textPainter = TextPainter(
    textAlign: TextAlign.center,
    textDirection: TextDirection.ltr,
  );

  // region Values

  List<YgPickerEntry<T>> _entries;
  List<YgPickerEntry<T>> get entries => _entries;
  set entries(List<YgPickerEntry<T>> newValue) {
    if (newValue != _entries) {
      _entries = newValue;
      markNeedsPaint();
    }
  }

  double _rowHeight;
  double get rowHeight => _rowHeight;
  set rowHeight(double newValue) {
    if (newValue != _rowHeight) {
      _rowHeight = newValue;
      markNeedsLayout();
    }
  }

  double _minWidth;
  double get minWidth => _minWidth;
  set minWidth(double newValue) {
    if (newValue != _minWidth) {
      _minWidth = newValue;
      markNeedsLayout();
    }
  }

  TextStyle _textDefaultStyle;
  TextStyle get textDefaultStyle => _textDefaultStyle;
  set textDefaultStyle(TextStyle newValue) {
    if (newValue != _textDefaultStyle) {
      _textDefaultStyle = newValue;
      markNeedsLayout();
    }
  }

  TextStyle _textSelectedStyle;
  TextStyle get textSelectedStyle => _textSelectedStyle;
  set textSelectedStyle(TextStyle newValue) {
    if (newValue != _textSelectedStyle) {
      _textSelectedStyle = newValue;
      markNeedsLayout();
    }
  }

  ViewportOffset _offset;
  ViewportOffset get offset => _offset;
  set offset(ViewportOffset newValue) {
    if (newValue != _offset) {
      _offset.removeListener(markNeedsPaint);
      _offset = newValue;
      _offset.addListener(markNeedsPaint);
      markNeedsPaint();
    }
  }

  bool _looping;
  bool get looping => _looping;
  set looping(bool newValue) {
    if (newValue != _looping) {
      _looping = newValue;
      _updateScrollDimensions();
      markNeedsPaint();
    }
  }

  // endregion

  @override
  void attach(PipelineOwner owner) {
    _offset.addListener(markNeedsPaint);
    super.attach(owner);
  }

  @override
  void detach() {
    _offset.removeListener(markNeedsPaint);
    super.detach();
  }

  @override
  void performLayout() {
    size = constraints.constrain(
      Size(
        computeMaxIntrinsicWidth(double.infinity),
        computeMaxIntrinsicHeight(double.infinity),
      ),
    );
    _updateScrollDimensions();
  }

  void _updateScrollDimensions() {
    _offset.applyViewportDimension(size.height);
    if (_looping) {
      _offset.applyContentDimensions(
        double.negativeInfinity,
        double.infinity,
      );
    } else {
      _offset.applyContentDimensions(
        0,
        (_entries.length - 1) * _rowHeight,
      );
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final double pixels = _offset.pixels;
    final double selectedRow = pixels / _rowHeight;
    final double yOffset = (_entries.length > 3 ? 2 : 1) * rowHeight;

    // Calculate the range of which rows to render.
    int minRow = (selectedRow - 2).floor();
    int maxRow = (selectedRow + 3).ceil();

    // Adjust the range to stay within the entries list if the column doesn't
    // loop.
    if (!_looping) {
      minRow = max(minRow, 0);
      maxRow = min(maxRow, _entries.length);
    }

    for (int i = minRow; i < maxRow; i++) {
      // Normalize row index for looping.
      int row = i % _entries.length;
      if (row < 0) {
        row += _entries.length;
      }

      // Interpolate the text style based on how close this value is to being
      // selected.
      final double selectedAmount = max(0, 1 - (i - selectedRow).abs());
      final TextStyle style = _textDefaultStyle.lerp(_textSelectedStyle, selectedAmount);
      final YgPickerEntry<T> entry = _entries[row];

      // Prepare the text painter.
      _textPainter.text = TextSpan(
        text: entry.title,
        style: style,
      );
      _textPainter.layout(
        minWidth: size.width,
        maxWidth: size.width,
      );

      // Calculate the offset for the row.
      final double rowOffset = i * rowHeight;
      final double centeringOffset = (_rowHeight - _textPainter.height) / 2;

      // Paint the text onto the canvas at the calculated offset.
      _textPainter.paint(
        context.canvas,
        Offset(
          offset.dx,
          offset.dy + yOffset + rowOffset + centeringOffset - pixels,
        ),
      );
    }
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    /// Get the biggest width of all entries both when selected and not selected.
    double width = _minWidth;
    for (final YgPickerEntry<T> entry in _entries) {
      _textPainter.text = TextSpan(text: entry.title, style: _textDefaultStyle);
      _textPainter.layout();
      if (_textPainter.width > width) {
        width = _textPainter.width;
      }

      _textPainter.text = TextSpan(text: entry.title, style: _textSelectedStyle);
      _textPainter.layout();
      if (_textPainter.width > width) {
        width = _textPainter.width;
      }
    }

    return width;
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    return rowHeight * (_entries.length > 3 ? 5 : 3);
  }

  @override
  double computeMinIntrinsicWidth(double height) => computeMaxIntrinsicWidth(height);

  @override
  double computeMinIntrinsicHeight(double width) => getMaxIntrinsicHeight(width);
}
