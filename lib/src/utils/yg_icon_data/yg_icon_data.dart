/// Data representing an icon.
///
/// These icons cannot be colored, see [YgColorableIcon].
class YgIconData {
  const YgIconData({
    required this.name,
    required this.path,
  });

  /// The name of the icon
  ///
  /// Typically the name of the file without the extension in camel case.
  final String name;

  /// The path to the icon.
  final String path;

  @override
  String toString() => 'YgIconData(name: $name, path: $path)';
}
