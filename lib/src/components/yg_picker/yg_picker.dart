// ignore_for_file: prefer-single-widget-per-file

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'widgets/_widgets.dart';

part 'models/yg_picker_column.dart';

/// Yggdrasil Picker implementation.
class YgPicker extends StatelessWidget {
  const YgPicker({
    super.key,
    required this.columns,
    this.metric,
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
      YgPicker(
        key: key,
        metric: metric,
        columns: <YgPickerColumn<Object>>[
          YgPickerColumn<T>(
            initialValue: initialValue,
            onChange: onChange,
            onEditingComplete: onEditingComplete,
            onRollover: onRollover,
            entries: entries,
            looping: looping,
          ),
        ],
      );

  /// List of columns to be shown in the picker.
  final List<YgPickerColumn<Object>> columns;

  /// The metric rendered behind the last column.
  final String? metric;

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

  List<Widget> _buildColumns(double rowHeight) {
    final List<Widget> widgets = <Widget>[];
    final String? metric = this.metric;

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
