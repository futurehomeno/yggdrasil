import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class ToggleButtonScreen extends StatefulWidget {
  const ToggleButtonScreen({super.key});

  static const String routeName = 'ToggleButtonScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const ToggleButtonScreen(),
    );
  }

  @override
  State<ToggleButtonScreen> createState() => _ToggleButtonScreenState();
}

class _ToggleButtonScreenState extends State<ToggleButtonScreen> {
  bool iconValue1 = false;
  bool iconValue2 = false;
  bool iconValue3 = false;
  bool textValue1 = false;
  bool textValue2 = false;
  bool textValue3 = false;
  bool iconTextValue1 = false;
  bool iconTextValue2 = false;
  bool iconTextValue3 = false;
  bool enabled = true;
  bool disabled = false;

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'ToggleButton',
      componentDesc: 'ToggleButtons',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          YgSection.base(
            title: 'Icon toggle button',
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                YgToggleButton.withIcon(
                  icon: YgIcons.info,
                  value: iconValue1,
                  size: YgToggleButtonSize.small,
                  onChanged: (bool newValue) {
                    iconValue1 = newValue;
                    setState(() {});
                  },
                ),
                YgToggleButton.withIcon(
                  icon: YgIcons.info,
                  value: iconValue2,
                  size: YgToggleButtonSize.medium,
                  onChanged: (bool newValue) {
                    iconValue2 = newValue;
                    setState(() {});
                  },
                ),
                YgToggleButton.withIcon(
                  icon: YgIcons.info,
                  value: iconValue3,
                  size: YgToggleButtonSize.large,
                  onChanged: (bool newValue) {
                    iconValue3 = newValue;
                    setState(() {});
                  },
                ),
              ].withHorizontalSpacing(10.0),
            ),
          ),
          YgSection.base(
            title: 'Text toggle button',
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                YgToggleButton.withText(
                  text: 'Toggle',
                  value: textValue1,
                  size: YgToggleButtonSize.small,
                  onChanged: (bool newValue) {
                    textValue1 = newValue;
                    setState(() {});
                  },
                ),
                YgToggleButton.withText(
                  text: 'Toggle',
                  value: textValue2,
                  size: YgToggleButtonSize.medium,
                  onChanged: (bool newValue) {
                    textValue2 = newValue;
                    setState(() {});
                  },
                ),
                YgToggleButton.withText(
                  text: 'Toggle',
                  value: textValue3,
                  size: YgToggleButtonSize.large,
                  onChanged: (bool newValue) {
                    textValue3 = newValue;
                    setState(() {});
                  },
                ),
              ].withHorizontalSpacing(10.0),
            ),
          ),
          YgSection.base(
            title: 'Icon & text toggle button',
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                YgToggleButton.withText(
                  icon: YgIcons.info,
                  text: 'Toggle',
                  value: iconTextValue1,
                  size: YgToggleButtonSize.small,
                  onChanged: (bool newValue) {
                    iconTextValue1 = newValue;
                    setState(() {});
                  },
                ),
                YgToggleButton.withText(
                  icon: YgIcons.info,
                  text: 'Toggle',
                  value: iconTextValue2,
                  size: YgToggleButtonSize.medium,
                  onChanged: (bool newValue) {
                    iconTextValue2 = newValue;
                    setState(() {});
                  },
                ),
                YgToggleButton.withText(
                  icon: YgIcons.info,
                  text: 'Toggle',
                  value: iconTextValue3,
                  size: YgToggleButtonSize.large,
                  onChanged: (bool newValue) {
                    iconTextValue3 = newValue;
                    setState(() {});
                  },
                ),
              ].withHorizontalSpacing(10.0),
            ),
          ),
          YgSection.column(
            title: 'Disabled',
            children: <Widget>[
              YgToggleButton.withText(
                icon: YgIcons.info,
                text: 'Disabled (selected)',
                value: enabled,
                size: YgToggleButtonSize.medium,
                onChanged: null,
              ),
              YgToggleButton.withText(
                icon: YgIcons.info,
                text: 'Disabled (deselected)',
                value: disabled,
                size: YgToggleButtonSize.medium,
                onChanged: null,
              ),
            ].withVerticalSpacing(10.0),
          ),
        ],
      ),
    );
  }
}
