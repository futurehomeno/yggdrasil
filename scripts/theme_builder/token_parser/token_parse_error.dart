// ignore_for_file: avoid-dynamic

import 'enums/token_value_type.dart';

class TokenParseError extends Error {
  TokenParseError({
    this.type,
    required this.error,
    this.path = const <String>[],
  });

  final TokenValueType? type;
  final List<String> path;
  final String error;

  void addToPath(String pathPart) {
    path.insert(0, pathPart);
  }

  @override
  String toString() {
    if (type != null) {
      return 'Error while parsing $type: $error\nError occurred while processing $path';
    }

    return 'Error: $error\nError occurred while processing $path';
  }
}

class TokenParseTypeError extends TokenParseError {
  TokenParseTypeError({
    super.type,
    super.path,
    required Type expectedType,
    required Type foundType,
  }) : super(
          error: 'Expected to find $expectedType but found $foundType instead.',
        );
}

class TokenParseFormatError extends TokenParseError {
  TokenParseFormatError({
    super.type,
    super.path,
    required dynamic data,
  }) : super(
          error: 'Data "$data" does not match the expected format',
        );
}
