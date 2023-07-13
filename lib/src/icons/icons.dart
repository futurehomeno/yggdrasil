class IconConstants {
  IconConstants._();

  static const String packageName = 'yggdrasil';

  static const String iconsPath = 'assets/icons/';

  static String getIconPath(String icon) {
    return '$iconsPath$icon.svg';
  }
}
