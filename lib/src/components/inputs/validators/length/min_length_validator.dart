import '../_validators.dart';

class MinLengthValidator extends TextValidator {
  const MinLengthValidator({
    required this.min,
    required this.toShortError,
  });

  final int min;
  final String toShortError;

  @override
  String? validate(YgDefaultValidatorErrors defaults, String? value) {
    if (value == null) {
      return null;
    }

    if (value.length < min) {
      return toShortError;
    }

    return null;
  }
}
