import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// A [RestorableProperty] that knows how to store and restore a
/// [YgSearchController].
///
/// The [YgSearchController] is accessible via the [value] getter. During
/// state restoration, the property will restore [YgSearchController.text] to
/// the value it had when the restoration data it is getting restored from was
/// collected.
class YgRestorableValueSearchController<T> extends RestorableChangeNotifier<YgValueSearchController<T>> {
  /// Creates a [YgRestorableValueSearchController].
  ///
  /// This constructor treats a null `text` argument as if it were the empty
  /// string.
  YgRestorableValueSearchController({T? value})
      : _initialTextValue = TextEditingValue.empty,
        _initialResults = null,
        _initialValue = value;

  /// Creates a [YgRestorableValueSearchController] from an initial
  /// [TextEditingValue].
  ///
  /// This constructor treats a null `value` argument as if it were
  /// [TextEditingValue.empty].
  YgRestorableValueSearchController.fromValue({
    T? value,
    TextEditingValue? textValue,
    List<YgSearchResult<T>>? results,
  })  : _initialTextValue = textValue,
        _initialResults = results,
        _initialValue = value;

  final TextEditingValue? _initialTextValue;
  final List<YgSearchResult<T>>? _initialResults;
  final T? _initialValue;

  @override
  YgValueSearchController<T> createDefaultValue() {
    return YgValueSearchController<T>.fromValue(
      results: _initialResults,
      textValue: _initialTextValue,
      value: _initialValue,
    );
  }

  @override
  YgValueSearchController<T> fromPrimitives(Object? data) {
    return YgValueSearchController<T>(text: data! as String);
  }

  @override
  Object toPrimitives() {
    return value.text;
  }
}
