import 'package:yggdrasil/src/utils/yg_icon_data/yg_colorable_icon_data.dart';

class YgTab {
  const YgTab({
    this.label,
    this.icon,
  });

  /// Text to show inside the tab.
  final String? label;

  /// Icon to show inside the tab.
  final YgColorableIconData? icon;
}
