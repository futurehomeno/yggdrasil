import '../_validators.dart';

/// Validates a value is not above [max] length.
class MaxLengthValidator extends YgTextValidator {
  const MaxLengthValidator({
    required this.max,
    required this.tooLongError,
  });

  /// The maximum allowed length of the validated text.
  final int max;

  /// The error shown when the text is longer than [max].
  final String tooLongError;

  @override
  String? validate(YgDefaultValidatorErrors defaults, String? value) {
    if (value == null) {
      return null;
    }

    if (value.length > max) {
      return tooLongError;
    }

    return null;
  }
}
