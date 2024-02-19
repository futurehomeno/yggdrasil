import 'demo_field_validator.dart';

/// Validates a certain amount of items are selected.
class DemoMultiSelectMaxItemsValidator extends DemoFieldValidator<Set<Object?>?> {
  const DemoMultiSelectMaxItemsValidator({
    required this.tooManyItemsError,
    required this.maxItems,
  }) : assert(
          maxItems > 1,
          'maxItems has to be at least 2',
        );

  /// Error shown when more than [maxItems] amount of items are selected.
  final String tooManyItemsError;

  /// The minimum amount of items that have to be selected.
  ///
  /// !-- WARNING --
  /// Has to be at least 2, if you want only one selectable item, use a single
  /// select instead.
  final int maxItems;

  @override
  String? validate(Set<Object?>? value) {
    if (value == null) {
      return null;
    }

    if (value.length > maxItems) {
      return tooManyItemsError;
    }

    return null;
  }
}
