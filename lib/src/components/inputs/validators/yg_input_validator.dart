import '_validators.dart';

typedef TextValidator = InputValidator<String>;
typedef NumberValidator = InputValidator<num>;

abstract class InputValidator<T> {
  const InputValidator();

  String? validate(YgDefaultValidatorErrors defaults, T? value);
}
