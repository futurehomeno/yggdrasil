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
  State<AppBarSliverScreen> createState() => _AppBarSliverScreenState();
}

class _AppBarSliverScreenState extends State<AppBarSliverScreen> {
  YgSliverAppBarVariant _variant = YgSliverAppBarVariant.small;
  int _variantRadioGroupValue = 1;
  bool _customLeading = false;
  bool _automaticallyImplyLeading = true;
  List<YgIconButton> _actions = <YgIconButton>[];
  int _actionsRadioGroupValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          YgSliverAppBar(
            title: 'App bar',
            leading: getLeading(),
            automaticallyImplyLeading: _automaticallyImplyLeading,
            actions: _actions,
            variant: _variant,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                YgSection.list(
                  title: 'Variant',
                  subtitle: 'The variant (size) of the sliver app bar.',
                  children: <YgListTile>[
                    YgRadioListTile<int>(
                      title: 'Small',
                      value: 1,
                      groupValue: _variantRadioGroupValue,
                      onChanged: (int? newValue) => _setVariant(
                        variant: YgSliverAppBarVariant.small,
                        newValue: newValue,
                      ),
                    ),
                    YgRadioListTile<int>(
                      title: 'Medium',
                      value: 2,
                      groupValue: _variantRadioGroupValue,
                      onChanged: (int? newValue) => _setVariant(
                        variant: YgSliverAppBarVariant.medium,
                        newValue: newValue,
                      ),
                    ),
                    YgRadioListTile<int>(
                      title: 'Large',
                      value: 3,
                      groupValue: _variantRadioGroupValue,
                      onChanged: (int? newValue) => _setVariant(
                        variant: YgSliverAppBarVariant.large,
                        newValue: newValue,
                      ),
                    ),
                  ],
                ),
                YgSection.list(
                  title: 'Automatically imply leading',
                  subtitle:
                      'If true and leading is null, automatically try to deduce what the leading widget should be.',
                  children: <YgListTile>[
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
                  children: <YgListTile>[
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
                      children: <YgListTile>[
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
                          onChanged: (int? newValue) {
                            _setMultipleActions(
                              newValue: newValue,
                              context: context,
                              ygAppState: ygAppState,
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: YgSection(
              title: 'Padding to allow the screen to scroll',
              child: SizedBox(height: 666.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget? getLeading() {
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

  void _setVariant({
    required YgSliverAppBarVariant variant,
    required int? newValue,
  }) {
    _variantRadioGroupValue = newValue!;
    _variant = variant;
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
