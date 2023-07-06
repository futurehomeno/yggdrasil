import '../_validators.dart';

class MinLengthValidator extends TextValidator {
  MinLengthValidator({
    required this.min,
    required this.error,
  });

  final int min;
  final String error;

  @override
  String? validate(String? value) {
    if (value == null) {
      return null;
    }

    if (value.length < min) {
      return error;
    }

    return null;
  }
}
