import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgPickerColumnRendererWidget<T> extends LeafRenderObjectWidget {
  const YgPickerColumnRendererWidget({
    super.key,
    required this.offset,
    required this.column,
    required this.rowHeight,
    required this.minWidth,
    required this.textDefaultStyle,
    required this.textSelectedStyle,
  });

  final YgPickerColumn<T> column;
  final ViewportOffset offset;
  final double rowHeight;
  final double minWidth;
  final TextStyle textDefaultStyle;
  final TextStyle textSelectedStyle;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return PickerValueRenderer<T>(
      offset: offset,
      entries: column.entries,
      textDefaultStyle: textDefaultStyle,
      textSelectedStyle: textSelectedStyle,
      rowHeight: rowHeight,
      minWidth: minWidth,
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant PickerValueRenderer<T> renderObject) {
    renderObject.offset = offset;
    renderObject.entries = column.entries;
    renderObject.textDefaultStyle = textDefaultStyle;
    renderObject.textSelectedStyle = textSelectedStyle;
    renderObject.rowHeight = rowHeight;
    renderObject.minWidth = minWidth;
  }
}

class PickerValueRenderer<T> extends RenderBox {
  PickerValueRenderer({
    required ViewportOffset offset,
    required List<YgPickerEntry<T>> entries,
    required double rowHeight,
    required double minWidth,
    required TextStyle textDefaultStyle,
    required TextStyle textSelectedStyle,
  })  : _offset = offset,
        _entries = entries,
        _rowHeight = rowHeight,
        _minWidth = minWidth,
        _textDefaultStyle = textDefaultStyle,
        _textSelectedStyle = textSelectedStyle;

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

  final TextPainter _textPainter = TextPainter(
    textAlign: TextAlign.center,
    textDirection: TextDirection.ltr,
  );

  @override
  void performLayout() {
    size = Size(
      computeMaxIntrinsicWidth(double.infinity),
      computeMaxIntrinsicHeight(double.infinity),
    );
    _offset.applyViewportDimension(size.height);
    _offset.applyContentDimensions(
      0,
      (_entries.length - 1) * _rowHeight,
    );
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final double pixels = _offset.pixels;
    final double selectedRow = pixels / _rowHeight;
    final int minRow = max(0, selectedRow - 2).floor();
    final int maxRow = min(_entries.length, selectedRow + 3).ceil();
    final double yOffset = (_entries.length > 3 ? 2 : 1) * rowHeight;

    for (int i = minRow; i < maxRow; i++) {
      final double selectedAmount = max(0, 1 - (i - selectedRow).abs());
      final TextStyle style = _textDefaultStyle.lerp(_textSelectedStyle, selectedAmount);
      final YgPickerEntry<T> entry = _entries[i];
      final TextSpan span = TextSpan(
        text: entry.title,
        style: style,
      );
      _textPainter.text = span;
      _textPainter.layout(
        minWidth: size.width,
        maxWidth: size.width,
      );

      final double baseOffset = offset.dy + yOffset;
      final double rowOffset = i * rowHeight;
      final double paddingOffset = (_rowHeight - _textPainter.height) / 2;

      _textPainter.paint(
        context.canvas,
        Offset(
          offset.dx,
          baseOffset + rowOffset + paddingOffset - pixels,
        ),
      );
    }
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
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
  double computeMinIntrinsicWidth(double height) => computeMaxIntrinsicWidth(height);

  @override
  double computeMaxIntrinsicHeight(double width) {
    return rowHeight * (_entries.length > 3 ? 5 : 3);
  }

  @override
  double computeMinIntrinsicHeight(double width) => getMaxIntrinsicHeight(width);
}
