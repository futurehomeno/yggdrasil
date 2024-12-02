import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_provider.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_results_layout.dart';

import '../yg_base_search_item.dart';

abstract class YgExactSearchProviderInterface<
    Value,
    ResultValue,
    Result extends YgBaseSearchResult,
    ResultsLayout extends YgBaseSearchResultsLayout<Result>,
    Item extends YgBaseSearchItem<Result>> implements YgBaseSearchProvider<Value, ResultValue, Result, ResultsLayout> {
  const YgExactSearchProviderInterface({
    required this.hintBuilder,
    required this.items,
    required this.noResultsBuilder,
    required this.searchSubtitle,
  });

  final bool searchSubtitle;
  final List<Item> items;
  final WidgetBuilder? hintBuilder;
  final WidgetBuilder noResultsBuilder;
}
