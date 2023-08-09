import 'package:yggdrasil/yggdrasil.dart';

/// Validates that a site name is not empty and at maximum 30 characters.
class DoormanPicCodeValidator extends CombinedValidator<String> {
  const DoormanPicCodeValidator({
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
  List<YgInputValidator<String>> getValidators(
    YgDefaultValidatorErrors defaults,
    String? value,
  ) {
    return <YgInputValidator<String>>[
      MaxLengthValidator(
        max: 6,
        tooLongError: pinCodeTooLongError ?? defaults.doormanPinCodeTooLong,
      ),
      MinLengthValidator(
        min: 6,
        tooShortError: pinCodeTooShortError ?? defaults.doormanPinCodeTooShort,
      )
    ];
  }
}
