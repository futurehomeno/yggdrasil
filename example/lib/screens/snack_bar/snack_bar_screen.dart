import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

import 'widgets/_widgets.dart';

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
      child: Column(
        children: <Widget>[
          YgSection(
            title: 'Highlight snack bar',
            child: YgButton(
              variant: YgButtonVariant.primary,
              onPressed: () => _showHighlightSnackBar(context),
              child: const Text('Show'),
            ),
          ),
          YgSection(
            title: 'Success snack bar',
            child: YgButton(
              variant: YgButtonVariant.primary,
              onPressed: () => _showSuccessSnackBar(context),
              child: const Text('Show'),
            ),
          ),
          YgSection(
            title: 'Critical snack bar',
            child: YgButton(
              variant: YgButtonVariant.primary,
              onPressed: () => _showCriticalSnackBar(context),
              child: const Text('Show'),
            ),
          ),
          YgSection(
            title: 'Snack bar with root scaffold messenger key',
            child: Consumer<YgAppState>(
              builder: (BuildContext context, YgAppState ygAppState, Widget? widget) {
                final GlobalKey<YgSnackBarManagerState> snackBarManagerKey = ygAppState.rootSnackBarManagerKey;

                return YgButton(
                  variant: YgButtonVariant.primary,
                  onPressed: () => _showCustomKeySnackBar(snackBarManagerKey),
                  child: const Text('Show'),
                );
              },
            ),
          ),
          YgSection(
            title: 'Snack bar with custom close callback',
            child: YgButton(
              variant: YgButtonVariant.primary,
              onPressed: () => _showCustomCallbackSnackBar(context),
              child: const Text('Show'),
            ),
          ),
          YgSection(
            title: 'Snack bar with a long text',
            child: YgButton(
              variant: YgButtonVariant.primary,
              onPressed: () => _showLongTextSnackBar(context),
              child: const Text('Show'),
            ),
          ),
          YgSection(
            title: 'Snackbar on top of dialog',
            child: YgButton(
              variant: YgButtonVariant.primary,
              onPressed: () => Navigator.of(context).push(SnackBarExampleDialog()),
              child: const Text('Show'),
            ),
          ),
        ],
      ),
    );
  }

  void _showLongTextSnackBar(BuildContext context) {
    YgSnackBarManager.of(context).showSnackBar(
      const YgSnackBar(
        message: 'I am a snack bar with quite some text in it, probably a couple lines worth of text',
      ),
    );
  }

  void _showHighlightSnackBar(BuildContext context) {
    YgSnackBarManager.of(context).showSnackBar(
      const YgSnackBar(
        message: 'I\'m a highlight snack bar',
      ),
    );
  }

  void _showSuccessSnackBar(BuildContext context) {
    YgSnackBarManager.of(context).showSnackBar(
      const YgSnackBar(
        message: 'I\'m a success snack bar',
        variant: YgSnackBarVariant.success,
      ),
    );
  }

  void _showCriticalSnackBar(BuildContext context) {
    YgSnackBarManager.of(context).showSnackBar(
      const YgSnackBar(
        message: 'I\'m a critical snack bar',
        variant: YgSnackBarVariant.critical,
      ),
    );
  }

  void _showCustomKeySnackBar(
    GlobalKey<YgSnackBarManagerState> scaffoldMessengerKey,
  ) {
    scaffoldMessengerKey.currentState!.showSnackBar(
      const YgSnackBar(
        message: 'I am using the global scaffold messenger key',
        variant: YgSnackBarVariant.highlight,
      ),
    );
  }

  void _showCustomCallbackSnackBar(BuildContext context) {
    YgSnackBarManager.of(context).showSnackBar(
      YgSnackBar(
        message: 'Closing me will trigger a critical snack bar',
        variant: YgSnackBarVariant.highlight,
        onClosePressed: () {
          _showCriticalSnackBar(context);
        },
      ),
    );
  }
}
