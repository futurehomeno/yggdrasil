import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_item.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_provider.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_results_layout.dart';

/// Internal interface for providing fuzzy search.
abstract class YgFuzzySearchProviderInterface<
    Value,
    ResultValue,
    Result extends YgBaseSearchResult,
    ResultsLayout extends YgBaseSearchResultsLayout<Result>,
    Item extends YgBaseSearchItem<Result>> implements YgBaseSearchProvider<Value, ResultValue, Result, ResultsLayout> {
  const YgFuzzySearchProviderInterface({
    required this.items,
    required this.noResultsBuilder,
    this.subtitleWeight = 0,
    this.threshold = 0.4,
    this.requireQuery = true,
    this.hintBuilder,
  });

  /// The weight of the subtitle in the search results.
  ///
  /// When the weight is 0 or less the subtitle is completely ignored. If there
  /// is no subtitle, this does nothing.
  final double subtitleWeight;

  /// Whether there should be a query in order for there to be results.
  ///
  /// If this is false this will return all items if there is no query. By
  /// default this will not return any results if there is no query.
  final bool requireQuery;

  /// The items which the user can search through.
  ///
  /// By default the user can only search for the title of the item, if
  /// [subtitleWeight] is true the user can also search through the subtitle of
  /// an item.
  final List<Item> items;

  /// The minimum accuracy of the results.
  ///
  /// A threshold of '0.0' requires a perfect match (of both letters and
  /// location), a threshold of '1.0' would match anything.
  final double threshold;

  /// Builds an optional hint widget.
  ///
  /// Will only be called if there are results, if there are non,
  /// [noResultsBuilder] will be called instead.
  final WidgetBuilder? hintBuilder;

  /// Builds the no results view.
  final WidgetBuilder noResultsBuilder;
}
