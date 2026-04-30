import 'package:yggdrasil/src/utils/yg_icon_data/yg_icon_data.dart';

/// A single item shown inside of a [YgBottomNavigationBar].
class YgBottomNavigationBarItem {
  const YgBottomNavigationBarItem({
    required this.icon,
    required this.title,
    this.subtitle,
  });

  /// The icon shown above the title.
  final YgIconData icon;

  /// The label shown below the icon.
  final String title;

  /// Optional secondary label shown below the [title].
  ///
  /// Only displayed when the parent [YgBottomNavigationBar] has
  /// `showSubtitle` enabled.
  final String? subtitle;
}
