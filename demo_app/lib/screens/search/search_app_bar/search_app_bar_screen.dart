import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/screens/search/search_example_screen_mixin.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class SearchAppBarScreen extends StatefulWidget {
  const SearchAppBarScreen({super.key});

  static const String routeName = 'SearchAppBarScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const SearchAppBarScreen(),
    );
  }

  @override
  State<SearchAppBarScreen> createState() => _SearchAppBarScreenState();
}

class _SearchAppBarScreenState extends State<SearchAppBarScreen> with SearchExampleScreenMixin {
  bool _trailingAvatar = false;
  bool _customLeading = false;
  bool _showSearchIcon = true;
  bool _automaticallyImplyLeading = true;
  int _actionsRadioGroupValue = 1;

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      appBar: YgSearchAppBar(
        keyboardType: TextInputType.streetAddress,
        autocorrect: false,
        textCapitalization: TextCapitalization.sentences,
        placeholder: 'Default search field',
        resultsBuilder: getResultsBuilder(),
        completeAction: YgCompleteAction.focusNext,
        resultTextBuilder: resultTextBuilder,
        showSearchIcon: _showSearchIcon,
        leading: _customLeading
            ? YgIconButton(
                icon: YgIcons.placeholder,
                onPressed: () {},
              )
            : null,
        automaticallyImplyLeading: _automaticallyImplyLeading,
        trailing: _trailingAvatar
            ? YgAvatar(
                initials: 'TR',
                size: YgAvatarSize.medium,
              )
            : null,
      ),
      child: Column(
        children: <Widget>[
          YgSection.list(
            title: 'Show search icon',
            subtitle: 'Whether there should be a search icon in the search bar.',
            children: <Widget>[
              YgCheckboxListTile(
                title: 'Show search icon',
                value: _showSearchIcon,
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
            title: 'Trailing avatar',
            subtitle: 'Optional trailing avatar widget.',
            children: <Widget>[
              YgCheckboxListTile(
                title: 'Trailing avatar',
                value: _trailingAvatar,
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
          const YgSection(
            title: 'Padding to allow the screen to scroll',
            child: SizedBox(height: 666.0),
          ),
        ],
      ),
    );
  }

  Widget? getLeading() {
    if (_trailingAvatar) {
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
    _showSearchIcon = false;
    setState(() {});
  }

  void _setSingleAction(int? newValue) {
    _actionsRadioGroupValue = newValue!;
    setState(() {});
  }

  void _setNoActions(int? newValue) {
    _actionsRadioGroupValue = newValue!;
    setState(() {});
  }

  void _toggleCustomLeading(bool? newValue) {
    _trailingAvatar = newValue!;
    setState(() {});
  }

  void _toggleAutomaticallyImplyLeading(bool? newValue) {
    _automaticallyImplyLeading = newValue!;
    setState(() {});
  }

  void _toggleCenterTitle(bool? newValue) {
    _showSearchIcon = newValue!;
    if (_showSearchIcon) {
      _actionsRadioGroupValue = 2;
    }
    setState(() {});
  }
}
