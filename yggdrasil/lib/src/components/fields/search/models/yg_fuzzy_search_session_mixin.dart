import 'dart:async';

import 'package:fuzzy/bitap/data/match_index.dart' as fuzzy;
import 'package:fuzzy/data/result.dart' as fuzzy;
import 'package:fuzzy/fuzzy.dart' as fuzzy;
import 'package:yggdrasil/src/components/fields/search/models/string_search/yg_string_search_item.dart';
import 'package:yggdrasil/src/components/fields/search/models/string_search/yg_string_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/models/yg_base_search_provider.dart';
import 'package:yggdrasil/src/utils/yg_match_text/yg_text_match.dart';

abstract class YgFuzzySearchProviderInterface<Value, Item extends YgStringSearchItem,
    Result extends YgStringSearchResult> implements YgBaseSearchProvider<Value, Result> {
  bool get searchSubtitle;
  List<Item> get items;
  double get threshold;
}

mixin YgFuzzySearchSessionMixin<Value, Item extends YgStringSearchItem, Result extends YgStringSearchResult,
        Provider extends YgFuzzySearchProviderInterface<Value, Item, Result>>
    on YgBaseSearchSession<Value, Result, Provider> {
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
  FutureOr<List<Result>?> buildResults(String query) {
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
        createResultFromMatches(
          item: result.item,
          titleMatches: titleMatches,
          subtitleMatches: subtitleMatches,
        ),
      );
    }

    return mappedResults;
  }

  Result createResultFromMatches({
    required Item item,
    required List<YgTextMatch> titleMatches,
    required List<YgTextMatch>? subtitleMatches,
  });
}
