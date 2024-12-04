import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_result.dart';

/// Search result used for both simple and advanced search providers.
class YgSearchResult<ResultValue> extends YgBaseSearchResult {
  const YgSearchResult({
    required super.title,
    required this.value,
    super.icon,
    super.subtitle,
  });

  /// The value of the search result.
  ///
  /// In the case of a simple search provider this value represents the final
  /// value of the search widget, in the case of an advanced search provider
  /// this value is used to fetch the final value.
  final ResultValue value;
}
