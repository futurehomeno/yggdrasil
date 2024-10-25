import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/fields/search/widgets/rrect_transition.dart';
import 'package:yggdrasil/src/theme/search_modal/search_modal_theme.dart';
import 'package:yggdrasil/src/theme/theme.dart';
import 'package:yggdrasil/src/utils/yg_linked/_yg_linked.dart';
import 'package:yggdrasil/yggdrasil.dart';

import '_mobile_search_screen.dart';

/// Internal route used for the search widgets.
class SearchScreenRoute<T> extends PopupRoute<Widget> {
  SearchScreenRoute({
    required this.searchController,
    required this.searchBarBuilder,
    required this.fieldKey,
    required this.hintKey,
    required this.borderRadius,
    required this.onClose,
  });

  // region Route

  CurveTween get tween => CurveTween(curve: barrierCurve);

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

  // endregion

  // region Arguments

  final YgSearchController<T> searchController;

  final PreferredSizeWidget Function(BuildContext context) searchBarBuilder;

  final BorderRadius borderRadius;

  final GlobalKey fieldKey;

  final YgLinkedKey<HintProvider> hintKey;

  final VoidCallback onClose;

  // endregion

  @override
  void onPopInvokedWithResult(bool didPop, Widget? result) {
    if (!didPop || !searchController.attached) {
      return;
    }

    onClose();
    super.onPopInvokedWithResult(didPop, result);
  }

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
      child: SearchScreen<T>(
        controller: searchController,
        searchBarBuilder: searchBarBuilder,
        hintKey: hintKey,
      ),
    );
  }
}
