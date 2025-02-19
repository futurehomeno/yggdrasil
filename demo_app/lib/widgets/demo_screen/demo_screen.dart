import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'demo_app_bar.dart';

part 'demo_screen_regular.dart';
part 'demo_screen_tabbed.dart';

/// Demo screen to use as a base for components screens.
abstract class DemoScreen extends StatelessWidget {
  const factory DemoScreen({
    Key? key,
    required Widget child,
    Widget? appBar,
    String? componentName,
    YgHeaderBehavior headerBehavior,
  }) = _DemoScreenRegular;

  const factory DemoScreen.tabbed({
    Key? key,
    required List<YgLayoutTab> tabs,
    Widget? appBar,
    String? componentName,
    YgHeaderBehavior headerBehavior,
  }) = _DemoScreenTabbed;

  const DemoScreen._({
    super.key,
    this.componentName,
    this.appBar,
    this.headerBehavior = YgHeaderBehavior.fixed,
  }) : assert(componentName != null || appBar != null, 'Either componentName or appBar must be provided.');

  final YgHeaderBehavior headerBehavior;
  final String? componentName;
  final Widget? appBar;

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

    return DemoAppBar(
      title: componentName ?? '',
    );
  }
}
