/// Base class for data of an icon.
abstract class YgIconData {
  YgIconData({
    required this.name,
    required this.path,
    required this.colorful,
  });

  final String name;
  final String path;
  final bool colorful;
}
