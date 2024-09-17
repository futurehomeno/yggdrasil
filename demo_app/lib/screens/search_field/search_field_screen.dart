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
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 500),
            child: YgSection(
              child: ScrollableDropdownRenderer(
                gap: 5,
                alignment: DropDownAlignment.auto,
                follower: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    YgListTile(
                      title: 'Result 1',
                    ),
                    YgListTile(
                      title: 'Result 2',
                    ),
                    YgListTile(
                      title: 'Result 3',
                    ),
                    YgListTile(
                      title: 'Result 4',
                    ),
                  ],
                ),
                target: YgTextField(
                  label: 'Search',
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  autocorrect: false,
                  textCapitalization: TextCapitalization.none,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
