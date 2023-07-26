import 'package:yggdrasil/yggdrasil.dart';

class ConfirmValidator<T> extends YgInputValidator<T> {
  ConfirmValidator({
    required this.getOtherValue,
    required this.error,
  });

  final T Function() getOtherValue;
  final String error;

  @override
  String? validate(YgDefaultValidatorErrors defaults, T? value) {
    final T otherValue = getOtherValue();

    if (otherValue != value) {
      return error;
    }
    return null;
  }
}
