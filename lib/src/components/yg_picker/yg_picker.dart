// ignore_for_file: prefer-single-widget-per-file

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'widgets/_widgets.dart';
import 'yg_picker_controller.dart';

part 'models/yg_picker_column.dart';

/// Yggdrasil Picker implementation.
abstract class YgPicker<V extends Record, P extends YgPicker<V, P>> extends StatefulWidget {
  const YgPicker({
    super.key,
    this.metric,
    this.controller,
    this.onChange,
    this.onEditingComplete,
  });

  // ignore: prefer-widget-private-members
  static YgPicker single<T extends Object>({
    Key? key,
    required List<YgPickerEntry<T>> entries,
    String? metric,
    T? initialValue,
    ValueChanged<T>? onChange,
    ValueChanged<T>? onEditingComplete,
    ValueChanged<int>? onRollover,
    bool looping = false,
  }) =>
      YgPickerSingle<T>(
        key: key,
        metric: metric,
        initialValue: initialValue,
        onChange: onChange,
        onEditingComplete: onEditingComplete,
        onRollover: onRollover,
        entries: entries,
        looping: looping,
      );

  /// The metric rendered behind the last column.
  final String? metric;

  final YgPickerController<V, P>? controller;

  final ValueChanged<V>? onChange;

  final ValueChanged<V>? onEditingComplete;

  @override
  State<YgPicker> createState() => _YgPickerState();
}

class _YgPickerState extends State<YgPicker> {
  late final YgPickerController _currentController = widget.controller ?? _createController();

  void _createController() {}

  @override
  Widget build(BuildContext context) {
    final YgPickerTheme theme = context.ygTheme.pickerTheme;
    final double textHeight = theme.textDefaultStyle.computedHeight;
    final double rowHeight = textHeight + theme.textPadding.vertical;

    int minRows = 0;
    for (final YgPickerColumn<Object>(:List<YgPickerEntry<Object>> entries) in columns) {
      if (entries.length > minRows) {
        minRows = entries.length;
      }
    }

    final double totalHeight = rowHeight * (minRows > 3 ? 5 : 3);
    final double indicatorHeight = (theme.indicatorVerticalPadding * 2) + theme.textSelectedStyle.computedHeight;

    return Container(
      color: theme.backgroundColor,
      height: totalHeight,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: theme.indicatorColor,
                  borderRadius: theme.indicatorBorderRadius,
                ),
                height: indicatorHeight,
              ),
            ),
          ),
          Positioned.fill(
            child: YgPickerRow(
              children: _buildColumns(rowHeight),
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      theme.backgroundColor,
                      theme.backgroundColor.withOpacity(0),
                      theme.backgroundColor.withOpacity(0),
                      theme.backgroundColor,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: <double>[
                      0,
                      theme.textPadding.top / totalHeight,
                      (totalHeight - theme.textPadding.bottom) / totalHeight,
                      1,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColumn<T extends Object>(YgPickerColumn<T> column) {}

  List<Widget> _buildColumns(double rowHeight) {
    final List<Widget> widgets = <Widget>[];
    final String? metric = widget.metric;

    for (int i = 0; i < columns.length; i++) {
      final bool isFirst = i == 0;
      final bool isLast = columns.length - 1 == i;
      final YgPickerColumn<Object> column = columns[i];

      final MainAxisAlignment alignment = switch ((isFirst, isLast)) {
        (true, false) => MainAxisAlignment.end,
        (false, true) => MainAxisAlignment.start,
        _ => MainAxisAlignment.center,
      };

      widgets.add(column._createWidget(
        rowHeight: rowHeight,
        alignment: alignment,
        metric: isLast ? metric : null,
      ));
    }

    return widgets;
  }
}

class YgPickerSingle<T extends Object> extends YgPicker implements YgPickerColumn<T> {
  const YgPickerSingle({
    super.key,
    required this.initialValue,
    required this.onChange,
    required this.onEditingComplete,
    required this.onRollover,
    required this.entries,
    required this.looping,
    super.metric,
  });

  /// The initial value selected in the column.
  @override
  final T? initialValue;

  /// Called when the value changes.
  @override
  final ValueChanged<T>? onChange;

  /// Called once the user has completed editing this column.
  ///
  /// In practice this means when the user has stopped scrolling and the scroll
  /// animation has ended. After this event has been fired it's guaranteed the
  /// value will not change again, unless the user starts a new scroll.
  @override
  final ValueChanged<T>? onEditingComplete;

  /// Called with the int 1 when the value loops around from the last to first
  /// value, and called with -1 when the value loops around from the first to
  /// last value.
  @override
  final ValueChanged<int>? onRollover;

  /// All the entries shown in the column.
  @override
  final List<YgPickerEntry<T>> entries;

  /// Whether the values loop around.
  @override
  final bool looping;

  @override
  YgPickerColumnWidget<T> _createWidget({
    required double rowHeight,
    required MainAxisAlignment alignment,
    required String? metric,
  }) {
    return YgPickerColumnWidget<T>(
      rowHeight: rowHeight,
      column: this,
      alignment: alignment,
      metric: metric,
      looping: looping,
    );
  }
}

class YgPickerDual<T1 extends Object, T2 extends Object> extends YgPicker {
  const YgPickerDual({
    super.key,
    this.onChange,
    this.onEditingComplete,
    required this.column1,
    required this.column2,
  });

  @override
  final ValueChanged<({T1 value1, T2 value2})>? onChange;
  @override
  final ValueChanged<({T1 value1, T2 value2})>? onEditingComplete;

  final YgPickerColumn<T1> column1;
  final YgPickerColumn<T2> column2;
}

class YgPickerTriple<T1 extends Object, T2 extends Object, T3 extends Object> extends YgPicker {
  const YgPickerTriple({
    super.key,
    this.onChange,
    this.onEditingComplete,
    required this.column1,
    required this.column2,
    required this.column3,
  });

  @override
  final ValueChanged<({T1 value1, T2 value2, T3 value3})>? onChange;
  @override
  final ValueChanged<({T1 value1, T2 value2, T3 value3})>? onEditingComplete;

  final YgPickerColumn<T1> column1;
  final YgPickerColumn<T2> column2;
  final YgPickerColumn<T3> column3;
}
