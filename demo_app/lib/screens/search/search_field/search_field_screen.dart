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
  final _controller = YgSearchController<int>();

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
                resultsBuilder: getResultsBuilder(),
                completeAction: YgCompleteAction.focusNext,
                resultTextBuilder: resultTextBuilder,
              ),
              YgSearchField<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                label: 'With initial value',
                initialValue: 'Initial value',
                resultsBuilder: getResultsBuilder(),
                completeAction: YgCompleteAction.focusNext,
                resultTextBuilder: resultTextBuilder,
              ),
              YgSearchField<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                label: 'Label',
                placeholder: 'Fixed placeholder',
                resultsBuilder: getResultsBuilder(),
                completeAction: YgCompleteAction.focusNext,
                resultTextBuilder: resultTextBuilder,
              ),
              YgSearchField<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                label: 'Screen',
                searchAction: YgSearchAction.screen,
                resultsBuilder: getResultsBuilder(),
                completeAction: YgCompleteAction.focusNext,
                resultTextBuilder: resultTextBuilder,
              ),
              YgSearchField<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                label: 'Menu',
                searchAction: YgSearchAction.menu,
                resultsBuilder: getResultsBuilder(),
                completeAction: YgCompleteAction.focusNext,
                resultTextBuilder: resultTextBuilder,
              ),
              YgSearchField<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                label: 'Button only',
                searchAction: YgSearchAction.none,
                resultsBuilder: getResultsBuilder(),
                completeAction: YgCompleteAction.focusNext,
                resultTextBuilder: resultTextBuilder,
              ),
              YgSearchField<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                label: 'Scrollable search screen',
                searchAction: YgSearchAction.screen,
                resultsBuilder: getResultsBuilder(maxResults: 50),
                completeAction: YgCompleteAction.focusNext,
                resultTextBuilder: resultTextBuilder,
              ),
              YgSearchField<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                label: 'Scrollable menu',
                searchAction: YgSearchAction.menu,
                resultsBuilder: getResultsBuilder(maxResults: 50),
                completeAction: YgCompleteAction.focusNext,
                resultTextBuilder: resultTextBuilder,
              ),
              YgSearchField<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                label: 'With loading',
                resultsBuilder: getResultsBuilder(loading: true),
                completeAction: YgCompleteAction.focusNext,
                resultTextBuilder: resultTextBuilder,
              ),
              YgSearchField<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                label: 'With hint',
                resultsBuilder: getResultsBuilder(),
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
                resultTextBuilder: resultTextBuilder,
              ),
              YgSearchField<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                label: 'Disabled',
                disabled: true,
                resultsBuilder: getResultsBuilder(),
                completeAction: YgCompleteAction.focusNext,
                resultTextBuilder: resultTextBuilder,
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
                resultsBuilder: getResultsBuilder(),
                resultTextBuilder: resultTextBuilder,
                completeAction: YgCompleteAction.focusNext,
                variant: YgFieldVariant.standard,
              ),
              YgSearchField<int>(
                label: 'Outlined',
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                resultsBuilder: getResultsBuilder(),
                resultTextBuilder: resultTextBuilder,
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
                resultsBuilder: getResultsBuilder(),
                resultTextBuilder: resultTextBuilder,
                completeAction: YgCompleteAction.focusNext,
                size: YgFieldSize.medium,
              ),
              YgSearchField<int>(
                label: 'Large',
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                resultsBuilder: getResultsBuilder(),
                resultTextBuilder: resultTextBuilder,
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
                resultsBuilder: getResultsBuilder(),
                resultTextBuilder: resultTextBuilder,
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
}
