import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_result.dart';

/// A result for a [YgSearchWidget].
class YgSearchResult<ResultValue> extends YgBaseSearchResult {
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
  final ResultValue value;
}
