// ignore_for_file: avoid-dynamic

import 'enums/token_value_type.dart';

class TokenParseError extends Error {
  TokenParseError({
    required this.type,
    required this.error,
    this.path = const <String>[],
  });

  final TokenValueType type;
  final List<String> path;
  final String error;

  TokenParseError copyWithPath(String pathAddition) {
    return TokenParseError(
      type: type,
      path: <String>[
        pathAddition,
        ...path,
      ],
      error: error,
    );
  }

  @override
  String toString() {
    return 'Error while parsing $type: $error\nError occurred while processing $path';
  }
}

class TokenParseTypeError extends TokenParseError {
  TokenParseTypeError({
    required super.type,
    super.path,
    required Type expectedType,
    required Type foundType,
  }) : super(
          error: 'Expected to find $expectedType but found $foundType instead.',
        );
}

class TokenParseFormatError extends TokenParseError {
  TokenParseFormatError({
    required super.type,
    super.path,
    required dynamic data,
  }) : super(
          error: 'Data "$data" does not match the expected format',
        );
}
