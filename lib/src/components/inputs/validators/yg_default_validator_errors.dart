class YgDefaultValidatorErrors {
  const YgDefaultValidatorErrors({
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
    required this.passwordsDoNotMatch,
    required this.passwordTooShort,
  });

  // region Misc

  final String invalidHubSerial;
  final String invalidEmail;
  final String required;
  final String siteNameTooLong;
  final String invalidZwaveParameterLength;

  // endregion

  // region Doorman Pin Code

  final String doormanPinCodeTooShort;
  final String doormanPinCodeTooLong;

  // endregion

  // region Phone Number

  final String phoneNumberTooShort;
  final String phoneNumberTooLong;
  final String phoneNumberInvalid;

  // endregion

  // region Password

  final String passwordTooShort;
  final String passwordsDoNotMatch;

  // endregion
}
