import 'package:yggdrasil/yggdrasil.dart';

/// Validates most common email formats.
///
/// See the [_emailRegExp] for more info.
class EmailValidator extends YgTextValidator {
  const EmailValidator({
    this.invalidEmailError,
  });

  /// Regex checking email validity.
  ///
  /// `\s*` is added to check for any number of whitespaces at the end
  /// of an email. This is usually added by autocomplete. Even though
  /// this is not required for email validation, it's added for user
  /// convenience.
  static final RegExp _emailRegExp =
      RegExp(r'^[a-zA-Z0-9.!#$%&’*+\/=?^_`{|}~-]+@([a-zA-Z0-9-]+\.)+[a-zA-Z0-9-]{2,}\s*$');

  /// Error shown when the email is invalid.
  ///
  /// Overrides the default error [YgDefaultValidatorErrors.invalidEmail].
  final String? invalidEmailError;

  @override
  String? validate(YgDefaultValidatorErrors defaults, String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    if (!_emailRegExp.hasMatch(value)) {
      return invalidEmailError ?? defaults.invalidEmail;
    }

    return null;
  }
}
