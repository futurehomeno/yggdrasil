import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/dialogs/example_dialog.dart';
import 'package:yggdrasil_demo/dialogs/non_dismissible_dialog.dart';

import '../widgets/yg_screen.dart';

class DialogScreen extends StatefulWidget {
  const DialogScreen({super.key});

  static const String routeName = 'DialogScreen';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
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
    return YgScreen(
      componentName: 'Dialog',
      componentDesc: 'Dialog',
      supernovaLink: 'Link',
      scrollable: false,
      child: Column(
        children: <Widget>[
          YgButton(
            variant: ButtonVariant.primary,
            onPressed: () {
              Navigator.of(context).push(ExampleDialog());
            },
            child: const Text('Show dialog'),
          ),
          YgButton(
            variant: ButtonVariant.primary,
            onPressed: () {
              Navigator.of(context).push(NonDismissibleDialog());
            },
            child: const Text('Show non dismissible dialog'),
          ),
        ],
      ),
    );
  }
}
