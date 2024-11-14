import 'dart:async';

import 'package:yggdrasil/yggdrasil.dart';

mixin YgExactSearchProviderMixin<T extends YgStringSearchItem, R extends YgStringSearchResult>
    on YgStringSearchProvider {
  bool get searchSubtitle;
  List<T> get items;

  @override
  FutureOr<List<R>?> buildResults(String query) {
    final List<_ResultWithScore<R>> results = <_ResultWithScore<R>>[];

    for (final T item in items) {
      // Get title index
      final int titleIndex = item.title.indexOf(query);

      // Get subtitle index
      final String? subtitle = item.subtitle;
      final int subtitleIndex;
      if (searchSubtitle && subtitle != null) {
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
        _ResultWithScore<R> a,
        _ResultWithScore<R> b,
      ) =>
          a.score.compareTo(b.score),
    );

    return results.map((_ResultWithScore<R> entry) => entry.result).toList();
  }

  R createResultFromMatches({
    required T item,
    required List<YgTextMatch> titleMatches,
    required List<YgTextMatch>? subtitleMatches,
  });
}

typedef _ResultWithScore<R> = ({
  R result,
  double score,
});
