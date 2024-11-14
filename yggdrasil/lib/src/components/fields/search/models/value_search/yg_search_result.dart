import '../string_search/yg_string_search_result.dart';

/// A result for a [YgSearchWidget].
class YgSearchResult<T> extends YgStringSearchResult {
  const YgSearchResult({
    required super.title,
    required this.value,
    super.icon,
    super.subtitle,
  });

  /// The value which is passed to [YgSearchWidget.].
  ///
  /// This value is what you will get back from the [YgSearchWidget.onChange]
  /// when this entry is selected.
  final T value;
}
