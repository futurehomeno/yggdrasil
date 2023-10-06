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
  List<Widget> _actions = <Widget>[];
  int _actionsRadioGroupValue = 1;

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      appBar: YgAppBar(
        automaticallyImplyLeading: _automaticallyImplyLeading,
        leading: getLeading(),
        title:
            'App bar super long title that should be truncated with ellipsis and not wrap to multiple lines and should be centered if centerTitle is true',
        actions: _actions,
        centerTitle: _centerTitle,
      ),
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
          YgSection.list(
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
              Consumer<YgAppState>(
                builder: (BuildContext context, YgAppState ygAppState, Widget? widget) {
                  return YgRadioListTile<int>(
                    title: 'Multiple actions (default for demo app)',
                    value: 3,
                    groupValue: _actionsRadioGroupValue,
                    onChanged: (int? newValue) {
                      _setMultipleActions(
                        newValue: newValue,
                        context: context,
                        ygAppState: ygAppState,
                      );
                    },
                  );
                },
              ),
            ],
          ),
          const YgSection.base(
            title: 'Padding to allow the screen to scroll',
            child: SizedBox(height: 666.0),
          ),
        ],
      ),
    );
  }

  Widget? getLeading() {
    if (_customLeading) {
      return YgIconButton(
        child: const YgIcon(YgIcons.info),
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
    _actions = <Widget>[];
    setState(() {});
  }

  void _toggleCustomLeading(bool? newValue) {
    _customLeading = newValue!;
    if (_customLeading) {
      _automaticallyImplyLeading = false;
    }
    setState(() {});
  }

  void _toggleAutomaticallyImplyLeading(bool? newValue) {
    _automaticallyImplyLeading = newValue!;
    if (_automaticallyImplyLeading) {
      _customLeading = false;
    }
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

  List<Widget> get _singleAction {
    return <Widget>[
      YgIconButton(
        child: const YgIcon(YgIcons.info),
        onPressed: () {},
      ),
    ];
  }

  List<Widget> _defaultActions(BuildContext context, YgAppState ygAppState) {
    return <Widget>[
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
    ];
  }
}
