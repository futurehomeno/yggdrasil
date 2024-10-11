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
            label: 'Search',
            keyboardType: TextInputType.streetAddress,
            autocorrect: false,
            readOnly: false,
            textCapitalization: TextCapitalization.sentences,
            variant: YgFieldVariant.outlined,
            resultsBuilder: (searchQuery) async {
              await Future.delayed(Duration(seconds: 1));
              return [
                YgSearchResult(
                  title: YgFormattedText(
                    text: 'Holtegrenda, 8000, Ski',
                    matches: [
                      YgTextMatch(start: 1, end: 8),
                    ],
                  ),
                  value: 1,
                ),
                YgSearchResult(
                  title: YgFormattedText(
                    text: 'Holtegrenda, 8000, Ski',
                    matches: [
                      YgTextMatch(start: 3, end: 8),
                    ],
                  ),
                  value: 1,
                ),
                YgSearchResult(
                  title: YgFormattedText(
                    text: 'Holtegrenda, 8000, Ski',
                    matches: [
                      YgTextMatch(start: 3, end: 8),
                    ],
                  ),
                  value: 1,
                ),
                YgSearchResult(
                  title: YgFormattedText(
                    text: 'Holtegrenda, 8000, Ski',
                    matches: [
                      YgTextMatch(start: 3, end: 8),
                    ],
                  ),
                  value: 1,
                ),
                YgSearchResult(
                  title: YgFormattedText(
                    text: 'Holtegrenda, 8000, Ski',
                    matches: [
                      YgTextMatch(start: 3, end: 8),
                    ],
                  ),
                  value: 1,
                ),
              ];
            },
            resultSelected: (value) async => 'This is going to be the result now',
          )
        ],
      ),
    );
  }
}
