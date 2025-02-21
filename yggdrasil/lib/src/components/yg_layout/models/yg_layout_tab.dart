import 'package:flutter/widgets.dart';

/// A tab which can be displayed in a [YgLayout.tabbed].
class YgLayoutTab {
  const YgLayoutTab({
    required this.title,
    required this.content,
  });

  /// The title of the tab.
  ///
  /// This is only shown on the app bar.
  final String title;

  /// The content rendered in the layout.
  final Widget content;
}
