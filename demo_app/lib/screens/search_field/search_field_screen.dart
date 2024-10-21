import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class SearchFieldScreen extends StatefulWidget {
  const SearchFieldScreen({super.key});

  static const String routeName = 'SearchFieldScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const SearchFieldScreen(),
    );
  }

  static const List<String> searchResults = [
    'Holtegrenda, 8000, Ski',
    'Holten, 8100, Misaer',
    'Holtegata, 8011, Oslo',
    'Holterveien, 8009, Bodø',
    'Holtegard, 8012, Gol',
  ];

  @override
  State<SearchFieldScreen> createState() => _SearchFieldScreenState();
}

class _SearchFieldScreenState extends State<SearchFieldScreen> {
  bool _showHint = true;

  @override
  Widget build(BuildContext context) {
    print('build');
    return DemoScreen(
      componentName: 'SearchField',
      child: Column(
        children: [
          YgSection.column(
            title: 'Variants',
            children: [
              YgSearchField<int>(
                label: 'Standard',
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                readOnly: false,
                textCapitalization: TextCapitalization.sentences,
                resultsBuilder: _getResultsBuilder(),
                resultTextBuilder: (value) => SearchFieldScreen.searchResults[value],
                variant: YgFieldVariant.standard,
                hint: YgCallout(
                  title: 'Unable to find address?',
                  description: 'Make sure you spelled your address correctly, if you can'
                      ' still not find your address, you can enter your address manually',
                  textLink: YgTextLink(
                    text: 'Enter address manually',
                    onPressed: () {},
                  ),
                  onClose: () => setState(() => _showHint = false),
                ),
              ),
              YgSearchField<int>(
                label: 'Outlined',
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                readOnly: false,
                textCapitalization: TextCapitalization.sentences,
                resultsBuilder: _getResultsBuilder(),
                resultTextBuilder: (value) => SearchFieldScreen.searchResults[value],
                variant: YgFieldVariant.outlined,
              ),
            ].withVerticalSpacing(10.0),
          ),
          YgSection.column(
            title: 'Sizes',
            children: [
              YgSearchField<int>(
                label: 'Medium',
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                readOnly: false,
                textCapitalization: TextCapitalization.sentences,
                resultsBuilder: _getResultsBuilder(),
                resultTextBuilder: (value) => SearchFieldScreen.searchResults[value],
                size: YgFieldSize.medium,
              ),
              YgSearchField<int>(
                label: 'Large',
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                readOnly: false,
                textCapitalization: TextCapitalization.sentences,
                resultsBuilder: _getResultsBuilder(),
                resultTextBuilder: (value) => SearchFieldScreen.searchResults[value],
                size: YgFieldSize.large,
              ),
            ].withVerticalSpacing(10.0),
          ),
        ],
      ),
    );
  }

  _getResultsBuilder({
    bool loading = false,
  }) {
    final List<YgSearchResult<int>> Function(String) builder = (String query) {
      final List<YgSearchResult<int>> results = [];

      for (int i = 0; i < SearchFieldScreen.searchResults.length; i++) {
        final result = SearchFieldScreen.searchResults[i];
        final match = result.toLowerCase().indexOf(query.toLowerCase());
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
