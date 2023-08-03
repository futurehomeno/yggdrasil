import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({
    super.key,
    required this.componentName,
    required this.componentDesc,
    required this.supernovaLink,
    required this.child,
    this.scrollable = true,
  });

  final String componentName;
  final String componentDesc;
  final String supernovaLink;
  final bool scrollable;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final SafeArea child = SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: this.child,
      ),
    );

    return Consumer<YgAppState>(
      builder: (BuildContext context, YgAppState ygAppState, Widget? widget) {
        return Scaffold(
          appBar: AppBar(
            title: Text(componentName),
            actions: <Widget>[
              YgIconButton(
                onPressed: ygAppState.toggleDebugOutlineEnabled,
                child: const YgIcon(YgIcons.eyeOpen),
              ),
              YgIconButton(
                onPressed: ygAppState.toggleProfessionalTheme,
                child: const Icon(Icons.business),
              ),
              YgIconButton(
                onPressed: ygAppState.toggleDarkMode,
                child: const YgIcon(YgIcons.refresh),
              ),
            ],
          ),
          body: scrollable
              ? SingleChildScrollView(
                  child: child,
                )
              : child,
        );
      },
    );
  }
}
