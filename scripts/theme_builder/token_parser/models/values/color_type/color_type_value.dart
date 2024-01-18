import 'dart:ui';

import '../type_value_or_reference.dart';
import 'color_type_value_or_reference.dart';

class ColorTypeValue extends ColorTypeValueOrReference implements TypeValue<Color> {
  const ColorTypeValue({
    required this.value,
  });

  @override
  final Color value;
}
