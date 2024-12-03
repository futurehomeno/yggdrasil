import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/fields/search/controller/yg_search_controller.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/_interfaces.dart';
import 'package:yggdrasil/src/components/fields/search/widgets/hint_provider.dart';
import 'package:yggdrasil/src/components/fields/search/widgets/search_result_list_tile.dart';
import 'package:yggdrasil/src/theme/search_modal/search_modal_theme.dart';
import 'package:yggdrasil/src/theme/theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/src/utils/yg_linked/_yg_linked.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// Internal screen used by the search widgets.
class SearchScreen<ResultValue> extends StatelessWidget {
  const SearchScreen({
    super.key,
    required this.controller,
    required this.searchBarBuilder,
    required this.hintKey,
  });

  final YgSearchControllerAny<Object?, ResultValue> controller;
  final PreferredSizeWidget Function(BuildContext context) searchBarBuilder;
  final YgLinkedKey<HintProvider> hintKey;

  @override
  Widget build(BuildContext context) {
    final YgSearchModalTheme theme = context.searchModalTheme;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: searchBarBuilder(context),
      body: YgOptimizedListenableBuilder<YgSearchResultsLayoutAny>(
        listenable: controller,
        getValue: () => controller.results,
        builder: (BuildContext context, YgSearchResultsLayoutAny resultsLayout, Widget? _) {
          final List<YgBaseSearchResult>? results = resultsLayout.results;
          final Widget? leading = resultsLayout.leading;

          int childCount = results?.length ?? 0;
          int offset;
          if (leading != null) {
            childCount += 1;
            offset = -1;
          } else {
            offset = 0;
          }

          return RepaintBoundary(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                index += offset;

                if (index == -1) {
                  return leading;
                }

                if (results == null) {
                  return null;
                }

                final YgBaseSearchResult result = results[index];

                void onTap() {
                  if (controller is YgAdvancedSearchController && result is YgSearchResult<ResultValue>) {
                    controller.onResultTapped(result.value);
                  } else if (controller is YgSimpleSearchController && result is YgSearchResult<ResultValue>) {
                    controller.onResultTapped(result.value);
                  } else if (controller is YgStringSearchController && result is YgStringSearchResult) {
                    (controller as YgStringSearchController).onResultTapped(result.title.text);
                  } else {
                    assert(
                      false,
                      'Internal incorrect result and controller combination',
                    );
                  }
                }

                return SearchResultListTile(
                  title: result.title,
                  subtitle: result.subtitle,
                  icon: result.icon,
                  onTap: onTap,
                );
              },
              itemCount: childCount,
            ),
          );
        },
      ),
    );
  }
}
