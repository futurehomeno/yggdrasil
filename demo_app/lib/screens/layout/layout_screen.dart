import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/screens/layout/multi_view/layout_tabbed_screen.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

import 'regular/_regular.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  static const String routeName = 'LayoutScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const LayoutScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'Layout',
      child: Column(
        children: <Widget>[
          YgSection.list(
            title: 'Regular layouts',
            children: <Widget>[
              YgListTile(
                title: 'Default layout',
                onTap: () => sl<YgRouter>().push(LayoutRegularScreen.route()),
                trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
              ),
              YgListTile(
                title: 'Centered content',
                onTap: () => sl<YgRouter>().push(LayoutRegularCenteredScreen.route()),
                trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
              ),
              YgListTile(
                title: 'Scrollable content',
                onTap: () => sl<YgRouter>().push(LayoutRegularScrollableScreen.route()),
                trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
              ),
              YgListTile(
                title: 'Infinite scroll content',
                onTap: () => sl<YgRouter>().push(LayoutRegularSliverScreen.route()),
                trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
              ),
              YgListTile(
                title: 'Sticky footer',
                onTap: () => sl<YgRouter>().push(LayoutRegularStickyFooterScreen.route()),
                trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
              ),
              YgListTile(
                title: 'Push down footer',
                onTap: () => sl<YgRouter>().push(LayoutRegularPushDownFooterScreen.route()),
                trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
              ),
            ],
          ),
          YgSection.list(
            title: 'Multi view layouts',
            children: <Widget>[
              YgListTile(
                title: 'Tabbed layout',
                onTap: () => sl<YgRouter>().push(LayoutTabbedScreen.route()),
                trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
