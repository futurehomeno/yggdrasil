import 'package:yggdrasil/yggdrasil.dart';

/// An abstract class which combines multiple validators.
///
/// Has the advantage of allowing the combination of multiple validators with
/// different default errors without having to re-test the validation.
abstract class CombinedValidator<T> extends YgInputValidator<T> {
  @override
  String? validate(YgDefaultValidatorErrors defaults, T? value) {
    final List<YgInputValidator<T>> validators = getValidators(defaults, value);

    for (final YgInputValidator<T> validator in validators) {
      final String? result = validator.validate(defaults, value);

      if (result != null) {
        return result;
      }
    }

    return null;
  }

  List<YgInputValidator<T>> getValidators(YgDefaultValidatorErrors defaults, T? value);
}
