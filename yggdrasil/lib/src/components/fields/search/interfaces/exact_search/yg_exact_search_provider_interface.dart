import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_provider.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_results_layout.dart';

import '../yg_base_search_item.dart';

/// Internal interface for providing exact search.
abstract class YgExactSearchProviderInterface<
    Value,
    ResultValue,
    Result extends YgBaseSearchResult,
    ResultsLayout extends YgBaseSearchResultsLayout<Result>,
    Item extends YgBaseSearchItem<Result>> implements YgBaseSearchProvider<Value, ResultValue, Result, ResultsLayout> {
  const YgExactSearchProviderInterface({
    required this.items,
    required this.noResultsBuilder,
    this.searchSubtitle = false,
    this.requireQuery = true,
    this.hintBuilder,
  });

  /// Whether to search for a match in the subtitle.
  final bool searchSubtitle;

  /// The items which the user can search through.
  ///
  /// By default, the user can only search for the title of the item. If
  /// [searchSubtitle] is true, the user can also search through the subtitle of
  /// an item.
  final List<Item> items;

  /// Builds an optional hint widget.
  ///
  /// Will only be called if there are results. If there are none,
  /// [noResultsBuilder] will be called instead.
  final WidgetBuilder? hintBuilder;

  /// Builds the no results view.
  final WidgetBuilder noResultsBuilder;

  /// Whether there should be a query in order for there to be results.
  ///
  /// If this is false, this will return all items if there is no query. By
  /// default, this will not return any results if there is no query.
  final bool requireQuery;
}
