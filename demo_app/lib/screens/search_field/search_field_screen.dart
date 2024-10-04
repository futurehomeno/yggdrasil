import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class SearchFieldScreen extends StatelessWidget {
  const SearchFieldScreen({super.key});

  static const String routeName = 'SearchFieldScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const SearchFieldScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'SearchField',
      child: YgSection.column(
        children: <Widget>[
          YgSearchField(
            results: [],
            label: 'Search',
            keyboardType: TextInputType.streetAddress,
            autocorrect: false,
            readOnly: false,
            textCapitalization: TextCapitalization.sentences,
            variant: YgFieldVariant.outlined,
          )
        ],
      ),
    );
  }
}
