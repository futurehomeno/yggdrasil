import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/fields/search/widgets/rect_transition.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'search_app_bar.dart';

class MobileSearchRoute extends ModalRoute<Widget> {
  MobileSearchRoute({
    required this.transitionFromRRect,
    required this.keyboardType,
    required this.autocorrect,
    required this.textCapitalization,
  });

  final RRect transitionFromRRect;

  final TextInputType keyboardType;

  final bool autocorrect;

  final TextCapitalization textCapitalization;

  final CurveTween tween = CurveTween(curve: Curves.easeInOut);

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
      rrect: transitionFromRRect,
      child: MobileSearchScreen(
        keyboardType: keyboardType,
        autocorrect: autocorrect,
        textCapitalization: textCapitalization,
      ),
    );
  }
}

class MobileSearchScreen extends StatelessWidget {
  const MobileSearchScreen({
    super.key,
    required this.keyboardType,
    required this.autocorrect,
    required this.textCapitalization,
  });

  final TextInputType keyboardType;
  final bool autocorrect;
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.tokens.colors.backgroundWeak,
      appBar: SearchAppBar(
        textInputAction: TextInputAction.done,
        keyboardType: keyboardType,
        autocorrect: autocorrect,
        textCapitalization: textCapitalization,
      ),
      body: const Column(
        children: <Widget>[
          YgListTile(
            title: 'Holtegrenda, 8000, Ski',
          ),
          YgListTile(
            title: 'Holten, 8100, Misaer',
          ),
          YgListTile(
            title: 'Holtegata, 8011, Oslo',
          ),
          YgListTile(
            title: 'Holterveien, 8009, Bodø',
          ),
          YgListTile(
            title: 'Holtegard, 8012, Gol',
          ),
        ],
      ),
    );
  }
}
