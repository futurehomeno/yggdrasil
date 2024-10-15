import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/fields/search/widgets/rrect_transition.dart';
import 'package:yggdrasil/src/components/fields/search/widgets/search_result_list_tile.dart';
import 'package:yggdrasil/yggdrasil.dart';

typedef YgSearchResultsBuilder<T> = Future<List<YgSearchResult<T>>?> Function(String searchQuery);

class MobileSearchRoute<T> extends ModalRoute<Widget> {
  MobileSearchRoute({
    required this.searchController,
    required this.searchBarBuilder,
    required this.fieldKey,
    required this.borderRadius,
  });

  @override
  RouteSettings get settings => const RouteSettings(name: 'MobileSearchRoute');

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

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return RRectTransition(
      animation: tween.animate(animation),
      rrect: borderRadius.toRRect(getRect() ?? Rect.zero),
      child: MobileSearchScreen<T>(
        controller: searchController,
        searchBarBuilder: searchBarBuilder,
      ),
    );
  }
}

class MobileSearchScreen<T> extends StatelessWidget {
  const MobileSearchScreen({
    super.key,
    required this.controller,
    required this.searchBarBuilder,
  });

  final YgSearchControllerAny<T> controller;
  final PreferredSizeWidget Function(BuildContext context) searchBarBuilder;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO(Tim): Update this.
      backgroundColor: context.tokens.colors.backgroundWeak,
      appBar: searchBarBuilder(context),
      body: ListenableBuilder(
        builder: _buildContent,
        listenable: controller.results,
      ),
    );
  }

  Widget _buildContent(BuildContext context, Widget? _) {
    final List<YgSearchResult<T>>? results = controller.results.value;

    return RepaintBoundary(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          final YgSearchResult<T> result = results![index];

          return SearchResultListTile(
            title: result.title,
            subtitle: result.subtitle,
            icon: result.icon,
            onTap: () => controller.valueSelected(result.value),
          );
        },
        itemCount: results?.length ?? 0,
      ),
    );
  }
}
