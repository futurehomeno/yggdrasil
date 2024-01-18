import 'dart:ui';

import '../type_value_or_reference.dart';
import 'font_weight_type.dart';

class FontWeightTypeValue extends FontWeightTypeValueOrReference implements TypeValue<FontWeight> {
  const FontWeightTypeValue({
    required this.value,
  });

  @override
  final FontWeight value;
}
