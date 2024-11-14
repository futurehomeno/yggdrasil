import 'dart:async';

import 'package:fuzzy/bitap/data/match_index.dart';
import 'package:fuzzy/data/result.dart';
import 'package:fuzzy/fuzzy.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_string_search_result.dart';

mixin YgFuzzySearchProviderMixin<T extends YgStringSearchItem, R extends YgStringSearchResult>
    on YgStringSearchProvider {
  bool get searchSubtitle;
  List<T> get items;
  double get threshold;

  static const String _titleKey = 'title';
  static const String _subtitleKey = 'subtitle';

  late final Fuzzy<T> fuzzy = Fuzzy<T>(
    items,
    options: FuzzyOptions<T>(
      keys: <WeightedKey<T>>[
        WeightedKey<T>(
          name: _titleKey,
          getter: (T item) => item.title,
          weight: 1,
        ),
        if (searchSubtitle)
          WeightedKey<T>(
            name: _subtitleKey,
            getter: (T item) => item.subtitle ?? '',
            weight: 0.5,
          ),
      ],
      threshold: threshold,
    ),
  );

  @override
  FutureOr<List<R>?> buildResults(String query) {
    final List<Result<T>> results = fuzzy.search(query);
    final List<R> mappedResults = <R>[];

    for (final Result<T> result in results) {
      final List<YgTextMatch> titleMatches = <YgTextMatch>[];
      final List<YgTextMatch> subtitleMatches = <YgTextMatch>[];

      for (final ResultDetails<T> match in result.matches) {
        for (final MatchIndex index in match.matchedIndices) {
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

  R createResultFromMatches({
    required T item,
    required List<YgTextMatch> titleMatches,
    required List<YgTextMatch>? subtitleMatches,
  });
}
