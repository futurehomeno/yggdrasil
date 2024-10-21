import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/fields/search/widgets/rrect_transition.dart';
import 'package:yggdrasil/src/components/fields/search/widgets/search_result_list_tile.dart';
import 'package:yggdrasil/src/theme/search_modal/search_modal_theme.dart';
import 'package:yggdrasil/src/theme/theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

class MobileSearchRoute<T> extends PopupRoute<Widget> {
  MobileSearchRoute({
    required this.searchController,
    required this.searchBarBuilder,
    required this.fieldKey,
    required this.hintKey,
    required this.borderRadius,
  });

  BuildContext get context => navigator!.context;

  YgSearchModalTheme get theme => context.searchModalTheme;

  @override
  RouteSettings get settings => const RouteSettings(name: 'MobileSearchRoute');

  @override
  Color? get barrierColor => null;

  @override
  bool get barrierDismissible => false;

  @override
  String get barrierLabel => 'Search modal';

  @override
  bool get opaque => false;

  @override
  Duration get transitionDuration => theme.animationDuration;

  @override
  Curve get barrierCurve => theme.animationCurve;

  final YgSearchControllerAny<T> searchController;

  final PreferredSizeWidget Function(BuildContext context) searchBarBuilder;

  final BorderRadius borderRadius;

  final GlobalKey fieldKey;

  final LinkedKey<HintProvider> hintKey;

  final CurveTween tween = CurveTween(curve: Curves.easeInOut);

  Rect? getRect() {
    final BuildContext? context = fieldKey.currentContext;
    if (context != null) {
      final RenderBox searchBarBox = context.findRenderObject()! as RenderBox;
      final Size boxSize = searchBarBox.size;
      final NavigatorState navigator = Navigator.of(context);
      final Offset boxLocation = searchBarBox.localToGlobal(
        Offset.zero,
        ancestor: navigator.context.findRenderObject(),
      );

      return boxLocation & boxSize;
    }

    return null;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return RRectTransition(
      animation: tween.animate(animation),
      rrect: borderRadius.toRRect(getRect() ?? Rect.zero),
      child: MobileSearchScreen<T>(
        controller: searchController,
        searchBarBuilder: searchBarBuilder,
        hintKey: hintKey,
      ),
    );
  }
}

class MobileSearchScreen<T> extends StatelessWidget {
  const MobileSearchScreen({
    super.key,
    required this.controller,
    required this.searchBarBuilder,
    required this.hintKey,
  });

  final YgSearchControllerAny<T> controller;
  final PreferredSizeWidget Function(BuildContext context) searchBarBuilder;
  final LinkedKey<HintProvider> hintKey;

  @override
  Widget build(BuildContext context) {
    final YgSearchModalTheme theme = context.searchModalTheme;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: searchBarBuilder(context),
      body: RemotelyLinkedBuilder<HintProvider>(
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
                      onTap: () => controller.valueSelected(result.value),
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
