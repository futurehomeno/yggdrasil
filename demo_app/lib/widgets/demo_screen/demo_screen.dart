import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';

import '../debug_bottom_sheet.dart';

part 'demo_screen_regular.dart';
part 'demo_screen_tabbed.dart';

/// Demo screen to use as a base for components screens.
abstract class DemoScreen extends StatelessWidget {
  const factory DemoScreen({
    Key? key,
    required Widget child,
    Widget? appBar,
    Widget? bottom,
    String? componentName,
  }) = _DemoScreenRegular;

  const factory DemoScreen.tabbed({
    Key? key,
    required List<YgLayoutTab> tabs,
    Widget? appBar,
    Widget? bottom,
    String? componentName,
  }) = _DemoScreenTabbed;

  const DemoScreen._({
    super.key,
    this.componentName,
    this.appBar,
    this.bottom,
  }) : assert(componentName != null || appBar != null, 'Either componentName or appBar must be provided.');

  final String? componentName;
  final Widget? appBar;
  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    return _buildLayout(
      context,
      _buildAppBar(context),
    );
  }

  Widget _buildLayout(BuildContext context, Widget appBar);

  Widget _buildAppBar(BuildContext context) {
    final Widget? appBar = this.appBar;
    if (appBar != null) {
      return appBar;
    }

    return Consumer<YgAppState>(
      builder: (BuildContext context, YgAppState ygAppState, Widget? widget) {
        return YgAppBar2(
          title: componentName ?? '',
          centerTitle: false,
          leading: const Padding(
            padding: EdgeInsets.all(12.5),
            child: YgIcon(
              YgIcons.yggColorful,
            ),
          ),
          actions: <YgIconButton>[
            YgIconButton(
              onPressed: () => YgDebug.toggleDebugging(context),
              onLongPress: () => Navigator.of(context).push(DebugBottomSheet()),
              icon: YgIcons.eyeOpen,
            ),
            YgIconButton(
              onPressed: ygAppState.toggleProfessionalTheme,
              icon: YgIcons.power,
            ),
            YgIconButton(
              onPressed: ygAppState.toggleDarkMode,
              icon: YgIcons.refresh,
            ),
          ],
        );
      },
    );
  }
}
