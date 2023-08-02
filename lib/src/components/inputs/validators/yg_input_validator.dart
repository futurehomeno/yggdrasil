import '_validators.dart';

typedef YgTextValidator = YgInputValidator<String>;
typedef YgNumberValidator = YgInputValidator<num>;

abstract class YgInputValidator<T> {
  const YgInputValidator();

  String? validate(YgDefaultValidatorErrors defaults, T? value);
}
