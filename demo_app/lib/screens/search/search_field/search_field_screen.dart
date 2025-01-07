import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/screens/search/demo_search_provider.dart';
import 'package:yggdrasil_demo/screens/search/demo_string_search_provider.dart';
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
  final YgSimpleSearchController<int> _controller = YgSimpleSearchController<int>();
  final FormFieldKey<int> _valueSearchKey = FormFieldKey<int>();
  final TextFieldKey _stringSearchKey = TextFieldKey();
  final FormKey _formKey = FormKey();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final DemoSearchProvider searchProvider = DemoSearchProvider();
    final DemoStringSearchProvider stringSearchProvider = DemoStringSearchProvider();

    return DemoScreen(
      componentName: 'SearchField',
      child: Column(
        children: <Widget>[
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
                initialValue: 3,
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
                searchProvider: DemoSearchProvider(loading: true),
              ),
              YgSearchField<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                label: 'With hint',
                completeAction: YgCompleteAction.focusNext,
                searchProvider: DemoSearchProvider(
                  hint: true,
                ),
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
            children: <YgSearchField<int>>[
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
            children: <YgSearchField<int>>[
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
          Form(
            key: _formKey,
            child: YgSection.column(
              title: 'Form example',
              children: <Widget>[
                YgSearchFormField<int>(
                  key: _valueSearchKey,
                  label: 'Value search',
                  keyboardType: TextInputType.streetAddress,
                  autocorrect: false,
                  textCapitalization: TextCapitalization.sentences,
                  searchProvider: searchProvider,
                  completeAction: YgCompleteAction.focusNext,
                  size: YgFieldSize.large,
                ),
                YgStringSearchFormField(
                  key: _stringSearchKey,
                  label: 'String search',
                  keyboardType: TextInputType.streetAddress,
                  autocorrect: false,
                  textCapitalization: TextCapitalization.sentences,
                  searchProvider: stringSearchProvider,
                  completeAction: YgCompleteAction.focusNext,
                  size: YgFieldSize.large,
                ),
                YgButton(
                  onPressed: _onSubmit,
                  child: const Text('Submit'),
                ),
              ].withVerticalSpacing(15),
            ),
          ),
          YgSection.column(
            title: 'Custom controller',
            children: <StatefulWidgetDebugMixin>[
              YgSearchField<int>(
                label: 'Custom controller',
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                searchProvider: searchProvider,
                controller: _controller,
              ),
              YgButton(
                child: const Text('Set value'),
                onPressed: () => _controller.value = 3,
              ),
              YgButton(
                child: const Text('Clear value'),
                onPressed: () => _controller.clear(),
              ),
              YgButton(
                child: const Text('Open search field'),
                onPressed: () => _controller.open(),
              ),
            ].withVerticalSpacing(10.0),
          ),
          YgSection.column(
            title: 'Search providers',
            children: <StatefulWidgetDebugMixin>[
              YgSearchField<int>(
                label: 'Exact search provider',
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                searchProvider: YgExactSimpleSearchProvider<int>(
                  items: DemoSearchProvider.searchResults,
                  noResultsBuilder: (_) => const Text('No Results'),
                  caseSensitive: true,
                ),
              ),
              YgSearchField<int>(
                label: 'Fuzzy search provider',
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                searchProvider: YgFuzzySimpleSearchProvider<int>(
                  items: DemoSearchProvider.searchResults,
                  noResultsBuilder: (_) => const Text('No Results'),
                ),
              ),
            ].withVerticalSpacing(10.0),
          ),
        ],
      ),
    );
  }

  void _onSubmit() {
    FocusScope.of(context).unfocus();

    if (!_formKey.validate()) {
      return;
    }

    final String valueSearch = _valueSearchKey.value?.toString() ?? '';
    final String stringSearch = _stringSearchKey.value ?? '';

    YgSnackBarManager.of(context).showSnackBar(
      YgSnackBar(
        message: 'Submitted form with $valueSearch and $stringSearch.',
      ),
    );
  }
}
