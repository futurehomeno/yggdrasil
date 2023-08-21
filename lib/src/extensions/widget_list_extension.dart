import 'package:flutter/material.dart';

extension WidgetListExtension on List<Widget> {
  /// Adds separator between a list of widgets.
  List<Widget> separatedBy(Widget separator) {
    if (isEmpty) {
      return <Widget>[];
    }

    final List<Widget> widgetsWithSpacing = <Widget>[
      // ignore: avoid-unsafe-collection-methods
      this[0],
    ];

    for (int i = 1; i < length; i++) {
      widgetsWithSpacing.add(separator);
      // ignore: avoid-unsafe-collection-methods
      widgetsWithSpacing.add(this[i]);
    }

    return widgetsWithSpacing;
  }

  /// Adds spacing between widgets using [SizedBox].
  List<Widget> _withSpacing({
    double horizontalSpacing = 0,
    double verticalSpacing = 0,
  }) {
    return separatedBy(
      SizedBox(
        height: verticalSpacing,
        width: horizontalSpacing,
      ),
    );
  }

  /// Adds spacing horizontally between widgets using [SizedBox].
  List<Widget> withHorizontalSpacing(double horizontalSpacing) {
    return _withSpacing(horizontalSpacing: horizontalSpacing);
  }

  /// Adds spacing vertically between widgets using [SizedBox].
  List<Widget> withVerticalSpacing(double verticalSpacing) {
    return _withSpacing(verticalSpacing: verticalSpacing);
  }
}
