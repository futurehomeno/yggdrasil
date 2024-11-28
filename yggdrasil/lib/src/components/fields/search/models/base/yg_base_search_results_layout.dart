import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/fields/search/models/base/yg_base_search_result.dart';

class YgBaseSearchResultsLayout<Result extends YgBaseSearchResult> {
  const YgBaseSearchResultsLayout({
    this.leading,
    this.results,
  });

  final Widget? leading;
  final List<Result>? results;
}
