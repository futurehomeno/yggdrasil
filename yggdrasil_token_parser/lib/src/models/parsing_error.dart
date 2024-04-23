class ParsingError {
  const ParsingError({
    required this.message,
    required this.path,
    this.details,
  });

  const ParsingError.dataType({
    required Type expected,
    required Type actual,
    required this.path,
    this.details,
  }) : message = 'TypeError: Expected to find $expected but found $actual instead.';

  ParsingError.dataTypes({
    required List<Type> expected,
    required Type actual,
    required this.path,
    this.details,
  }) : message = 'TypeError: Expected to find any of ${expected.join(', ')} but found $actual instead.';

  const ParsingError.format({
    required Object data,
    required this.path,
    this.details,
  }) : message = 'FormatError: Invalid data format: $data';

  const ParsingError.conflict({
    required this.path,
    this.details,
  }) : message = 'Conflict';

  const ParsingError.missingProperty({
    required this.path,
  })  : message = 'Missing property',
        details = 'The property either does not exist or has a null value';

  final String message;
  final String? details;
  final List<String> path;

  ParsingError copyWithKey(String key) {
    final List<String>? thisPath = this.path;

    return ParsingError(
      message: message,
      details: details,
      path: <String>[
        key,
        if (thisPath != null) ...thisPath,
      ],
    );
  }

  ParsingError copyWithPath(List<String> path) {
    final List<String>? thisPath = this.path;

    return ParsingError(
      message: message,
      details: details,
      path: <String>[
        ...path,
        if (thisPath != null) ...thisPath,
      ],
    );
  }
}
