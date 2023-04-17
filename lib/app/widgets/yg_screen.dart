import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yggdrasil/app/core/_core.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

class YgScreen extends StatelessWidget {
  const YgScreen({
    required this.componentName,
    required this.componentDesc,
    required this.supernovaLink,
    required this.child,
    super.key,
  });

  final String componentName;
  final String componentDesc;
  final String supernovaLink;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(componentName),
        actions: <Widget>[
          Consumer<YgAppState>(
            builder: (BuildContext context, YgAppState ygAppState, Widget? widget) {
              return IconButton(
                onPressed: ygAppState.toggleTheme,
                icon: Icon(_buildThemeIcon(context, ygAppState)),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: child,
      ),
    );
  }

  IconData _buildThemeIcon(BuildContext context, YgAppState ygAppState) {
    if (ygAppState.currentTheme == YgTheme.consumerLight) {
      return Icons.dark_mode_outlined;
    }
    return Icons.light_mode_outlined;
  }
}
