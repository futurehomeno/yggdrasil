import '../_validators.dart';

class RequiredValidator extends TextValidator {
  RequiredValidator({
    this.error,
  });

  final String? error;

  @override
  String? validate(YgDefaultValidatorErrors defaults, String? value) {
    if (value == null || value.isEmpty) {
      return error ?? defaults.required(value);
    }

    return null;
  }
}
