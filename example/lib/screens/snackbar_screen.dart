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
          YgSnackbar(
            snackbarVariant: YgSnackbarVariant.highlight,
            message: 'Snackbar provide feedback after users take an action',
            onClose: () {},
          ),
          YgSnackbar(
            snackbarVariant: YgSnackbarVariant.success,
            message: 'Snackbar provide feedback after users take an action',
            onClose: () {},
          ),
          YgSnackbar(
            snackbarVariant: YgSnackbarVariant.critical,
            message: 'Snackbar provide feedback after users take an action',
            onClose: () {},
          )
        ],
      ),
    );
  }
}
