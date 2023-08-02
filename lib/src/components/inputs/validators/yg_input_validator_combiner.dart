import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// A class which combines transforms validators to the default flutter interface.
///
/// Primarily used internally in yggdrasil widgets like the [YgTextInput].
class YgInputValidatorCombiner<T> {
  const YgInputValidatorCombiner({
    this.validators,
    required this.getContext,
  });

  final List<YgInputValidator<T>>? validators;
  final BuildContext Function() getContext;

  String? call(T? input) {
    final BuildContext context = getContext();

    final List<YgInputValidator<T>>? validators = this.validators;

    final YgDefaultValidatorErrorsProvider defaultsProvider = YgDefaultValidatorErrorsProvider.of(context);

    if (validators == null) {
      return null;
    }

    for (final YgInputValidator<T> validator in validators) {
      final String? error = validator.validate(
        defaultsProvider.defaultErrors,
        input,
      );

      if (error != null) {
        return error;
      }
    }

    return null;
  }
}
