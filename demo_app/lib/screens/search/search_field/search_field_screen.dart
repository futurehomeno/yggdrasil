import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/screens/search/search_example_screen_mixin.dart';
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

class _SearchFieldScreenState extends State<SearchFieldScreen> with SearchExampleScreenMixin {
  final _controller = YgValueSearchController<int>();

  @override
  Widget build(BuildContext context) {
    final searchProvider = YgFuzzyValueSearchProvider<int>(
      items: [
        for (int i = 0; i < _searchResults.length; i++)
          YgValueSearchItem<int>(
            title: _searchResults[i],
            value: i,
            icon: YgIcons.map,
          ),
      ],
    );

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
                completeAction: YgCompleteAction.focusNext,
                searchProvider: searchProvider,
              ),
              YgSearchField<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                label: 'With initial value',
                initialQuery: 'Initial value',
                completeAction: YgCompleteAction.focusNext,
                searchProvider: searchProvider,
              ),
              YgSearchField<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                label: 'Label',
                placeholder: 'Fixed placeholder',
                completeAction: YgCompleteAction.focusNext,
                searchProvider: searchProvider,
              ),
              YgSearchField<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                label: 'Screen',
                searchAction: YgSearchAction.screen,
                completeAction: YgCompleteAction.focusNext,
                searchProvider: searchProvider,
              ),
              YgSearchField<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                label: 'Menu',
                searchAction: YgSearchAction.menu,
                completeAction: YgCompleteAction.focusNext,
                searchProvider: searchProvider,
              ),
              YgSearchField<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                label: 'Button only',
                searchAction: YgSearchAction.none,
                completeAction: YgCompleteAction.focusNext,
                searchProvider: searchProvider,
              ),
              YgSearchField<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                label: 'Scrollable search screen',
                searchAction: YgSearchAction.screen,
                completeAction: YgCompleteAction.focusNext,
                searchProvider: searchProvider,
              ),
              YgSearchField<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                label: 'Scrollable menu',
                searchAction: YgSearchAction.menu,
                completeAction: YgCompleteAction.focusNext,
                searchProvider: searchProvider,
              ),
              YgSearchField<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                label: 'With loading',
                completeAction: YgCompleteAction.focusNext,
                searchProvider: searchProvider,
              ),
              YgSearchField<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                label: 'With hint',
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
                searchProvider: searchProvider,
              ),
              YgSearchField<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                label: 'Disabled',
                disabled: true,
                completeAction: YgCompleteAction.focusNext,
                searchProvider: searchProvider,
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
                searchProvider: searchProvider,
                completeAction: YgCompleteAction.focusNext,
                variant: YgFieldVariant.standard,
              ),
              YgSearchField<int>(
                label: 'Outlined',
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                searchProvider: searchProvider,
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
                searchProvider: searchProvider,
                completeAction: YgCompleteAction.focusNext,
                size: YgFieldSize.medium,
              ),
              YgSearchField<int>(
                label: 'Large',
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                searchProvider: searchProvider,
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
                searchProvider: searchProvider,
                controller: _controller,
              ),
              YgButton(
                child: Text('Set value'),
                onPressed: () => _controller.searchQuery = 'Custom value',
              ),
              YgButton(
                child: Text('Clear value'),
                onPressed: () => _controller.clear,
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
}
