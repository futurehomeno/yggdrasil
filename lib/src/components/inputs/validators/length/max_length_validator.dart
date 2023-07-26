import '../_validators.dart';

class MaxLengthValidator extends TextValidator {
  MaxLengthValidator({
    required this.max,
    required this.error,
  });

  final int max;
  final String error;

  @override
  String? validate(YgDefaultValidatorErrors defaults, String? value) {
    if (value == null) {
      return null;
    }

    if (value.length > max) {
      return error;
    }

    return null;
  }
}
