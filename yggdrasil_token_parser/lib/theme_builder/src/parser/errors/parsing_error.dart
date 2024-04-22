class ParsingError {
  const ParsingError({
    required this.message,
    this.details,
    this.path,
  });

  const ParsingError.dataType({
    required Type expected,
    required Type actual,
    this.details,
    this.path,
  }) : message = 'TypeError: Expected to find $expected but found $actual instead.';

  ParsingError.dataTypes({
    required List<Type> expected,
    required Type actual,
    this.details,
    this.path,
  }) : message = 'TypeError: Expected to find any of ${expected.join(', ')} but found $actual instead.';

  const ParsingError.format({
    required Object data,
    this.details,
    this.path,
  }) : message = 'FormatError: Invalid data format: $data';

  const ParsingError.conflict({
    this.details,
    this.path,
  }) : message = 'Conflict';

  final String message;
  final String? details;
  final List<String>? path;
}
