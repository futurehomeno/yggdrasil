import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

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
      componentDesc: 'Dialogs',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          const YgListTile(title: 'Normal dialog'),
          YgButton(
            variant: YgButtonVariant.primary,
            onPressed: () => Navigator.of(context).push(ExampleDialog()),
            child: const Text('Show'),
          ),
          const YgListTile(title: 'Non-dismissible dialog'),
          YgButton(
            variant: YgButtonVariant.primary,
            onPressed: () => Navigator.of(context).push(ExampleDialogNonDismissible()),
            child: const Text('Show'),
          ),
          const YgListTile(title: 'No-buttons dialog'),
          YgButton(
            variant: YgButtonVariant.primary,
            onPressed: () => Navigator.of(context).push(ExampleDialogNoButtons()),
            child: const Text('Show'),
          ),
        ],
      ),
    );
  }
}
