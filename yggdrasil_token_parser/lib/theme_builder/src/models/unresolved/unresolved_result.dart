import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';

class UnresolvedResult {
  const UnresolvedResult({
    this.errors = const <TokenParseError>[],
    this.result,
  });

  factory UnresolvedResult.merge({
    required List<UnresolvedResult> sources,
    List<TokenParseError> errors = const <TokenParseError>[],
    UnresolvedTokenObject? result,
  }) {
    final List<TokenParseError> allErrors = <TokenParseError>[
      ...errors,
    ];

    for (final UnresolvedResult source in sources) {
      allErrors.addAll(
        source.errors,
      );
    }

    return UnresolvedResult(
      result: result,
      errors: allErrors,
    );
  }

  final UnresolvedTokenObject? result;
  final List<TokenParseError> errors;
}
