// ignore_for_file: avoid-generics-shadowing

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:fuzzy/bitap/data/match_index.dart' as fuzzy;
import 'package:fuzzy/data/result.dart' as fuzzy;
import 'package:fuzzy/fuzzy.dart' as fuzzy;
import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_item.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_provider.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_results_layout.dart';
import 'package:yggdrasil/src/extensions/safe_build_extension.dart';
import 'package:yggdrasil/src/utils/yg_match_text/yg_text_match.dart';

import 'yg_fuzzy_search_provider_interface.dart';

mixin YgFuzzySearchSessionMixin<
        Value,
        ResultValue,
        Result extends YgBaseSearchResult,
        ResultsLayout extends YgBaseSearchResultsLayout<Result>,
        Item extends YgBaseSearchItem<Result>,
        Provider extends YgFuzzySearchProviderInterface<Value, ResultValue, Result, ResultsLayout, Item>>
    on YgBaseSearchSession<Value, ResultValue, Result, ResultsLayout, Provider> {
  static const String _titleKey = 'title';
  static const String _subtitleKey = 'subtitle';

  late final fuzzy.Fuzzy<Item> _fuzzy = fuzzy.Fuzzy<Item>(
    provider.items,
    options: fuzzy.FuzzyOptions<Item>(
      keys: <fuzzy.WeightedKey<Item>>[
        fuzzy.WeightedKey<Item>(
          name: _titleKey,
          getter: (Item item) => item.title,
          weight: 1,
        ),
        if (provider.searchSubtitle)
          fuzzy.WeightedKey<Item>(
            name: _subtitleKey,
            getter: (Item item) => item.subtitle ?? '',
            weight: 0.5,
          ),
      ],
      threshold: provider.threshold,
    ),
  );

  @override
  FutureOr<ResultsLayout> buildResultsLayout(String query) {
    if (query.isEmpty && provider.requireQuery) {
      final WidgetBuilder? builder = provider.hintBuilder;

      return createLayoutFromResultsAndLeading(
        leading: builder.safeBuild(
          (WidgetBuilder builder) {
            return Builder(
              builder: builder,
            );
          },
        ),
        results: null,
      );
    }

    if (provider.items.isEmpty) {
      return createLayoutFromResultsAndLeading(
        leading: Builder(
          builder: provider.noResultsBuilder,
        ),
        results: null,
      );
    }

    final List<fuzzy.Result<Item>> results = _fuzzy.search(query);
    final List<Result> mappedResults = <Result>[];

    for (final fuzzy.Result<Item> result in results) {
      final List<YgTextMatch> titleMatches = <YgTextMatch>[];
      final List<YgTextMatch> subtitleMatches = <YgTextMatch>[];

      for (final fuzzy.ResultDetails<Item> match in result.matches) {
        for (final fuzzy.MatchIndex index in match.matchedIndices) {
          final YgTextMatch mappedMatch = YgTextMatch(
            start: index.start,
            end: index.end + 1,
          );

          if (match.key == _titleKey) {
            titleMatches.add(mappedMatch);
          } else if (match.key == _subtitleKey) {
            subtitleMatches.add(mappedMatch);
          }
        }
      }

      mappedResults.add(
        result.item.createResult(
          titleMatches: titleMatches,
          subtitleMatches: subtitleMatches,
        ),
      );
    }

    final Widget? leading;
    final WidgetBuilder? hintBuilder = provider.hintBuilder;
    if (mappedResults.isEmpty) {
      leading = Builder(
        builder: provider.noResultsBuilder,
      );
    } else if (hintBuilder != null) {
      leading = Builder(
        builder: hintBuilder,
      );
    } else {
      leading = null;
    }

    return createLayoutFromResultsAndLeading(
      results: mappedResults,
      leading: leading,
    );
  }

  ResultsLayout createLayoutFromResultsAndLeading({
    required List<Result>? results,
    required Widget? leading,
  });
}
