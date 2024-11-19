import 'dart:async';

import 'package:yggdrasil/src/components/fields/search/models/string_search/yg_string_search_item.dart';
import 'package:yggdrasil/src/components/fields/search/models/string_search/yg_string_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/models/yg_base_search_provider.dart';
import 'package:yggdrasil/src/utils/yg_match_text/yg_text_match.dart';

abstract class YgExactSearchProviderInterface<Value, Item extends YgStringSearchItem,
    Result extends YgStringSearchResult> implements YgBaseSearchProvider<Value, Result> {
  bool get searchSubtitle;
  List<Item> get items;
}

mixin YgExactSearchSessionMixin<Value, Item extends YgStringSearchItem, Result extends YgStringSearchResult,
        Provider extends YgExactSearchProviderInterface<Value, Item, Result>>
    on YgBaseSearchSession<Value, Result, Provider> {
  @override
  FutureOr<List<Result>?> buildResults(String query) {
    final List<_ResultWithScore<Result>> results = <_ResultWithScore<Result>>[];

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

      results.add((
        score: score,
        result: createResultFromMatches(
          item: item,
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

    results.sort(
      (
        _ResultWithScore<Result> a,
        _ResultWithScore<Result> b,
      ) =>
          a.score.compareTo(b.score),
    );

    return results.map((_ResultWithScore<Result> entry) => entry.result).toList();
  }

  Result createResultFromMatches({
    required Item item,
    required List<YgTextMatch> titleMatches,
    required List<YgTextMatch>? subtitleMatches,
  });
}

typedef _ResultWithScore<R> = ({
  R result,
  double score,
});
