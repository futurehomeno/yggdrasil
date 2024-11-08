import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

mixin SearchExampleScreenMixin<T extends StatefulWidget> on State<T> {
  static const List<String> _searchResults = [
    'Holtegrenda, 8000, Ski',
    'Holten, 8100, Misaer',
    'Holtegata, 8011, Oslo',
    'Holterveien, 8009, Bodø',
    'Holtegard, 8012, Gol',
    'Holtebakken, 8008, Tromsø',
    'Holteveien, 8007, Stavanger',
    'Holtegrenda, 8006, Kristiansand',
    'Holtegata, 8005, Bergen',
    'Holterveien, 8004, Trondheim',
    'Holtegard, 8003, Hamar',
    'Holtebakken, 8002, Ålesund',
    'Holteveien, 8001, Drammen',
    'Holtegrenda, 8000, Ski',
    'Holten, 8100, Misaer',
    'Holtegata, 8011, Oslo',
    'Holterveien, 8009, Bodø',
    'Holtegard, 8012, Gol',
    'Holtebakken, 8008, Tromsø',
    'Holteveien, 8007, Stavanger',
    'Holtegrenda, 8006, Kristiansand',
    'Holtegata, 8005, Bergen',
    'Holterveien, 8004, Trondheim',
    'Holtegard, 8003, Hamar',
    'Holtebakken, 8002, Ålesund',
    'Holteveien, 8001, Drammen',
  ];

  String resultTextBuilder(int value) => _searchResults[value];

  /// Creates an example results builder with configurable semi realistic behavior.
  getResultsBuilder({
    bool loading = false,
    int maxResults = 5,
  }) {
    final List<YgSearchResult<int>> Function(String) builder = (String query) {
      final List<YgSearchResult<int>> results = [];

      for (int i = 0, shown = 0; shown < maxResults && i < _searchResults.length; i++) {
        final result = _searchResults[i];
        final match = result.toLowerCase().indexOf(query.toLowerCase());

        if (query.toLowerCase().startsWith('holte')) {
          if (match == -1) {
            continue;
          }
        }

        shown++;

        results.add(
          YgSearchResult<int>(
            title: YgFormattedText(
              text: result,
              matches: [
                if (match != -1) YgTextMatch(start: match, end: query.length),
              ],
            ),
            icon: YgIcons.map,
            value: i,
          ),
        );
      }

      return results;
    };

    if (loading) {
      return (String query) => Future.delayed(
            Duration(
              milliseconds: 500,
            ),
          ).then(
            (_) => builder(
              query,
            ),
          );
    }

    return builder;
  }
}
