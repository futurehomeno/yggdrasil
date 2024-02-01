import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/theme/picker/picker_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

import '_widgets.dart';

/// A single column of the [YgPicker] widget.
class YgPickerColumnWidget<T> extends StatefulWidget {
  const YgPickerColumnWidget({
    super.key,
    required this.rowHeight,
    required this.column,
  });

  final double rowHeight;
  final YgPickerColumn<T> column;

  @override
  State<YgPickerColumnWidget<T>> createState() => _YgPickerColumnWidgetState<T>();
}

class _YgPickerColumnWidgetState<T> extends State<YgPickerColumnWidget<T>> {
  late final YgFixedExtentScrollController _controller = YgFixedExtentScrollController(
    initialItem: widget.column.entries.indexWhere(
      (YgPickerEntry<T> entry) => entry.value == _selectedItem,
    ),
  );

  late T _selectedItem = widget.column.initialValue ?? widget.column.entries.first.value;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      _controller.position.isScrollingNotifier.addListener(_handleControllerUpdate);
    });
  }

  void _handleControllerUpdate() {
    final T newValue = widget.column.entries[_controller.selectedItem].value;
    if (newValue != _selectedItem) {
      _selectedItem = newValue;
      widget.column.onChange(newValue);
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

    return RepaintBoundary(
      child: YgFixedExtentScrollable(
        controller: _controller,
        physics: const YgFixedExtentScrollPhysics(),
        itemExtent: widget.rowHeight,
        scrollBehavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        viewportBuilder: (BuildContext context, ViewportOffset offset) {
          return ClipRRect(
            child: Padding(
              padding: theme.columnPadding,
              child: YgPickerColumnRendererWidget<T>(
                column: widget.column,
                offset: offset,
                rowHeight: widget.rowHeight,
                minWidth: theme.minimumColumnWidth,
                textDefaultStyle: theme.textDefaultStyle,
                textSelectedStyle: theme.textSelectedStyle,
              ),
            ),
          );
        },
      ),
    );
  }
}
