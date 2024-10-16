import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/fields/search/widgets/rrect_transition.dart';
import 'package:yggdrasil/src/components/fields/search/widgets/search_result_list_tile.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

class MobileSearchRoute<T> extends ModalRoute<Widget> {
  MobileSearchRoute({
    required this.searchController,
    required this.searchBarBuilder,
    required this.fieldKey,
    required this.borderRadius,
    required this.hint,
  });

  @override
  RouteSettings get settings => const RouteSettings(name: 'MobileSearchRoute');

  @override
  Color? get barrierColor => null;

  @override
  bool get barrierDismissible => false;

  @override
  String get barrierLabel => 'Search modal';

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

  @override
  bool get maintainState => true;

  @override
  bool get opaque => true;

  final ValueNotifier<Widget?> hint;

  final YgSearchControllerAny<T> searchController;

  final PreferredSizeWidget Function(BuildContext context) searchBarBuilder;

  final BorderRadius borderRadius;

  final GlobalKey fieldKey;

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
        hint: hint,
        controller: searchController,
        searchBarBuilder: searchBarBuilder,
      ),
    );
  }
}

class MobileSearchScreen<T> extends StatelessWidget {
  const MobileSearchScreen({
    super.key,
    required this.hint,
    required this.controller,
    required this.searchBarBuilder,
  });

  final ValueNotifier<Widget?> hint;
  final YgSearchControllerAny<T> controller;
  final PreferredSizeWidget Function(BuildContext context) searchBarBuilder;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO(Tim): Update this.
      backgroundColor: context.tokens.colors.backgroundWeak,
      appBar: searchBarBuilder(context),
      body: YgAnimatedBuilder(
        builder: _buildContent,
        properties: <Listenable?>{
          hint,
          controller.results,
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, Widget? _) {
    final List<YgSearchResult<T>>? results = controller.results.value;

    int childCount = results?.length ?? 0;
    int offset;
    if (hint.value != null) {
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
              child: hint.value,
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
  }
}
