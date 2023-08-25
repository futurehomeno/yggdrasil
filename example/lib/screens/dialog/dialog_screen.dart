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
      componentDesc: 'Dialogs',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          YgSection.column(
            title: 'Normal dialog',
            children: <Widget>[
              YgButton(
                variant: YgButtonVariant.primary,
                onPressed: () => Navigator.of(context).push(ExampleDialog()),
                child: const Text('Show'),
              ),
            ],
          ),
          YgSection.column(
            title: 'Non-dismissible dialog',
            children: <Widget>[
              YgButton(
                variant: YgButtonVariant.primary,
                onPressed: () => Navigator.of(context).push(ExampleDialogNonDismissible()),
                child: const Text('Show'),
              ),
            ],
          ),
          YgSection.column(
            title: 'No-buttons dialog',
            children: <Widget>[
              YgButton(
                variant: YgButtonVariant.primary,
                onPressed: () => Navigator.of(context).push(ExampleDialogNoButtons()),
                child: const Text('Show'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
