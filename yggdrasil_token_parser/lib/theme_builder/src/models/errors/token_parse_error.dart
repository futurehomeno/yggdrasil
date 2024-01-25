class TokenParseError extends Error {
  TokenParseError({
    required this.error,
    required this.path,
  });

  final String error;
  final List<String> path;

  @override
  String toString() {
    return 'Error: $error\nError occurred while parsing $path';
  }

  TokenParseError copyWithPath(List<String> path) {
    return TokenParseError(
      error: error,
      path: <String>[
        ...this.path,
        ...path,
      ],
    );
  }
}
