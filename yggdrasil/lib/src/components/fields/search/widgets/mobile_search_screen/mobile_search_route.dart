import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/fields/search/widgets/mobile_search_screen/mobile_search_screen.dart';
import 'package:yggdrasil/src/components/fields/search/widgets/rrect_transition.dart';
import 'package:yggdrasil/src/theme/search_modal/search_modal_theme.dart';
import 'package:yggdrasil/src/theme/theme.dart';
import 'package:yggdrasil/src/utils/yg_linked/_yg_linked.dart';
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

  final YgLinkedKey<HintProvider> hintKey;

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
