import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_item.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_provider.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_results_layout.dart';

abstract class YgFuzzySearchProviderInterface<
    Value,
    ResultValue,
    Result extends YgBaseSearchResult,
    ResultsLayout extends YgBaseSearchResultsLayout<Result>,
    Item extends YgBaseSearchItem<Result>> implements YgBaseSearchProvider<Value, ResultValue, Result, ResultsLayout> {
  const YgFuzzySearchProviderInterface({
    required this.hintBuilder,
    required this.items,
    required this.noResultsBuilder,
    required this.searchSubtitle,
    required this.threshold,
  });

  final bool searchSubtitle;
  final List<Item> items;
  final double threshold;
  final WidgetBuilder? hintBuilder;
  final WidgetBuilder noResultsBuilder;
}
