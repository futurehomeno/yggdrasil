import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';
import 'package:yggdrasil_demo/widgets/debug_bottom_sheet.dart';

class AppBarScreen extends StatefulWidget {
  const AppBarScreen({super.key});

  static const String routeName = 'AppBarScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const AppBarScreen(),
    );
  }

  @override
  State<AppBarScreen> createState() => _AppBarScreenState();
}

class _AppBarScreenState extends State<AppBarScreen> {
  bool _customLeading = false;
  bool _centerTitle = false;
  bool _automaticallyImplyLeading = true;
  List<YgIconButton> _actions = <YgIconButton>[];
  int _actionsRadioGroupValue = 1;

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      appBar: YgAppBar(
        title: 'App bar',
        leading: _getLeading(),
        automaticallyImplyLeading: _automaticallyImplyLeading,
        actions: _actions,
        centerTitle: _centerTitle,
      ),
      child: YgLayoutBody(
        child: Column(
          children: <Widget>[
            YgSection.list(
              title: 'Center title',
              subtitle: 'Whether the title should be centered.',
              children: <Widget>[
                YgCheckboxListTile(
                  title: 'Center title',
                  value: _centerTitle,
                  onChanged: _toggleCenterTitle,
                ),
              ],
            ),
            YgSection.list(
              title: 'Automatically imply leading',
              subtitle: 'If true and leading is null, automatically try to deduce what the leading widget should be.',
              children: <Widget>[
                YgCheckboxListTile(
                  title: 'Automatically imply leading',
                  value: _automaticallyImplyLeading,
                  onChanged: _toggleAutomaticallyImplyLeading,
                ),
              ],
            ),
            YgSection.list(
              title: 'Leading',
              subtitle: 'Widget to show before the title.',
              children: <Widget>[
                YgCheckboxListTile(
                  title: 'Custom leading',
                  value: _customLeading,
                  onChanged: _toggleCustomLeading,
                ),
              ],
            ),
            Consumer<YgAppState>(
              builder: (BuildContext context, YgAppState ygAppState, Widget? widget) {
                return YgSection.list(
                  title: 'Actions',
                  subtitle: 'Widgets to show after the title.',
                  children: <Widget>[
                    YgRadioListTile<int>(
                      title: 'No actions',
                      value: 1,
                      groupValue: _actionsRadioGroupValue,
                      onChanged: _setNoActions,
                    ),
                    YgRadioListTile<int>(
                      title: 'Single action',
                      value: 2,
                      groupValue: _actionsRadioGroupValue,
                      onChanged: _setSingleAction,
                    ),
                    YgRadioListTile<int>(
                      title: 'Multiple actions (default for demo app)',
                      value: 3,
                      groupValue: _actionsRadioGroupValue,
                      onChanged: (int? newValue) => _setMultipleActions(
                        newValue: newValue,
                        context: context,
                        ygAppState: ygAppState,
                      ),
                    ),
                  ],
                );
              },
            ),
            YgSection(
              title: 'Padding to allow the screen to scroll',
              child: DemoPlaceholder(
                height: MediaQuery.sizeOf(context).height,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget? _getLeading() {
    if (_customLeading) {
      return YgIconButton(
        icon: YgIcons.info,
        onPressed: () {},
      );
    }

    return null;
  }

  void _setMultipleActions({
    required int? newValue,
    required BuildContext context,
    required YgAppState ygAppState,
  }) {
    _actionsRadioGroupValue = newValue!;
    _actions = _defaultActions(context, ygAppState);
    _centerTitle = false;
    setState(() {});
  }

  void _setSingleAction(int? newValue) {
    _actionsRadioGroupValue = newValue!;
    _actions = _singleAction;
    setState(() {});
  }

  void _setNoActions(int? newValue) {
    _actionsRadioGroupValue = newValue!;
    _actions = <YgIconButton>[];
    setState(() {});
  }

  void _toggleCustomLeading(bool? newValue) {
    _customLeading = newValue!;
    setState(() {});
  }

  void _toggleAutomaticallyImplyLeading(bool? newValue) {
    _automaticallyImplyLeading = newValue!;
    setState(() {});
  }

  void _toggleCenterTitle(bool? newValue) {
    _centerTitle = newValue!;
    if (_centerTitle) {
      _actionsRadioGroupValue = 2;
      _actions = _singleAction;
    }
    setState(() {});
  }

  List<YgIconButton> get _singleAction {
    return <YgIconButton>[
      YgIconButton(
        icon: YgIcons.info,
        onPressed: () {},
      ),
    ];
  }

  List<YgIconButton> _defaultActions(BuildContext context, YgAppState ygAppState) {
    return <YgIconButton>[
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
    ];
  }
}
