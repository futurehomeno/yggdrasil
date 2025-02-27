import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/screens/layout/multi_view/layout_tabbed_screen.dart';
import 'package:yggdrasil_demo/screens/layout/views/_views.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

import 'configurable_layout/configurable_layout_screen.dart';
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
      child: YgLayoutBody(
        child: Column(
          children: <Widget>[
            YgSection.list(
              title: 'Advanced layouts',
              children: <Widget>[
                YgListTile(
                  title: 'Configurable layout',
                  onTap: () => sl<YgRouter>().push(ConfigurableLayoutScreen.route()),
                  trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                ),
              ],
            ),
            YgSection.list(
              title: 'Simple layouts',
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
            YgSection.list(
              title: 'Build in views',
              children: <Widget>[
                YgListTile(
                  title: 'Loading view',
                  onTap: () => sl<YgRouter>().push(LoadingViewScreen.route()),
                  trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                ),
                YgListTile(
                  title: 'Error view',
                  onTap: () => sl<YgRouter>().push(ErrorViewScreen.route()),
                  trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                ),
                YgListTile(
                  title: 'Error retry view',
                  onTap: () => sl<YgRouter>().push(ErrorRetryViewScreen.route()),
                  trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
