import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/utils/_utils.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({super.key});

  static const String routeName = 'ButtonsScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const ButtonScreen(),
    );
  }

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  YgButtonVariant variant = YgButtonVariant.primary;
  YgButtonSize size = YgButtonSize.medium;

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'Button',
      child: Column(
        children: <Widget>[
          const YgSection(
            title: 'Buttons in a group',
            child: YgCallout(
              variant: YgCalloutVariant.warning,
              description: 'If you need a collection of buttons, use YgButtonGroup.',
            ),
          ),
          YgSection.column(
            title: 'Variants',
            subtitle: 'Spacing between buttons added manually.',
            children: <Widget>[
              YgButton(
                onPressed: () {},
                child: const Text('Primary'),
              ),
              YgButton(
                variant: YgButtonVariant.secondary,
                onPressed: () {},
                child: const Text('Secondary'),
              ),
              YgButton(
                variant: YgButtonVariant.text,
                onPressed: () {},
                child: const Text('Text'),
              ),
              YgButton(
                variant: YgButtonVariant.link,
                onPressed: () {},
                child: const Text('Link'),
              ),
              YgButton(
                variant: YgButtonVariant.critical,
                onPressed: () {},
                child: const Text('Critical'),
              ),
            ].withVerticalSpacing(10.0),
          ),
          YgSection.column(
            title: 'Size variations',
            subtitle: 'Spacing between buttons added manually.',
            children: <Widget>[
              YgButton(
                size: YgButtonSize.small,
                onPressed: () {},
                child: const Text('Small'),
              ),
              YgButton(
                onPressed: () {},
                child: const Text('Medium'),
              ),
              YgButton(
                size: YgButtonSize.large,
                onPressed: () {},
                child: const Text('Large'),
              ),
            ].withVerticalSpacing(10.0),
          ),
          YgSection.column(
            title: 'Icon variations',
            subtitle: 'Spacing between buttons added manually.',
            children: <Widget>[
              YgButton.leadingIcon(
                icon: YgIcons.info,
                onPressed: () {},
                child: const Text('Leading icon'),
              ),
              YgButton.trailingIcon(
                icon: YgIcons.info,
                onPressed: () {},
                child: const Text('Trailing icon'),
              ),
            ].withVerticalSpacing(10.0),
          ),
          YgSection.column(
            title: 'State variations',
            subtitle: 'Spacing between buttons added manually.',
            children: <Widget>[
              YgButton.trailingIcon(
                icon: YgIcons.check,
                onPressed: () {},
                child: const Text('Enabled'),
              ),
              const YgButton.trailingIcon(
                icon: YgIcons.cross,
                onPressed: null,
                child: Text('Disabled'),
              ),
            ].withVerticalSpacing(10.0),
          ),
          YgSection.column(
            title: 'Icon color variations',
            subtitle: 'Spacing between buttons added manually.',
            children: <Widget>[
              YgButton.leadingIcon(
                icon: YgIcons.deviceHubChange,
                onPressed: () {},
                child: const Text('Default icon color'),
              ),
              YgButton.leadingIcon(
                variant: YgButtonVariant.link,
                icon: YgIcons.info,
                onPressed: () {},
                child: const Text('Link icon color'),
              ),
              YgButton.leadingIcon(
                variant: YgButtonVariant.text,
                icon: YgIcons.info,
                onPressed: () {},
                child: const Text('Text icon color'),
              ),
            ].withVerticalSpacing(10.0),
          ),
          YgSection.column(
            title: 'Animated',
            subtitle: 'Animating between different variants and sizes.',
            children: <Widget>[
              YgButton(
                onPressed: () {
                  variant = YgButtonVariant.values.next(variant);
                  setState(() {});
                },
                variant: variant,
                child: const Text('Animated variant'),
              ),
              YgButton(
                size: size,
                onPressed: () {
                  size = YgButtonSize.values.next(size);
                  setState(() {});
                },
                child: const Text('Animated Size'),
              ),
            ].withVerticalSpacing(10.0),
          ),
        ],
      ),
    );
  }
}
