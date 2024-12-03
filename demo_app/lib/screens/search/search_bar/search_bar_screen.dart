import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/screens/search/demo_search_provider.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class SearchBarScreen extends StatefulWidget {
  const SearchBarScreen({super.key});

  static const String routeName = 'SearchBarScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const SearchBarScreen(),
    );
  }

  @override
  State<SearchBarScreen> createState() => _SearchBarScreenState();
}

class _SearchBarScreenState extends State<SearchBarScreen> {
  final YgSimpleSearchController<int> _controller = YgSimpleSearchController<int>();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'SearchBar',
      child: Column(
        children: <Widget>[
          YgSection(
            title: 'Default search bar',
            child: YgSearchBar<int>(
              keyboardType: TextInputType.streetAddress,
              autocorrect: false,
              textCapitalization: TextCapitalization.sentences,
              completeAction: YgCompleteAction.focusNext,
              searchProvider: DemoSearchProvider(),
            ),
          ),
          YgSection.column(
            title: 'Variants',
            children: <YgSearchBar<int>>[
              YgSearchBar<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                completeAction: YgCompleteAction.focusNext,
                searchProvider: DemoSearchProvider(),
                placeholder: 'With placeholder',
              ),
              YgSearchBar<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                completeAction: YgCompleteAction.focusNext,
                searchProvider: DemoSearchProvider(),
                placeholder: 'With custom leading widget',
                leading: YgIconButton(
                  icon: YgIcons.placeholder,
                  onPressed: () {},
                ),
              ),
              YgSearchBar<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                completeAction: YgCompleteAction.focusNext,
                searchProvider: DemoSearchProvider(),
                placeholder: 'With trailing avatar',
                trailing: const YgAvatar(
                  initials: 'TR',
                  size: YgAvatarSize.medium,
                ),
              ),
              YgSearchBar<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                completeAction: YgCompleteAction.focusNext,
                searchProvider: DemoSearchProvider(),
                placeholder: 'With avatar and custom leading',
                trailing: const YgAvatar(
                  initials: 'TR',
                  size: YgAvatarSize.medium,
                ),
                leading: YgIconButton(
                  icon: YgIcons.placeholder,
                  onPressed: () {},
                ),
              ),
              YgSearchBar<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                completeAction: YgCompleteAction.focusNext,
                searchProvider: DemoSearchProvider(),
                placeholder: 'With hint',
                hint: const DemoPlaceholder(
                  height: 60,
                ),
              ),
              YgSearchBar<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                completeAction: YgCompleteAction.focusNext,
                searchProvider: DemoSearchProvider(),
                searchAction: YgSearchAction.screen,
                placeholder: 'Screen',
              ),
              YgSearchBar<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                completeAction: YgCompleteAction.focusNext,
                searchProvider: DemoSearchProvider(),
                searchAction: YgSearchAction.menu,
                placeholder: 'Menu',
              ),
              YgSearchBar<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                completeAction: YgCompleteAction.focusNext,
                searchProvider: DemoSearchProvider(),
                searchAction: YgSearchAction.none,
                placeholder: 'Button only',
              ),
            ].withVerticalSpacing(20.0),
          ),
          YgSection.column(
            title: 'Using custom controller',
            children: <Widget>[
              YgSearchBar<int>(
                keyboardType: TextInputType.streetAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.sentences,
                completeAction: YgCompleteAction.focusNext,
                searchProvider: DemoSearchProvider(),
                placeholder: 'With hint',
                hint: const DemoPlaceholder(
                  height: 60,
                ),
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
            ],
          ),
        ],
      ),
    );
  }
}
