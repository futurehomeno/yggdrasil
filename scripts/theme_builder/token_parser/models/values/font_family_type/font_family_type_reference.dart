import '../type_value_or_reference.dart';
import 'font_family_type.dart';

class FontFamilyTypeReference extends FontFamilyTypeValueOrReference implements TypeReference<String> {
  const FontFamilyTypeReference({
    required this.path,
  });

  @override
  final List<String> path;
}
