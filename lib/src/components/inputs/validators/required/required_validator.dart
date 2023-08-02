import '../_validators.dart';

class RequiredValidator extends YgTextValidator {
  const RequiredValidator({
    this.requiredError,
  });

  final String? requiredError;

  @override
  String? validate(YgDefaultValidatorErrors defaults, String? value) {
    if (value == null || value.isEmpty) {
      return requiredError ?? defaults.required;
    }

    return null;
  }
}
