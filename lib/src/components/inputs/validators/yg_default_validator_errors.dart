typedef Error<T> = String Function(T? value);
typedef TextError = Error<String>;

class YgDefaultValidatorErrors {
  YgDefaultValidatorErrors({
    required this.invalidEmail,
    required this.required,
    required this.invalidHubSerial,
    required this.siteNameTooLong,
    required this.doormanPinCodeTooLong,
    required this.doormanPinCodeTooShort,
    required this.invalidZwaveParameterLength,
    required this.phoneNumberInvalid,
    required this.phoneNumberTooLong,
    required this.phoneNumberTooShort,
  });

  // region Misc

  final TextError invalidHubSerial;
  final TextError invalidEmail;
  final TextError required;
  final TextError siteNameTooLong;
  final TextError invalidZwaveParameterLength;

  // endregion

  // region Doorman Pin Code

  final TextError doormanPinCodeTooShort;
  final TextError doormanPinCodeTooLong;

  // endregion

  // region Phone Number

  final TextError phoneNumberTooShort;
  final TextError phoneNumberTooLong;
  final TextError phoneNumberInvalid;

  // endregion
}
