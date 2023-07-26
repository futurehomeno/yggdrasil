import 'package:yggdrasil/yggdrasil.dart';

/// Validates that a site name is not empty and at maximum 30 characters.
class DoormanPicCodeValidator extends CombinedValidator<String> {
  @override
  List<YgInputValidator<String>> getValidators(
    YgDefaultValidatorErrors defaults,
    String? value,
  ) {
    return <YgInputValidator<String>>[
      MaxLengthValidator(
        max: 6,
        error: defaults.doormanPinCodeTooLong(value),
      ),
      MinLengthValidator(
        min: 6,
        error: defaults.doormanPinCodeTooShort(value),
      )
    ];
  }
}
