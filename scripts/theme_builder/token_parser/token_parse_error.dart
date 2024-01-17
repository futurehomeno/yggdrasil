class TokenParseError extends Error {
  TokenParseError({
    required this.type,
    required this.path,
    required this.error,
  });

  final String type;
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
