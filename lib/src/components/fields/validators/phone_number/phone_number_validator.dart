import 'package:yggdrasil/yggdrasil.dart';

/// Validates phone numbers
///
/// Assumes phone number has at least 6 and no more
/// than 15 digits.
class PhoneNumberValidator extends YgTextValidator {
  const PhoneNumberValidator({
    required this.withCountryCode,
    this.tooLongError,
    this.tooShortError,
    this.invalidError,
  });

  /// The error shown when the phone number is too short.
  ///
  /// Overrides the default error [YgDefaultValidatorErrors.phoneNumberTooShort].
  final String? tooShortError;

  /// The error shown when the phone number is too long.
  ///
  /// Overrides the default error [YgDefaultValidatorErrors.phoneNumberTooLong].
  final String? tooLongError;

  /// The error shown when the phone number is not valid.
  ///
  /// Overrides the default error [YgDefaultValidatorErrors.phoneNumberInvalid].
  final String? invalidError;

  /// Whether the phone number can have an country code.
  ///
  /// Effectively only means a leading + is accepted.
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
