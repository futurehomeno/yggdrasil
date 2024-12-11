import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_result.dart';

/// Search result for string search providers.
class YgStringSearchResult extends YgBaseSearchResult {
  const YgStringSearchResult({
    required super.title,
    super.icon,
    super.subtitle,
  });
}
