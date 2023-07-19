import 'package:flutter/material.dart';

extension WidgetListExtension on List<Widget> {
  /// Adds separator between a list of widgets.
  List<Widget> separatedBy(Widget separator) {
    if (isEmpty) {
      return <Widget>[];
    }

    final List<Widget> widgetsWithSpacing = <Widget>[
      this[0],
    ];

    for (int i = 1; i < length; i++) {
      widgetsWithSpacing.add(separator);
      widgetsWithSpacing.add(this[i]);
    }

    return widgetsWithSpacing;
  }

  /// Adds spacing between widgets using [SizedBox].
  List<Widget> withSpacing({
    double horizontalSpacing = 0,
    double verticalSpacing = 0,
  }) {
    return separatedBy(
      SizedBox(
        height: horizontalSpacing,
        width: verticalSpacing,
      ),
    );
  }
}
