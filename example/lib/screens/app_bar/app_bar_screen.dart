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
  final TextEditingController _textEditingController = TextEditingController(text: 'App bar');
  bool _customLeading = false;
  bool _centerTitle = false;
  bool _automaticallyImplyLeading = true;
  List<Widget> _actions = <Widget>[];
  int _actionsRadioGroupValue = 1;

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      appBar: YgAppBar(
        automaticallyImplyLeading: _automaticallyImplyLeading,
        leading: _customLeading ? YgIconButton(child: const YgIcon(YgIcons.info), onPressed: () {}) : null,
        title: _textEditingController.text,
        actions: _actions,
        centerTitle: _centerTitle,
      ),
      child: Column(
        children: <Widget>[
          YgSection.base(
            title: 'Title',
            subtitle: 'Change the title. It can be really long.',
            child: YgTextField(
              label: 'Title',
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              autocorrect: true,
              textCapitalization: TextCapitalization.words,
              controller: _textEditingController,
              onChanged: (String value) => setState(() {}),
            ),
          ),
          YgSection.list(
            title: 'Center title',
            subtitle: 'Whether the title should be centered.',
            children: <Widget>[
              YgCheckboxListTile(
                title: 'Center title',
                value: _centerTitle,
                onChanged: (bool? newValue) {
                  _centerTitle = newValue!;
                  if (_centerTitle) {
                    _actionsRadioGroupValue = 2;
                    _actions = _singleAction;
                  }
                  setState(() {});
                },
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
                onChanged: (bool? newValue) {
                  _automaticallyImplyLeading = newValue!;
                  setState(() {});
                },
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
                onChanged: (bool? newValue) {
                  _customLeading = newValue!;
                  setState(() {});
                },
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
                onChanged: (int? newValue) {
                  _actionsRadioGroupValue = newValue!;
                  _actions = <Widget>[];
                  setState(() {});
                },
              ),
              YgRadioListTile<int>(
                title: 'Single action',
                value: 2,
                groupValue: _actionsRadioGroupValue,
                onChanged: (int? newValue) {
                  _actionsRadioGroupValue = newValue!;
                  _actions = _singleAction;
                  setState(() {});
                },
              ),
              Consumer<YgAppState>(
                builder: (BuildContext context, YgAppState ygAppState, Widget? widget) {
                  return YgRadioListTile<int>(
                    title: 'Multiple actions (default for demo app)',
                    value: 3,
                    groupValue: _actionsRadioGroupValue,
                    onChanged: (int? newValue) {
                      _actionsRadioGroupValue = newValue!;
                      _actions = _defaultActions(context, ygAppState);
                      _centerTitle = false;
                      setState(() {});
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
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
