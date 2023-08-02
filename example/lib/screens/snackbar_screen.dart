import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class SnackbarScreen extends StatelessWidget {
  const SnackbarScreen({super.key});

  static const String routeName = 'SnackbarScreen';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const SnackbarScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YgScreen(
      componentName: 'Snackbar',
      componentDesc: 'Snackbar',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          const YgListTile(title: 'Highlight snackbar'),
          YgSnackbar(
            variant: YgSnackbarVariant.highlight,
            message: 'Snackbars provide feedback after users take an action',
            onClose: () {},
          ),
          const YgListTile(title: 'Success snackbar'),
          YgSnackbar(
            variant: YgSnackbarVariant.success,
            message: 'Snackbars provide feedback after users take an action',
            onClose: () {},
          ),
          const YgListTile(title: 'Critical snackbar'),
          YgSnackbar(
            variant: YgSnackbarVariant.critical,
            message: 'Snackbars provide feedback after users take an action',
            onClose: () {},
          ),
        ].withVerticalSpacing(10),
      ),
    );
  }
}
