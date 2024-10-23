import 'package:flutter/material.dart';
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

  final YgSearchController<T> controller;
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

          return AnimatedBuilder(
            builder: (BuildContext context, Widget? _) {
              final List<YgSearchResult<T>>? results = controller.results.value;

              int childCount = results?.length ?? 0;
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
                        padding: const EdgeInsets.only(top: 15, bottom: 20, left: 20, right: 20),
                        child: hint,
                      );
                    }

                    final YgSearchResult<T> result = results![index];

                    return SearchResultListTile(
                      title: result.title,
                      subtitle: result.subtitle,
                      icon: result.icon,
                      onTap: () => controller.onValueTapped(result.value),
                    );
                  },
                  itemCount: childCount,
                ),
              );
            },
            animation: controller.results,
          );
        },
      ),
    );
  }
}
