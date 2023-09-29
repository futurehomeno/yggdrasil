import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/debug_bottom_sheet.dart';

class AppBarSliverScreen extends StatefulWidget {
  const AppBarSliverScreen({super.key});

  static const String routeName = 'AppBarSliverScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const AppBarSliverScreen(),
    );
  }

  @override
  State<AppBarSliverScreen> createState() => _AppBarScreenState();
}

class _AppBarScreenState extends State<AppBarSliverScreen> {
  final TextEditingController _textEditingController = TextEditingController(text: 'App bar (sliver)');
  YgSliverAppBarVariant _variant = YgSliverAppBarVariant.small;
  int _variantRadioGroupValue = 1;
  bool _customLeading = false;
  bool _centerTitle = false;
  bool _automaticallyImplyLeading = true;
  List<Widget>? _actions;
  int _actionsRadioGroupValue = 1;

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          YgSliverAppBar(
            variant: _variant,
            automaticallyImplyLeading: _automaticallyImplyLeading,
            leading: _customLeading ? YgIconButton(child: const YgIcon(YgIcons.info), onPressed: () {}) : null,
            title: _textEditingController.text,
            actions: _actions,
            centerTitle: _centerTitle,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                YgSection.list(
                  title: 'Variant',
                  subtitle: 'The variant (size) of the sliver app bar.',
                  children: <Widget>[
                    YgRadioListTile<int>(
                      title: 'Small',
                      value: 1,
                      groupValue: _variantRadioGroupValue,
                      onChanged: (int? newValue) {
                        _variantRadioGroupValue = newValue!;
                        _variant = YgSliverAppBarVariant.small;
                        setState(() {});
                      },
                    ),
                    YgRadioListTile<int>(
                      title: 'Medium',
                      value: 2,
                      groupValue: _variantRadioGroupValue,
                      onChanged: (int? newValue) {
                        _variantRadioGroupValue = newValue!;
                        _variant = YgSliverAppBarVariant.medium;
                        setState(() {});
                      },
                    ),
                    YgRadioListTile<int>(
                      title: 'Large',
                      value: 3,
                      groupValue: _variantRadioGroupValue,
                      onChanged: (int? newValue) {
                        _variantRadioGroupValue = newValue!;
                        _variant = YgSliverAppBarVariant.large;
                        setState(() {});
                      },
                    ),
                  ],
                ),
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
                        setState(() {});
                      },
                    ),
                  ],
                ),
                YgSection.list(
                  title: 'Automatically imply leading',
                  subtitle:
                      'If true and leading is null, automatically try to deduce what the leading widget should be.',
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
                        _actions = null;
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
                            setState(() {});
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: YgSection.base(
              title: 'Padding to allow the screen to scroll',
              child: SizedBox(height: 666.0),
            ),
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
