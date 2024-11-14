import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/fields/search/widgets/hint_provider.dart';
import 'package:yggdrasil/src/components/fields/search/widgets/optimized_listenable_builder.dart';
import 'package:yggdrasil/src/components/fields/search/widgets/search_result_list_tile.dart';
import 'package:yggdrasil/src/theme/search_modal/search_modal_theme.dart';
import 'package:yggdrasil/src/theme/theme.dart';
import 'package:yggdrasil/src/utils/yg_linked/_yg_linked.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// Internal screen used by the search widgets.
class SearchScreen<T> extends StatelessWidget {
  const SearchScreen({
    super.key,
    required this.controller,
    required this.searchBarBuilder,
    required this.hintKey,
  });

  final YgSearchControllerAny<T> controller;
  final PreferredSizeWidget Function(BuildContext context) searchBarBuilder;
  final YgLinkedKey<HintProvider> hintKey;

  @override
  Widget build(BuildContext context) {
    final YgSearchModalTheme theme = context.searchModalTheme;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: searchBarBuilder(context),
      body: YgLinkedBuilder<HintProvider>(
        linkedKey: hintKey,
        builder: (HintProvider? hintProvider) {
          final Widget? hint = hintProvider?.hint;

          return OptimizedListenableBuilder<List<YgStringSearchResult>>(
            listenable: controller,
            getValue: () => controller.results,
            builder: (BuildContext context, List<YgStringSearchResult> results, Widget? _) {
              int childCount = results.length;
              int offset;
              if (hint != null) {
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
                      return Padding(
                        // TODO(Tim): Update this once design has been finalized.
                        padding: const EdgeInsets.only(top: 15, bottom: 20, left: 20, right: 20),
                        child: hint,
                      );
                    }

                    final YgStringSearchResult result = results[index];

                    void onTap() {
                      if (controller is YgStringSearchController) {
                        (controller as YgStringSearchController).onResultTapped('result');
                      } else if (result is YgSearchResult<T>) {
                        controller.onResultTapped(result.value);
                      } else {
                        // This should never happen, but just in case it does we
                        // should be notified during development.
                        assert(
                          false,
                          'Incorrect controller or result in SearchScreen',
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
          );
        },
      ),
    );
  }
}
