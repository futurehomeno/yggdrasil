import 'yg_input_validator.dart';

class YgInputValidatorCombiner<T> {
  const YgInputValidatorCombiner({
    this.validators,
  });

  final List<YgInputValidator<T>>? validators;

  String? call(T? input) {
    final List<YgInputValidator<T>>? validators = this.validators;

    if (validators == null) {
      return null;
    }

    for (final YgInputValidator<T> validator in validators) {
      final String? error = validator.validate(input);

      if (error != null) {
        return error;
      }
    }

    return null;
  }
}
