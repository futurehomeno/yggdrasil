import '../type_value_or_reference.dart';
import '[FTName | snakecase]_type.dart';

class [FTName | pascalcase]TypeReference extends [FTName | pascalcase]TypeValueOrReference implements TypeReference<[FTName | pascalcase]> {
  const [FTName | pascalcase]TypeReference({
    required this.path,
  });

  @override
  final List<String> path;
}
