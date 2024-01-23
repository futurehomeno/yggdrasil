import 'dart:ui';

import '../type_value_or_reference.dart';
import 'color_type_value_or_reference.dart';

class ColorTypeReference extends ColorTypeValueOrReference implements TypeReference<Color> {
  const ColorTypeReference({
    required this.path,
  });

  @override
  final List<String> path;
}
