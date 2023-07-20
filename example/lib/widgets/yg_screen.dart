import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';

class YgScreen extends StatelessWidget {
  const YgScreen({
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
    return Consumer<YgAppState>(
      builder: (BuildContext context, YgAppState ygAppState, Widget? widget) {
        return Scaffold(
          appBar: AppBar(
            title: Text(componentName),
            actions: <Widget>[
              YgIcon(
                YgIcons.eyeOpen,
                onTap: ygAppState.toggleOutline,
                tapSize: YgIconTapSize.largest,
              ),
              YgIcon(
                YgIcons.refresh,
                onTap: ygAppState.toggleTheme,
                tapSize: YgIconTapSize.largest,
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: scrollable
                ? SingleChildScrollView(
                    child: SafeArea(
                      child: child,
                    ),
                  )
                : SafeArea(
                    child: child,
                  ),
          ),
        );
      },
    );
  }
}
