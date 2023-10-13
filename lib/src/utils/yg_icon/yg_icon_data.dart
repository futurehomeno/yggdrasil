/// Base class for data of an icon.
abstract class YgIconData {
  YgIconData({
    required this.name,
    required this.path,
    required this.colorful,
  });

  /// The name of the icon
  final String name;
  final String path;
  final bool colorful;
}
