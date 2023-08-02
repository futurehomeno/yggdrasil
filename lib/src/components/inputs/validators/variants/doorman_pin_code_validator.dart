import 'package:yggdrasil/yggdrasil.dart';

/// Validates that a site name is not empty and at maximum 30 characters.
class DoormanPicCodeValidator extends CombinedValidator<String> {
  const DoormanPicCodeValidator({
    this.pinCodeTooLongError,
    this.pinCodeTooShortError,
  });

  final String? pinCodeTooLongError;
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
