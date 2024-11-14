import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:yggdrasil/yggdrasil.dart';

import 'yg_string_search_result.dart';

mixin YgExactSearchProviderMixin<T extends YgStringSearchItem, R extends YgStringSearchResult>
    on YgStringSearchProvider {
  bool get searchSubtitle;
  List<T> get items;

  @override
  FutureOr<List<R>?> buildResults(String query) {
    final List<_ResultWithScore<R>> results = <_ResultWithScore<R>>[];

    for (final T item in items) {
      final String? subtitle = item.subtitle;
      final int titleIndex = item.title.indexOf(query);

      double score = double.infinity;

      if (titleIndex == -1 && (subtitle == null || !searchSubtitle)) {
        continue;
      }

      final int subtitleIndex;
      if (searchSubtitle && subtitle != null) {
        subtitleIndex = subtitle.indexOf(query);
      } else {
        subtitleIndex = -1;
      }

      if (subtitleIndex != -1) {
        if (titleIndex == -1) {
          score = subtitleIndex * 2;
        } else {
          score = lerpDouble(min(titleIndex, subtitleIndex), titleIndex, 0.5)!;
        }
      } else {
        if (titleIndex == -1) {
          continue;
        }

        score = titleIndex.toDouble();
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
