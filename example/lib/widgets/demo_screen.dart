import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/debug_bottom_sheet.dart';

/// Demo screen to use as a base for components screens.
class DemoScreen extends StatelessWidget {
  const DemoScreen({
    super.key,
    required this.child,
    this.componentName,
    this.appBar,
    this.scrollable = true,
    this.bottom,
  }) : assert(componentName != null || appBar != null, 'Either componentName or appBar must be provided.');

  final Widget child;
  final String? componentName;
  final YgAppBar? appBar;
  final bool scrollable;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    final SafeArea child = SafeArea(
      child: this.child,
    );

    return Consumer<YgAppState>(
      builder: (BuildContext context, YgAppState ygAppState, Widget? widget) {
        return Scaffold(
          appBar: appBar ??
              YgAppBar(
                title: componentName ?? '',
                centerTitle: false,
                leading: const YgIconButton(
                  onPressed: null,
                  child: YgIcon(
                    YgIcons.ygg,
                    useEmbeddedColor: true,
                  ),
                ),
                actions: <YgIconButton>[
                  YgIconButton(
                    onPressed: () => YgDebug.toggleDebugging(context),
                    onLongPress: () => Navigator.of(context).push(DebugBottomSheet()),
                    child: const YgIcon(YgIcons.eyeOpen),
                  ),
                  YgIconButton(
                    onPressed: ygAppState.toggleProfessionalTheme,
                    child: const YgIcon(YgIcons.power),
                  ),
                  YgIconButton(
                    onPressed: ygAppState.toggleDarkMode,
                    child: const YgIcon(YgIcons.refresh),
                  ),
                ],
                bottom: bottom,
              ),
          body: scrollable ? SingleChildScrollView(child: child) : child,
        );
      },
    );
  }
}
