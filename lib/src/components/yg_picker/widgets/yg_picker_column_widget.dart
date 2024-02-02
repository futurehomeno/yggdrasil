import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/theme/picker/picker_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

import '_widgets.dart';

/// A single column of the [YgPicker] widget.
class YgPickerColumnWidget<T extends Object> extends StatefulWidget {
  const YgPickerColumnWidget({
    super.key,
    required this.rowHeight,
    required this.column,
    required this.alignment,
    required this.looping,
    this.metric,
  });

  final double rowHeight;
  final YgPickerColumn<T> column;
  final MainAxisAlignment alignment;
  final String? metric;
  final bool looping;

  @override
  State<YgPickerColumnWidget<T>> createState() => YgPickerColumnWidgetState<T>();
}

class YgPickerColumnWidgetState<T extends Object> extends State<YgPickerColumnWidget<T>> {
  int _lastRollOverCount = 0;
  late T _selectedItem = widget.column.initialValue ?? widget.column.entries.first.value;
  late final YgFixedExtentScrollController _controller = YgFixedExtentScrollController(
    initialItem: widget.column.entries.indexWhere(
      (YgPickerEntry<T> entry) => entry.value == _selectedItem,
    ),
    onAttach: _controllerAttached,
    onDetach: _controllerDetached,
  );

  void _controllerAttached(ScrollPosition position) {
    position.addListener(_handleControllerUpdate);
    position.isScrollingNotifier.addListener(_handleScrollCompleted);
  }

  void _controllerDetached(ScrollPosition position) {
    position.removeListener(_handleControllerUpdate);
    position.isScrollingNotifier.removeListener(_handleScrollCompleted);
  }

  void _handleScrollCompleted() {
    if (!_controller.position.isScrollingNotifier.value) {
      widget.column.onEditingComplete?.call(_selectedItem);
    }
  }

  void _handleControllerUpdate() {
    final YgPickerColumn<T> column = widget.column;
    final List<YgPickerEntry<T>> entries = column.entries;

    final int rollOverCount = (_controller.selectedItem / entries.length).floor();
    if (rollOverCount != _lastRollOverCount) {
      column.onRollover?.call(rollOverCount - _lastRollOverCount);
      _lastRollOverCount = rollOverCount;
    }

    int realItem = _controller.selectedItem % entries.length;
    if (realItem < 0) {
      realItem += entries.length;
    }

    final T newValue = entries[realItem].value;
    if (newValue != _selectedItem) {
      _selectedItem = newValue;
      column.onChange?.call(newValue);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final YgPickerTheme theme = context.ygTheme.pickerTheme;
    final String? metric = widget.metric;

    return YgFixedExtentScrollable(
      controller: _controller,
      physics: const YgFixedExtentScrollPhysics(),
      itemExtent: widget.rowHeight,
      scrollBehavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      viewportBuilder: (BuildContext context, ViewportOffset offset) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: widget.alignment,
          children: <Widget>[
            Padding(
              padding: theme.columnPadding,
              child: RepaintBoundary(
                child: ClipRect(
                  child: YgPickerColumnRendererWidget<T>(
                    column: widget.column,
                    offset: offset,
                    rowHeight: widget.rowHeight,
                    minWidth: theme.minimumColumnWidth,
                    textDefaultStyle: theme.textDefaultStyle,
                    textSelectedStyle: theme.textSelectedStyle,
                    looping: widget.looping,
                  ),
                ),
              ),
            ),
            if (metric != null)
              Padding(
                padding: theme.columnPadding,
                child: Text(
                  metric,
                  style: theme.textSelectedStyle,
                ),
              ),
          ],
        );
      },
    );
  }
}
