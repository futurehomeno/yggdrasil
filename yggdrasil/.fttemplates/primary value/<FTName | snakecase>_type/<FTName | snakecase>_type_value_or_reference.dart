// ignore_for_file: avoid-dynamic
import '../../../_token_parser.dart';
import '../type_value_or_reference.dart';
import '[FTName | snakecase]_type.dart';

abstract class [FTName | pascalcase]TypeValueOrReference extends TypeValueOrReference<[FTName | pascalcase]> {
  const [FTName | pascalcase]TypeValueOrReference();

  static [FTName | pascalcase]TypeValueOrReference parse(dynamic data) {
    final List<String>? reference = ReferenceParser.tryParse(data);
    if (reference != null) {
      return [FTName | pascalcase]TypeReference(
        path: reference,
      );
    }

    throw UnimplementedError();
  }

  static const TokenValueType _type = TokenValueType.[FTName | camelcase];

  @override
  TokenValueType get type => _type;
}
