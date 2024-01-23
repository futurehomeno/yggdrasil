import '../type_value_or_reference.dart';
import 'font_family_type.dart';

class FontFamilyTypeValue extends FontFamilyTypeValueOrReference implements TypeValue<String> {
  const FontFamilyTypeValue({
    required this.value,
  });

  @override
  final String value;
}
