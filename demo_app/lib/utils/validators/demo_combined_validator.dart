import 'demo_field_validator.dart';

/// An abstract class which combines multiple validators.
///
/// Has the advantage of allowing the combination of multiple validators with
/// different default errors without having to re-test the validation.
abstract class DemoCombinedValidator<T> extends DemoFieldValidator<T> {
  const DemoCombinedValidator();

  /// Allows you to combine multiple validators in to one easily.
  const factory DemoCombinedValidator.combine(
    List<DemoFieldValidator<T>> validators,
  ) = _CombinedValidatorCombine<T>;

  @override
  String? validate(T value) {
    for (final DemoFieldValidator<T> validator in validators) {
      final String? result = validator.validate(value);

      if (result != null) {
        return result;
      }
    }

    return null;
  }

  List<DemoFieldValidator<T>> get validators;
}

class _CombinedValidatorCombine<T> extends DemoCombinedValidator<T> {
  const _CombinedValidatorCombine(this.validators);

  @override
  final List<DemoFieldValidator<T>> validators;
}
