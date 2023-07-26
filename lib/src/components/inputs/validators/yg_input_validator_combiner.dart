import 'package:flutter/material.dart';

import 'yg_default_validator_errors_provider.dart.dart';
import 'yg_input_validator.dart';

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
