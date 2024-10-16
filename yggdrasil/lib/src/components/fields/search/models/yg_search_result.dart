import 'package:yggdrasil/src/utils/_utils.dart';

class YgSearchResult<T> {
  const YgSearchResult({
    required this.title,
    required this.value,
    this.icon,
    this.subtitle,
  });

  final T value;
  final YgFormattedText title;
  final YgFormattedText? subtitle;
  final YgIconData? icon;
}
