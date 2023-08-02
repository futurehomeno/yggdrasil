import '../_validators.dart';

class MinLengthValidator extends YgTextValidator {
  const MinLengthValidator({
    required this.min,
    required this.tooShortError,
  });

  final int min;
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
