import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// A [RestorableProperty] that knows how to store and restore a
/// [YgSearchController].
///
/// The [YgSearchController] is accessible via the [value] getter. During
/// state restoration, the property will restore [YgSearchController.text] to
/// the value it had when the restoration data it is getting restored from was
/// collected.
class YgRestorableSearchController<T> extends RestorableChangeNotifier<YgSearchController<T>> {
  /// Creates a [YgRestorableSearchController].
  ///
  /// This constructor treats a null `text` argument as if it were the empty
  /// string.
  YgRestorableSearchController({String? text})
      : _initialValue = text == null ? TextEditingValue.empty : TextEditingValue(text: text),
        _initialResults = null;

  /// Creates a [YgRestorableSearchController] from an initial
  /// [TextEditingValue].
  ///
  /// This constructor treats a null `value` argument as if it were
  /// [TextEditingValue.empty].
  YgRestorableSearchController.fromValue({
    TextEditingValue? value,
    List<YgSearchResult<T>>? results,
  })  : _initialValue = value,
        _initialResults = results;

  final TextEditingValue? _initialValue;
  final List<YgSearchResult<T>>? _initialResults;

  @override
  YgSearchController<T> createDefaultValue() {
    return YgSearchController<T>.fromValue(
      results: _initialResults,
      textValue: _initialValue,
    );
  }

  @override
  YgSearchController<T> fromPrimitives(Object? data) {
    return YgSearchController<T>(text: data! as String);
  }

  @override
  Object toPrimitives() {
    return value.text;
  }
}
