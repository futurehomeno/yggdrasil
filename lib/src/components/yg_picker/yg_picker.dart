// ignore_for_file: prefer-single-widget-per-file

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'widgets/_widgets.dart';

part 'yg_picker_multi_column.dart';
part 'yg_picker_single_column.dart';

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

  List<YgPickerColumn<Object?>> get columns;
  final String? metric;

  @override
  Widget build(BuildContext context) {
    final YgPickerTheme theme = context.ygTheme.pickerTheme;
    final double rowHeight = theme.textDefaultStyle.computedHeight + theme.textPadding.vertical;
    final String? metric = this.metric;

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
              children: <Widget>[
                for (final YgPickerColumn<Object?> column in columns)
                  YgPickerColumnWidget<Object?>(
                    rowHeight: rowHeight,
                    column: column,
                  ),
                if (metric != null)
                  Text(
                    metric,
                    style: theme.textSelectedStyle,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
