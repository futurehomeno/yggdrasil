// ignore_for_file: prefer-single-widget-per-file

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'widgets/_widgets.dart';

/// Yggdrasil Picker implementation.
class YgPicker extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgPicker({
    super.key,
    required this.columns,
    this.metric,
  });

  /// The metric rendered behind the last column.
  final String? metric;

  /// The rows rendered in this picker.
  final List<YgPickerColumn<Object>> columns;

  @override
  Widget build(BuildContext context) {
    assert(columns.length <= 3, 'Can not have more than 3 columns in a YgPicker.');

    final YgPickerTheme theme = context.ygTheme.pickerTheme;
    final double textHeight = theme.textDefaultStyle.computedHeight;
    final double rowHeight = textHeight + theme.textPadding.vertical;

    int minRows = 0;
    for (final YgPickerColumn<Object> column in columns) {
      minRows = max(minRows, column.entries.length);
    }

    final double totalHeight = rowHeight * (minRows > 3 ? 5 : 3);
    final double indicatorHeight = theme.indicatorPadding.vertical + theme.textSelectedStyle.computedHeight;

    return Container(
      color: theme.backgroundColor,
      height: totalHeight,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Center(
              child: Container(
                padding: theme.indicatorPadding.copyWith(
                  top: 0,
                  bottom: 0,
                ),
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

    for (int i = 0; i < columns.length; i++) {
      final bool isFirst = i == 0;
      final bool isLast = columns.length - 1 == i;

      final MainAxisAlignment alignment = switch ((isFirst, isLast)) {
        (true, false) => MainAxisAlignment.end,
        (false, true) => MainAxisAlignment.start,
        _ => MainAxisAlignment.center,
      };

      widgets.add(
        YgPickerColumnInheritedData(
          rowHeight: rowHeight,
          alignment: alignment,
          metric: isLast ? metric : null,
          child: columns[i],
        ),
      );
    }

    return widgets;
  }

  @override
  YgDebugType get debugType => YgDebugType.intractable;
}
