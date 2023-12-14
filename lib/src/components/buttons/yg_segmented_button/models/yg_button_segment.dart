import 'package:yggdrasil/yggdrasil.dart';

class YgButtonSegment<T extends Object?> {
  const YgButtonSegment({
    required String this.label,
    required this.icon,
    required this.value,
  });

  const YgButtonSegment.iconOnly({
    required YgIcon this.icon,
    required this.value,
  }) : label = null;

  final T value;
  final String? label;
  final YgIcon? icon;
}
