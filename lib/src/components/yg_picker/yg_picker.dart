// ignore_for_file: prefer-single-widget-per-file

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'widgets/_widgets.dart';

class YgPicker extends StatelessWidget {
  const YgPicker({
    super.key,
    required this.columns,
    this.metric,
  });

  final List<YgPickerColumn<Object?>> columns;
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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: theme.columnSpacing),
              child: YgPickerRow(
                children: <Widget>[
                  for (final YgPickerColumn<Object?> column in columns)
                    YgPickerColumnWidget<Object?>(
                      rowHeight: rowHeight,
                      column: column,
                    ),
                  Text(
                    'A',
                    style: theme.textSelectedStyle,
                  ),
                ].withHorizontalSpacing(
                  theme.columnSpacing,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
