import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/screens/_screens.dart';
import 'package:yggdrasil_demo/screens/layout/layout_screen.dart';
import 'package:yggdrasil_demo/screens/layout_examples/device_details/device_details_example.dart';
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
    return Consumer<YgAppState>(builder: (BuildContext context, YgAppState ygAppState, Widget? child) {
      return DemoScreen.tabbed(
        componentName: 'Yggdrasil v${ygAppState.version}',
        tabs: <YgLayoutTab>[
          YgLayoutTab(
            title: 'Components',
            content: YgLayoutBody.sliver(
              sliver: SliverList.list(
                children: <Widget>[
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
                    title: 'Avatar',
                    onTap: () => sl<YgRouter>().push(AvatarScreen.route()),
                    trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                  ),
                  YgListTile(
                    title: 'AvatarStack',
                    onTap: () => sl<YgRouter>().push(AvatarStackScreen.route()),
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
                    title: 'Layout',
                    onTap: () => sl<YgRouter>().push(LayoutScreen.route()),
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
                    title: 'MobileScannerContainer',
                    onTap: () => sl<YgRouter>().push(MobileScannerContainerScreen.route()),
                    trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                  ),
                  YgListTile(
                    title: 'Picker',
                    onTap: () => sl<YgRouter>().push(PickerScreen.route()),
                    trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                  ),
                  YgListTile(
                    title: 'ProgressIndicator',
                    onTap: () => sl<YgRouter>().push(ProgressIndicatorScreen.route()),
                    trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                  ),
                  YgListTile(
                    title: 'Pulse',
                    onTap: () => sl<YgRouter>().push(PulseScreen.route()),
                    trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                  ),
                  YgListTile(
                    title: 'Radio',
                    onTap: () => sl<YgRouter>().push(RadioScreen.route()),
                    trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                  ),
                  YgListTile(
                    title: 'SearchField',
                    onTap: () => sl<YgRouter>().push(SearchFieldScreen.route()),
                    trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                  ),
                  // YgListTile(
                  //   title: 'ScrollableDropdownTest',
                  //   onTap: () => sl<YgRouter>().push(ScrollableDropdownTestScreen.route()),
                  //   trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                  // ),
                  YgListTile(
                    title: 'SearchBar',
                    onTap: () => sl<YgRouter>().push(SearchBarScreen.route()),
                    trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                  ),
                  YgListTile(
                    title: 'SearchAppBar',
                    onTap: () => sl<YgRouter>().push(SearchAppBarScreen.route()),
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
                    title: 'SectionHeader',
                    onTap: () => sl<YgRouter>().push(SectionHeaderScreen.route()),
                    trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                  ),
                  YgListTile(
                    title: 'SegmentedButton',
                    onTap: () => sl<YgRouter>().push(SegmentedButtonScreen.route()),
                    trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                  ),
                  YgListTile(
                    title: 'Slider',
                    onTap: () => sl<YgRouter>().push(SliderScreen.route()),
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
                    title: 'Statistics - MiniBarGraph',
                    onTap: () => sl<YgRouter>().push(MiniBarGraphScreen.route()),
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
          ),
          YgLayoutTab(
            title: 'Layouts',
            content: YgLayoutBody(
              child: Column(
                children: <Widget>[
                  YgListTile(
                    title: 'Device details',
                    onTap: () => sl<YgRouter>().push(DeviceDetailsExample.route()),
                    trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
