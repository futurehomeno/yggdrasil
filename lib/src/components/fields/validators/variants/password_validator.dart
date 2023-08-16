import 'package:yggdrasil/src/components/fields/validators/_validators.dart';

/// Validates that a password is at least 8 characters long.
class PasswordValidator extends CombinedValidator<String> {
  const PasswordValidator({
    this.passwordTooShortError,
  });

  /// The error shown when the password is shorter than 8 characters.
  ///
  /// Overrides the default error [YgDefaultValidatorErrors.passwordTooShort].
  final String? passwordTooShortError;

  @override
  List<YgTextValidator> getValidators(YgDefaultValidatorErrors defaults, String? value) {
    return <YgTextValidator>[
      MinLengthValidator(
        min: 8,
        tooShortError: passwordTooShortError ?? defaults.passwordTooShort,
      ),
    ];
  }
}
