import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/screens/search/demo_search_provider.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class SearchBarScreen extends StatelessWidget {
  const SearchBarScreen({super.key});

  static const String routeName = 'SearchBarScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const SearchBarScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'SearchBar',
      child: Column(
        children: <Widget>[
          YgSection(
            child: YgSearchBar(
              keyboardType: TextInputType.streetAddress,
              autocorrect: false,
              textCapitalization: TextCapitalization.sentences,
              completeAction: YgCompleteAction.focusNext,
              searchProvider: DemoSearchProvider(),
            ),
          )
        ],
      ),
    );
  }
}
