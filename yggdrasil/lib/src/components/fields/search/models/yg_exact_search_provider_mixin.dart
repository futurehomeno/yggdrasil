import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_provider.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_results_layout.dart';
import 'package:yggdrasil/src/utils/yg_match_text/yg_text_match.dart';

import '../interfaces/yg_base_search_item.dart';

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

mixin YgExactSearchSessionMixin<
        Value,
        ResultValue,
        Result extends YgBaseSearchResult,
        ResultsLayout extends YgBaseSearchResultsLayout<Result>,
        Item extends YgBaseSearchItem<Result>,
        Provider extends YgExactSearchProviderInterface<Value, ResultValue, Result, ResultsLayout, Item>>
    on YgBaseSearchSession<Value, ResultValue, Result, ResultsLayout, Provider> {
  @override
  FutureOr<ResultsLayout> buildResults(String query) {
    if (provider.items.isEmpty) {
      return createLayoutFromResultsAndLeading(
        leading: Builder(
          builder: provider.noResultsBuilder,
        ),
        results: null,
      );
    }

    final List<_ResultWithScore<Result>> resultsWithScore = <_ResultWithScore<Result>>[];
    final List<Result> results = <Result>[];

    for (final Item item in provider.items) {
      // Get title index
      final int titleIndex = item.title.indexOf(query);

      // Get subtitle index
      final String? subtitle = item.subtitle;
      final int subtitleIndex;
      if (provider.searchSubtitle && subtitle != null) {
        subtitleIndex = subtitle.indexOf(query);
      } else {
        subtitleIndex = -1;
      }

      // If both have no match, skip item.
      if (titleIndex == -1 && subtitleIndex == -1) {
        continue;
      }

      final double score;
      if (titleIndex == -1) {
        score = subtitleIndex * 2;
      } else if (subtitleIndex == -1 || subtitleIndex > titleIndex) {
        score = titleIndex.toDouble();
      } else {
        score = subtitleIndex * titleIndex * 0.5;
      }

      resultsWithScore.add((
        score: score,
        result: item.createResult(
          titleMatches: <YgTextMatch>[
            if (titleIndex != -1)
              YgTextMatch(
                start: titleIndex,
                end: query.length,
              ),
          ],
          subtitleMatches: <YgTextMatch>[
            if (subtitleIndex != -1)
              YgTextMatch(
                start: subtitleIndex,
                end: query.length,
              ),
          ],
        ),
      ));
    }

    if (resultsWithScore.isEmpty) {
      return createLayoutFromResultsAndLeading(
        leading: Builder(
          builder: provider.noResultsBuilder,
        ),
        results: null,
      );
    }

    resultsWithScore.sort(
      (
        _ResultWithScore<Result> a,
        _ResultWithScore<Result> b,
      ) =>
          a.score.compareTo(b.score),
    );

    for (final _ResultWithScore<Result> resultWithScore in resultsWithScore) {
      results.add(resultWithScore.result);
    }

    final Widget? leading;
    final WidgetBuilder? hintBuilder = provider.hintBuilder;
    if (hintBuilder != null) {
      leading = Builder(
        builder: hintBuilder,
      );
    } else {
      leading = null;
    }

    return createLayoutFromResultsAndLeading(
      results: results,
      leading: leading,
    );
  }

  ResultsLayout createLayoutFromResultsAndLeading({
    required List<Result>? results,
    required Widget? leading,
  });
}

typedef _ResultWithScore<R> = ({
  R result,
  double score,
});
