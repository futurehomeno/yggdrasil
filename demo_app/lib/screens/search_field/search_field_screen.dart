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

  @override
  State<SearchFieldScreen> createState() => _SearchFieldScreenState();
}

class _SearchFieldScreenState extends State<SearchFieldScreen> {
  final _controller = YgSearchController<int>();

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

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'SearchField',
      child: Column(
        children: [
          YgSection.column(
            title: 'Variations',
            children: <Widget>[
              YgSearchField<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                label: 'Default search field',
                resultsBuilder: _getResultsBuilder(),
                completeAction: YgCompleteAction.focusNext,
                resultTextBuilder: _resultTextBuilder,
              ),
              YgSearchField<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                label: 'Label',
                placeholder: 'Fixed placeholder',
                resultsBuilder: _getResultsBuilder(),
                completeAction: YgCompleteAction.focusNext,
                resultTextBuilder: _resultTextBuilder,
              ),
              YgSearchField<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                label: 'Screen',
                searchAction: YgSearchAction.screen,
                resultsBuilder: _getResultsBuilder(),
                completeAction: YgCompleteAction.focusNext,
                resultTextBuilder: _resultTextBuilder,
              ),
              YgSearchField<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                label: 'Menu',
                searchAction: YgSearchAction.menu,
                resultsBuilder: _getResultsBuilder(),
                completeAction: YgCompleteAction.focusNext,
                resultTextBuilder: _resultTextBuilder,
              ),
              YgSearchField<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                label: 'Button only',
                searchAction: YgSearchAction.none,
                resultsBuilder: _getResultsBuilder(),
                completeAction: YgCompleteAction.focusNext,
                resultTextBuilder: _resultTextBuilder,
              ),
              YgSearchField<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                label: 'Scrollable search screen',
                searchAction: YgSearchAction.screen,
                resultsBuilder: _getResultsBuilder(maxResults: 50),
                completeAction: YgCompleteAction.focusNext,
                resultTextBuilder: _resultTextBuilder,
              ),
              YgSearchField<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                label: 'Scrollable menu',
                searchAction: YgSearchAction.menu,
                resultsBuilder: _getResultsBuilder(maxResults: 50),
                completeAction: YgCompleteAction.focusNext,
                resultTextBuilder: _resultTextBuilder,
              ),
              YgSearchField<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                label: 'With loading',
                resultsBuilder: _getResultsBuilder(loading: true),
                completeAction: YgCompleteAction.focusNext,
                resultTextBuilder: _resultTextBuilder,
              ),
              YgSearchField<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                label: 'With hint',
                resultsBuilder: _getResultsBuilder(),
                hint: YgCard(
                  variant: YgCardVariant.outlined,
                  child: YgListTile(
                    title: 'Unable to find your address?',
                    subtitle: "Make sure your address is spelled correctly or"
                        " enter the address manually.",
                    leadingWidgets: [YgIcon(YgIcons.plus)],
                    onTap: () {},
                  ),
                ),
                completeAction: YgCompleteAction.focusNext,
                resultTextBuilder: _resultTextBuilder,
              ),
              YgSearchField<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                label: 'Disabled',
                disabled: true,
                resultsBuilder: _getResultsBuilder(),
                completeAction: YgCompleteAction.focusNext,
                resultTextBuilder: _resultTextBuilder,
              ),
            ].withVerticalSpacing(15),
          ),
          YgSection.column(
            title: 'Variants',
            children: [
              YgSearchField<int>(
                label: 'Standard',
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                resultsBuilder: _getResultsBuilder(),
                resultTextBuilder: _resultTextBuilder,
                completeAction: YgCompleteAction.focusNext,
                variant: YgFieldVariant.standard,
              ),
              YgSearchField<int>(
                label: 'Outlined',
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                resultsBuilder: _getResultsBuilder(),
                resultTextBuilder: _resultTextBuilder,
                completeAction: YgCompleteAction.focusNext,
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
                textCapitalization: TextCapitalization.sentences,
                resultsBuilder: _getResultsBuilder(),
                resultTextBuilder: _resultTextBuilder,
                completeAction: YgCompleteAction.focusNext,
                size: YgFieldSize.medium,
              ),
              YgSearchField<int>(
                label: 'Large',
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                resultsBuilder: _getResultsBuilder(),
                resultTextBuilder: _resultTextBuilder,
                completeAction: YgCompleteAction.focusNext,
                size: YgFieldSize.large,
              ),
            ].withVerticalSpacing(10.0),
          ),
          YgSection.column(
            title: 'Custom controller',
            children: [
              YgSearchField<int>(
                label: 'Custom controller',
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                resultsBuilder: _getResultsBuilder(),
                resultTextBuilder: _resultTextBuilder,
                controller: _controller,
              ),
              YgButton(
                child: Text('Set value'),
                onPressed: () => _controller.text = 'Custom value',
              ),
              YgButton(
                child: Text('Clear value'),
                onPressed: () => _controller.text = '',
              ),
              YgButton(
                child: Text('Open search field'),
                onPressed: () => _controller.open(),
              )
            ].withVerticalSpacing(10.0),
          ),
        ],
      ),
    );
  }

  String _resultTextBuilder(int value) => _searchResults[value];

  /// Creates an example results builder with configurable semi realistic behavior.
  _getResultsBuilder({
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
