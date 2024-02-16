import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

import 'widgets/_widgets.dart';

class DialogScreen extends StatefulWidget {
  const DialogScreen({super.key});

  static const String routeName = 'DialogScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const DialogScreen(),
    );
  }

  @override
  State<DialogScreen> createState() => _DialogScreenState();
}

class _DialogScreenState extends State<DialogScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'Dialog',
      child: Column(
        children: <Widget>[
          YgSection(
            title: 'Normal dialog',
            child: YgButton(
              variant: YgButtonVariant.primary,
              onPressed: () => Navigator.of(context).push(ExampleDialog()),
              child: const Text('Show'),
            ),
          ),
          YgSection(
            title: 'Non-dismissible dialog',
            child: YgButton(
              variant: YgButtonVariant.primary,
              onPressed: () => Navigator.of(context).push(ExampleDialogNonDismissible()),
              child: const Text('Show'),
            ),
          ),
          YgSection(
            title: 'No-buttons dialog',
            child: YgButton(
              variant: YgButtonVariant.primary,
              onPressed: () => Navigator.of(context).push(ExampleDialogNoButtons()),
              child: const Text('Show'),
            ),
          ),
          YgSection.column(
            title: 'Variants',
            children: <Widget>[
              YgButton(
                variant: YgButtonVariant.primary,
                onPressed: () => Navigator.of(context).push(ErrorDialog()),
                child: const Text('Show error dialog'),
              ),
              YgButton(
                variant: YgButtonVariant.primary,
                onPressed: () => Navigator.of(context).push(InfoDialog()),
                child: const Text('Show info dialog'),
              ),
              YgButton(
                variant: YgButtonVariant.primary,
                onPressed: () => Navigator.of(context).push(SuccessDialog()),
                child: const Text('Show success dialog'),
              ),
              YgButton(
                variant: YgButtonVariant.primary,
                onPressed: () => Navigator.of(context).push(LoadingDialog()),
                child: const Text('Show loading dialog'),
              ),
            ].withVerticalSpacing(10),
          ),
        ],
      ),
    );
  }
}
