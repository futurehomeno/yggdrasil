import 'package:yggdrasil/yggdrasil.dart';

/// An abstract class which combines multiple validators.
///
/// Has the advantage of allowing the combination of multiple validators with
/// different default errors without having to re-test the validation.
abstract class YgCombinedValidator<T> extends YgFieldValidator<T> {
  const YgCombinedValidator();
  @override
  String? validate(YgDefaultValidatorErrors defaults, T? value) {
    final List<YgFieldValidator<T>> validators = getValidators(defaults, value);

    for (final YgFieldValidator<T> validator in validators) {
      final String? result = validator.validate(defaults, value);

      if (result != null) {
        return result;
      }
    }

    return null;
  }

  List<YgFieldValidator<T>> getValidators(YgDefaultValidatorErrors defaults, T? value);
}
