import '../_validators.dart';

class EmptyValidator extends TextValidator {
  EmptyValidator(this.errorMessage);

  final String errorMessage;

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return errorMessage;
    }

    return null;
  }
}
