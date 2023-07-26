import 'package:yggdrasil/yggdrasil.dart';

class ConfirmValidator<T> extends InputValidator<T> {
  ConfirmValidator({
    required this.otherKeyField,
    required this.error,
  });

  final FormFieldKey<T> otherKeyField;
  final String error;

  @override
  String? validate(YgDefaultValidatorErrors defaults, T? value) {
    final T? otherValue = otherKeyField.value;

    if (otherValue != value) {
      return error;
    }
    return null;
  }
}
