import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class SnackBarScreen extends StatelessWidget {
  const SnackBarScreen({super.key});

  static const String routeName = 'SnackBarScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const SnackBarScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'SnackBar',
      componentDesc: 'Snack Bars',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          YgSection.base(
            title: 'Highlight snack bar',
            child: YgButton(
              variant: YgButtonVariant.primary,
              onPressed: () => _showHighlightSnackBar(context),
              child: const Text('Show'),
            ),
          ),
          YgSection.base(
            title: 'Success snack bar',
            child: YgButton(
              variant: YgButtonVariant.primary,
              onPressed: () => _showSuccessSnackBar(context),
              child: const Text('Show'),
            ),
          ),
          YgSection.base(
            title: 'Critical snack bar',
            child: YgButton(
              variant: YgButtonVariant.primary,
              onPressed: () => _showCriticalSnackBar(context),
              child: const Text('Show'),
            ),
          ),
          YgSection.base(
            title: 'Snack bar with root scaffold messenger key',
            child: Consumer<YgAppState>(
              builder: (BuildContext context, YgAppState ygAppState, Widget? widget) {
                return YgButton(
                  variant: YgButtonVariant.primary,
                  onPressed: () => _showCustomKeySnackBar(context, ygAppState.rootScaffoldMessengerKey),
                  child: const Text('Show'),
                );
              },
            ),
          ),
          YgSection.base(
            title: 'Snack bar with custom close callback',
            child: YgButton(
              variant: YgButtonVariant.primary,
              onPressed: () => _showCustomCallbackSnackBar(context),
              child: const Text('Show'),
            ),
          ),
        ],
      ),
    );
  }

  void _showHighlightSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      YgSnackBar(
        context: context,
        message: 'I\'m a highlight snack bar',
      ),
    );
  }

  void _showSuccessSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      YgSnackBar(
        context: context,
        message: 'I\'m a success snack bar',
        variant: YgSnackBarVariant.success,
      ),
    );
  }

  void _showCriticalSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      YgSnackBar(
        context: context,
        message: 'I\'m a critical snack bar',
        variant: YgSnackBarVariant.critical,
      ),
    );
  }

  void _showCustomKeySnackBar(
    BuildContext context,
    GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey,
  ) {
    scaffoldMessengerKey.currentState!.showSnackBar(
      YgSnackBar(
        context: context,
        message: 'I am using the global scaffold messenger key',
        variant: YgSnackBarVariant.highlight,
        scaffoldMessengerKey: scaffoldMessengerKey,
      ),
    );
  }

  void _showCustomCallbackSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      YgSnackBar(
        context: context,
        message: 'Closing me will trigger a critical snack bar',
        variant: YgSnackBarVariant.highlight,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          _showCriticalSnackBar(context);
        },
      ),
    );
  }
}
