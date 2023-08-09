import '../_validators.dart';

class MinLengthValidator extends YgTextValidator {
  const MinLengthValidator({
    required this.min,
    required this.tooShortError,
  });

  /// The minimum allowed length of the validated text.
  final int min;

  /// The error shown when the text is longer than [min].
  final String tooShortError;

  @override
  String? validate(YgDefaultValidatorErrors defaults, String? value) {
    if (value == null) {
      return null;
    }

    if (value.length < min) {
      return tooShortError;
    }

    return null;
  }
}
