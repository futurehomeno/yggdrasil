import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class SnackBarScreen extends StatelessWidget {
  const SnackBarScreen({super.key});

  static const String routeName = 'SnackBarScreen';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const SnackBarScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YgScreen(
      componentName: 'SnackBar',
      componentDesc: 'Snack Bars',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          const YgListTile(title: 'Highlight snack bar'),
          YgButton(
            variant: YgButtonVariant.primary,
            onPressed: () => _showHighlightSnackBar(context),
            child: const Text('Show'),
          ),
          const YgListTile(title: 'Success snack bar'),
          YgButton(
            variant: YgButtonVariant.primary,
            onPressed: () => _showSuccessSnackBar(context),
            child: const Text('Show'),
          ),
          const YgListTile(title: 'Critical snack bar'),
          YgButton(
            variant: YgButtonVariant.primary,
            onPressed: () => _showCriticalSnackBar(context),
            child: const Text('Show'),
          ),
        ],
      ),
    );
  }

  void _showHighlightSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      YgSnackBar(
        context: context,
        message: 'Snack bars provide feedback after users take an action',
      ),
    );
  }

  void _showSuccessSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      YgSnackBar(
        context: context,
        message: 'Snack bars provide feedback after users take an action',
        variant: YgSnackBarVariant.success,
      ),
    );
  }

  void _showCriticalSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      YgSnackBar(
        context: context,
        message: 'Snack bars provide feedback after users take an action',
        variant: YgSnackBarVariant.critical,
      ),
    );
  }
}
