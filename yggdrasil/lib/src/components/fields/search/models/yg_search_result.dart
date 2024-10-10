import 'package:yggdrasil/src/utils/_utils.dart';

class YgSearchResult<T> {
  const YgSearchResult({
    required this.title,
    required this.value,
    this.subtitle,
    this.icon,
  });

  final YgFormattedText title;
  final YgFormattedText? subtitle;
  final YgIconData? icon;
  final T value;
}
