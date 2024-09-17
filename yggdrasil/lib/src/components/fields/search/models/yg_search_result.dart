import 'package:yggdrasil/src/utils/_utils.dart';

import 'yg_search_result_text.dart';

class YgSearchResult<T> {
  const YgSearchResult({
    required this.title,
    required this.value,
    this.subtitle,
    this.icon,
  });

  final YgSearchResultText title;
  final YgSearchResultText? subtitle;
  final YgIconData? icon;
  final T value;
}
