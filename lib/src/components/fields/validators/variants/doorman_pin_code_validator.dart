import 'package:yggdrasil/yggdrasil.dart';

/// Validates that a doorman pin code is exactly 6 characters.
class DoormanPinCodeValidator extends YgCombinedValidator<String> {
  const DoormanPinCodeValidator({
    this.pinCodeTooLongError,
    this.pinCodeTooShortError,
  });

  /// The error shown when the pin code is too long.
  ///
  /// Overrides the default error [YgDefaultValidatorErrors.doormanPinCodeTooLong].
  final String? pinCodeTooLongError;

  /// The error shown when the pin code is too short.
  ///
  /// Overrides the default error [YgDefaultValidatorErrors.doormanPinCodeTooShort].
  final String? pinCodeTooShortError;

  @override
  List<YgFieldValidator<String>> getValidators(
    YgDefaultValidatorErrors defaults,
    String? value,
  ) {
    return <YgFieldValidator<String>>[
      MaxLengthValidator(
        max: 6,
        tooLongError: pinCodeTooLongError ?? defaults.doormanPinCodeTooLong,
      ),
      MinLengthValidator(
        min: 6,
        tooShortError: pinCodeTooShortError ?? defaults.doormanPinCodeTooShort,
      ),
    ];
  }
}
