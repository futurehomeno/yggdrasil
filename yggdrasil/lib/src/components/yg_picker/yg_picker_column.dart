import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/theme/picker/picker_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'widgets/_widgets.dart';

part 'yg_picker_column_controller.dart';

/// A single column of the [YgPicker] widget.
class YgPickerColumn<T extends Object> extends StatefulWidget {
  const YgPickerColumn({
    super.key,
    required this.entries,
    this.initialValue,
    this.onChange,
    this.onEditingComplete,
    this.onRollover,
    this.controller,
    this.looping = false,
  });

  /// The initial value selected in the column.
  final T? initialValue;

  /// Called when the value changes.
  final ValueChanged<T>? onChange;

  /// Called once the user has completed editing this column.
  ///
  /// In practice this means when the user has stopped scrolling and the scroll
  /// animation has ended. After this event has been fired it's guaranteed the
  /// value will not change again, unless the user starts a new scroll.
  final ValueChanged<T>? onEditingComplete;

  /// Called when the value rolls over.
  ///
  /// Only get called when [looping] is set to true.
  ///
  /// Called with the int 1 when the value loops around from the last to first
  /// value, and called with -1 when the value loops around from the first to
  /// last value.
  final ValueChanged<int>? onRollover;

  /// All the entries shown in the column.
  final List<YgPickerEntry<T>> entries;

  /// Whether the values loop around.
  final bool looping;

  /// Controller which controls the value of this column.
  final YgPickerColumnController<T>? controller;

  @override
  State<YgPickerColumn<T>> createState() => _YgPickerColumnState<T>();
}

class _YgPickerColumnState<T extends Object> extends State<YgPickerColumn<T>> with YgControllerManagerMixin {
  late final YgControllerManager<YgPickerColumnController<T>> _controllerManager = manageController(
    createController: () => YgPickerColumnController<T>(
      initialValue: widget.initialValue,
    ),
    getUserController: () => widget.controller,
  );

  @override
  Widget build(BuildContext context) {
    final YgPickerTheme theme = context.ygTheme.pickerTheme;
    final YgPickerColumnInheritedData columnData = YgPickerColumnInheritedData.of(context);
    final String? metric = columnData.metric;

    return YgFixedExtentScrollable(
      controller: _controllerManager.value._scrollController,
      physics: const YgFixedExtentScrollPhysics(),
      itemExtent: columnData.rowHeight,
      scrollBehavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      viewportBuilder: (BuildContext context, ViewportOffset offset) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: columnData.alignment,
          children: <Widget>[
            Padding(
              padding: theme.columnPadding,
              child: RepaintBoundary(
                child: ClipRect(
                  child: YgPickerColumnRendererWidget<T>(
                    entries: widget.entries,
                    offset: offset,
                    rowHeight: columnData.rowHeight,
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
