import 'package:flutter/material.dart';

/// Adds spacing between a list of widgets using [SizedBox].
class YgSpacingBuilder {
  const YgSpacingBuilder({
    this.horizontalSpacing = 0,
    this.verticalSpacing = 0,
  });

  final double horizontalSpacing;
  final double verticalSpacing;

  List<Widget> buildWidgetWithSpacing(List<Widget> widgets) {
    if (widgets.isEmpty) {
      return <Widget>[];
    }

    final List<Widget> widgetsWithSpacing = <Widget>[
      widgets[0],
    ];

    for (int i = 1; i < widgets.length; i++) {
      widgetsWithSpacing.add(SizedBox(
        height: horizontalSpacing,
        width: verticalSpacing,
      ));
      widgetsWithSpacing.add(widgets[i]);
    }

    return widgetsWithSpacing;
  }
}
