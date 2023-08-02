import 'package:yggdrasil/yggdrasil.dart';

/// Validates phone numbers
///
/// Assumes phone number has at least 6 and no more
/// than 15 digits.
///
/// When [withCountryCode] is set to true a leading + is accepted.
///
/// Will provider default errors for [tooShortError], [tooLongError] and
/// [invalidError] if no custom error is specified.
///
/// Look at [YgDefaultValidatorErrors] and [YgDefaultValidatorErrorsProvider]
/// for more info regarding default errors.
class PhoneNumberValidator extends YgTextValidator {
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
      return tooShortError ?? defaults.phoneNumberTooShort;
    }

    if (numbers > 15) {
      return tooLongError ?? defaults.phoneNumberTooLong;
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
