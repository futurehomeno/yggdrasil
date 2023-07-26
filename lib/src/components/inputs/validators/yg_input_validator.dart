import '_validators.dart';

abstract class YgInputValidator<T> {
  const YgInputValidator();

  String? validate(YgDefaultValidatorErrors defaults, T? value);
}
