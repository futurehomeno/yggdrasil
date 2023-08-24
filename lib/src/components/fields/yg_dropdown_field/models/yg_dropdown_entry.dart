import 'package:yggdrasil/yggdrasil.dart';

class YgDropdownEntry<T extends Object> {
  const YgDropdownEntry({
    required this.title,
    required this.value,
    this.subtitle,
    this.icon,
  });

  final String title;
  final T value;
  final String? subtitle;
  final YgIcon? icon;
}
