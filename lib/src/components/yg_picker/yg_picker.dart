// ignore_for_file: prefer-single-widget-per-file

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'widgets/_widgets.dart';

part 'yg_picker_multi_column.dart';
part 'yg_picker_single_column.dart';

/// Yggdrasil Picker implementation.
abstract class YgPicker extends StatelessWidget {
  const factory YgPicker({
    required List<YgPickerColumn<Object?>> columns,
    Key? key,
    String? metric,
  }) = YgPickerMultiColumn;

  const YgPicker._({
    super.key,
    this.metric,
  });

  static YgPicker single<T>({
    Key? key,
    required void Function(T) onChange,
    required List<YgPickerEntry<T>> entries,
    T? initialValue,
    String? metric,
  }) =>
      _YgPickerSingleColumn<T>(
        entries: entries,
        onChange: onChange,
        initialValue: initialValue,
        key: key,
        metric: metric,
      );

  /// List of columns to be shown in the picker.
  List<YgPickerColumn<Object?>> get columns;

  /// The metric rendered behind the last column.
  final String? metric;

  @override
  Widget build(BuildContext context) {
    final YgPickerTheme theme = context.ygTheme.pickerTheme;
    final double rowHeight = theme.textDefaultStyle.computedHeight + theme.textPadding.vertical;

    int minRows = 0;
    for (final YgPickerColumn<Object?>(:List<YgPickerEntry<Object?>> entries) in columns) {
      if (entries.length > minRows) {
        minRows = entries.length;
      }
    }

    return Container(
      color: theme.backgroundColor,
      height: rowHeight * (minRows > 3 ? 5 : 3),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: theme.indicatorColor,
                  borderRadius: theme.indicatorBorderRadius,
                ),
                height: (theme.indicatorVerticalPadding * 2) + theme.textSelectedStyle.computedHeight,
              ),
            ),
          ),
          Positioned.fill(
            child: YgPickerRow(
              children: _buildColumns(rowHeight),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildColumns(double rowHeight) {
    final List<Widget> widgets = <Widget>[];
    final String? metric = this.metric;

    for (int i = 0; i < columns.length; i++) {
      final bool isFirst = i == 0;
      final bool isLast = columns.length - 1 == i;
      final YgPickerColumn<Object?> column = columns[i];

      final MainAxisAlignment alignment = switch ((isFirst, isLast)) {
        (true, false) => MainAxisAlignment.end,
        (false, true) => MainAxisAlignment.start,
        _ => MainAxisAlignment.center,
      };

      widgets.add(YgPickerColumnWidget<Object?>(
        rowHeight: rowHeight,
        column: column,
        alignment: alignment,
        metric: isLast ? metric : null,
      ));
    }

    return widgets;
  }
}
