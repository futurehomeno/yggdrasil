import 'package:yggdrasil/yggdrasil.dart';

/// Validates password is equal to a password in another field.
class PasswordConfirmValidator extends CombinedValidator<String> {
  const PasswordConfirmValidator({
    this.passwordsDoNotMatchError,
    required this.otherPasswordFieldKey,
  });

  /// The error shown when the value of the [otherPasswordFieldKey] is not equal
  /// to the value of this field.
  ///
  /// Overrides the default error [YgDefaultValidatorErrors.passwordsDoNotMatch].
  final String? passwordsDoNotMatchError;

  /// The key used of the other field this fields value should be equal to.
  final TextFieldKey otherPasswordFieldKey;

  @override
  List<YgTextValidator> getValidators(YgDefaultValidatorErrors defaults, String? value) {
    return <YgTextValidator>[
      MatchValidator<String>(
        otherFieldKey: otherPasswordFieldKey,
        error: passwordsDoNotMatchError ?? defaults.passwordsDoNotMatch,
      )
    ];
  }
}
