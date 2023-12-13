import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/screens/_screens.dart';
import 'package:yggdrasil_demo/screens/layout_examples/_examples.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = 'HomeScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Consumer<YgAppState>(builder: (BuildContext context, YgAppState ygAppState, Widget? child) {
        return DemoScreen(
          componentName: 'Yggdrasil - ${ygAppState.version}',
          bottom: const YgTabBar(
            tabs: <YgTab>[
              YgTab(label: 'Components'),
              YgTab(label: 'Layouts'),
            ],
          ),
          scrollable: false,
          child: TabBarView(
            children: <Widget>[
              SingleChildScrollView(
                child: YgSection.list(
                  children: <YgListTile>[
                    YgListTile(
                      title: 'AppBar',
                      onTap: () => sl<YgRouter>().push(AppBarScreen.route()),
                      trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                    ),
                    YgListTile(
                      title: 'AppBar (sliver)',
                      onTap: () => sl<YgRouter>().push(AppBarSliverScreen.route()),
                      trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                    ),
                    YgListTile(
                      title: 'Badge',
                      onTap: () => sl<YgRouter>().push(BadgeScreen.route()),
                      trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                    ),
                    YgListTile(
                      title: 'BottomSheet',
                      onTap: () => sl<YgRouter>().push(BottomSheetScreen.route()),
                      trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                    ),
                    YgListTile(
                      title: 'Buttons',
                      onTap: () => sl<YgRouter>().push(ButtonScreen.route()),
                      trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                    ),
                    YgListTile(
                      title: 'ButtonGroup',
                      onTap: () => sl<YgRouter>().push(ButtonGroupScreen.route()),
                      trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                    ),
                    YgListTile(
                      title: 'Callout',
                      onTap: () => sl<YgRouter>().push(CalloutScreen.route()),
                      trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                    ),
                    YgListTile(
                      title: 'Cards',
                      onTap: () => sl<YgRouter>().push(CardScreen.route()),
                      trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                    ),
                    YgListTile(
                      title: 'Checkbox',
                      onTap: () => sl<YgRouter>().push(CheckboxScreen.route()),
                      trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                    ),
                    YgListTile(
                      title: 'Dialog',
                      onTap: () => sl<YgRouter>().push(DialogScreen.route()),
                      trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                    ),
                    YgListTile(
                      title: 'Divider',
                      onTap: () => sl<YgRouter>().push(DividerScreen.route()),
                      trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                    ),
                    YgListTile(
                      title: 'DropdownField',
                      onTap: () => sl<YgRouter>().push(DropdownFieldScreen.route()),
                      trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                    ),
                    YgListTile(
                      title: 'Icon',
                      onTap: () => sl<YgRouter>().push(IconScreen.route()),
                      trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                    ),
                    YgListTile(
                      title: 'IconButton',
                      onTap: () => sl<YgRouter>().push(IconButtonScreen.route()),
                      trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                    ),
                    YgListTile(
                      title: 'Icon list (all icons)',
                      onTap: () => sl<YgRouter>().push(IconListScreen.route()),
                      trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                    ),
                    YgListTile(
                      title: 'List',
                      onTap: () => sl<YgRouter>().push(ListScreen.route()),
                      trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                    ),
                    YgListTile(
                      title: 'ListTile',
                      onTap: () => sl<YgRouter>().push(ListTileScreen.route()),
                      trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                    ),
                    YgListTile(
                      title: 'ListTile - CheckboxListTile',
                      onTap: () => sl<YgRouter>().push(CheckboxListTileScreen.route()),
                      trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                    ),
                    YgListTile(
                      title: 'ListTile - RadioListTile',
                      onTap: () => sl<YgRouter>().push(RadioListTileScreen.route()),
                      trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                    ),
                    YgListTile(
                      title: 'ListTile - SwitchListTile',
                      onTap: () => sl<YgRouter>().push(SwitchListTileScreen.route()),
                      trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                    ),
                    YgListTile(
                      title: 'ListTile - ExpandingListTile',
                      onTap: () => sl<YgRouter>().push(ExpandingListTileScreen.route()),
                      trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                    ),
                    YgListTile(
                      title: 'ProgressIndicator',
                      onTap: () => sl<YgRouter>().push(ProgressIndicatorScreen.route()),
                      trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                    ),
                    YgListTile(
                      title: 'Radio',
                      onTap: () => sl<YgRouter>().push(RadioScreen.route()),
                      trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                    ),
                    YgListTile(
                      title: 'Section',
                      onTap: () => sl<YgRouter>().push(SectionScreen.route()),
                      trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                    ),
                    YgListTile(
                      title: 'Section - Expanding',
                      onTap: () => sl<YgRouter>().push(ExpandingSectionScreen.route()),
                      trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                    ),
                    YgListTile(
                      title: 'Snack bar',
                      onTap: () => sl<YgRouter>().push(SnackBarScreen.route()),
                      trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                    ),
                    YgListTile(
                      title: 'Stepper',
                      onTap: () => sl<YgRouter>().push(StepperScreen.route()),
                      trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                    ),
                    YgListTile(
                      title: 'Switch',
                      onTap: () => sl<YgRouter>().push(SwitchScreen.route()),
                      trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                    ),
                    YgListTile(
                      title: 'Statistics - Gauge',
                      onTap: () => sl<YgRouter>().push(GaugeScreen.route()),
                      trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                    ),
                    YgListTile(
                      title: 'Tabs',
                      onTap: () => sl<YgRouter>().push(TabsScreen.route()),
                      trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                    ),
                    YgListTile(
                      title: 'Tags',
                      onTap: () => sl<YgRouter>().push(TagScreen.route()),
                      trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                    ),
                    YgListTile(
                      title: 'TextField',
                      onTap: () => sl<YgRouter>().push(TextFieldScreen.route()),
                      trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                    ),
                    YgListTile(
                      title: 'TextLink',
                      onTap: () => sl<YgRouter>().push(TextLinkScreen.route()),
                      trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                    ),
                    YgListTile(
                      title: 'ToggleButton',
                      onTap: () => sl<YgRouter>().push(ToggleButtonScreen.route()),
                      trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                    ),
                    YgListTile(
                      title: 'WizardHeader',
                      onTap: () => sl<YgRouter>().push(WizardHeaderScreen.route()),
                      trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: YgSection.list(
                  children: <YgListTile>[
                    YgListTile(
                      title: 'Device details',
                      onTap: () => sl<YgRouter>().push(DeviceDetailsExample.route()),
                      trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
