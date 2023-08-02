import 'package:yggdrasil/yggdrasil.dart';

/// Validates that the value of the field is equal to the value of another field.
class MatchValidator<T> extends YgInputValidator<T> {
  const MatchValidator({
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
