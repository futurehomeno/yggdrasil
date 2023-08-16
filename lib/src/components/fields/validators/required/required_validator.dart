import '../_validators.dart';

/// Validates the input is not null or an empty string.
class RequiredValidator extends YgTextValidator {
  const RequiredValidator({
    this.requiredError,
  });

  /// The error shown when the input is null or an empty string.
  ///
  /// Overrides the default error [YgDefaultValidatorErrors.required].
  final String? requiredError;

  @override
  String? validate(YgDefaultValidatorErrors defaults, String? value) {
    if (value == null || value.isEmpty) {
      return requiredError ?? defaults.required;
    }

    return null;
  }
}
