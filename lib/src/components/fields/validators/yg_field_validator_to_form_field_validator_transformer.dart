import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// A class which combines validators and exposes them through the default
/// flutter [FormFieldValidator] interface.
///
/// Primarily used internally in yggdrasil widgets like the [YgTextInput].
class YgInputValidatorToFormFieldValidatorTransformer<T> {
  const YgInputValidatorToFormFieldValidatorTransformer({
    this.validators,
    required this.fieldKey,
  });

  final List<YgInputValidator<T>>? validators;
  final FormFieldKey<T> fieldKey;

  String? call(T? input) {
    final BuildContext? context = fieldKey.currentContext;

    assert(context != null, 'The field key has to be assigned to a field!');
    if (context == null) {
      return null;
    }

    final List<YgInputValidator<T>>? validators = this.validators;

    if (validators == null) {
      return null;
    }

    final YgDefaultValidatorErrorsProvider defaultsProvider = YgDefaultValidatorErrorsProvider.of(context);

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
