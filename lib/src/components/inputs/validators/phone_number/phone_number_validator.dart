import 'package:yggdrasil/yggdrasil.dart';

/// Validates phone numbers
///
///
class PhoneNumberValidator extends TextValidator {
  const PhoneNumberValidator({
    required this.withCountryCode,
    this.tooLongError,
    this.tooShortError,
    this.invalidError,
  });

  final String? tooShortError;
  final String? tooLongError;
  final String? invalidError;
  final bool withCountryCode;

  @override
  String? validate(YgDefaultValidatorErrors defaults, String? value) {
    if (value == null) {
      return null;
    }

    /// Get the length of the phone number, not including spaces and +.
    final int numbers = value.replaceAll(RegExp(r'[^\d]'), '').length;

    if (numbers < 6) {
      return defaults.phoneNumberTooShort;
    }

    if (numbers > 15) {
      return defaults.phoneNumberTooLong;
    }

    // Don't allow other characters than digits, + and spaces. Also do not allow
    // more than one space in a row.
    final RegExp regExp = RegExp(withCountryCode ? r'^\+?(?:\d ?)+$' : r'^(?:\d ?)+$');

    if (!regExp.hasMatch(value)) {
      return invalidError ?? defaults.phoneNumberInvalid;
    }

    return null;
  }
}
