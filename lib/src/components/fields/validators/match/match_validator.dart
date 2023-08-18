import 'package:yggdrasil/yggdrasil.dart';

/// Validates that the value of the field is equal to the value of another field.
class MatchValidator<T> extends YgFieldValidator<T> {
  const MatchValidator({
    required this.otherFieldKey,
    required this.error,
  });

  /// The key of the other field this fields value should be equal to.
  final FormFieldKey<T> otherFieldKey;

  /// The error shown when the value of this field is not the same as the value
  /// of the [otherFieldKey].
  final String error;

  @override
  String? validate(YgDefaultValidatorErrors defaults, T? value) {
    final T? otherValue = otherFieldKey.value;

    if (otherValue != value) {
      return error;
    }

    return null;
  }
}
