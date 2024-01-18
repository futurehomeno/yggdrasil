import 'dart:ui';

import '../type_value_or_reference.dart';
import 'font_weight_type.dart';

class FontWeightTypeReference extends FontWeightTypeValueOrReference implements TypeReference<FontWeight> {
  const FontWeightTypeReference({
    required this.path,
  });

  @override
  final List<String> path;
}
