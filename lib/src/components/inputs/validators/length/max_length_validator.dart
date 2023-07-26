import '../_validators.dart';

class MaxLengthValidator extends TextValidator {
  const MaxLengthValidator({
    required this.max,
    required this.tooLongError,
  });

  final int max;
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
