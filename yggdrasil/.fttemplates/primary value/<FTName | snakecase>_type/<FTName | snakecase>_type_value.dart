import '../type_value_or_reference.dart';
import '[FTName | snakecase]_type.dart';

class [FTName | pascalcase]TypeValue extends [FTName | pascalcase]TypeValueOrReference implements TypeValue<[FTName | pascalcase]> {
  const [FTName | pascalcase]TypeValue({
    required this.value,
  });

  @override
  final [FTName | pascalcase] value;
}
