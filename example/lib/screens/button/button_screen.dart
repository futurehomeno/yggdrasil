import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
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

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'Button',
      componentDesc: 'Buttons',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          const YgSection.base(
            title: 'Buttons in a group',
            child: YgCallout(
              variant: YgCalloutVariant.warning,
              description: 'If you need a collection of buttons, use YgButtonGroup.',
            ),
          ),
          YgSection.column(
            title: 'NEW',
            subtitle: 'Spacing between buttons added manually.',
            children: <Widget>[
              YgButtonNew(
                onPressed: () {
                  variant = YgButtonVariant
                      .values[(YgButtonVariant.values.indexOf(variant) + 1) % YgButtonVariant.values.length];
                  setState(() {});
                  print(variant);
                },
                variant: variant,
                child: const Text('Animated'),
              ),
              YgButtonNew(
                variant: YgButtonVariant.secondary,
                onPressed: () {},
                child: const Text('Secondary'),
              ),
              YgButtonNew(
                variant: YgButtonVariant.text,
                onPressed: () {},
                child: const Text('Text'),
              ),
              YgButtonNew(
                variant: YgButtonVariant.link,
                onPressed: () {},
                child: const Text('Link'),
              ),
              YgButtonNew(
                variant: YgButtonVariant.critical,
                onPressed: () {},
                child: const Text('Critical'),
              ),
            ].withVerticalSpacing(10.0),
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
                icon: const YgIcon(YgIcons.info),
                onPressed: () {},
                child: const Text('Leading icon'),
              ),
              YgButton.trailingIcon(
                icon: const YgIcon(YgIcons.info),
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
                icon: const YgIcon(YgIcons.check),
                onPressed: () {},
                child: const Text('Enabled'),
              ),
              YgButton.trailingIcon(
                icon: const YgIcon(YgIcons.cross),
                onPressed: null,
                child: const Text('Disabled'),
              ),
            ].withVerticalSpacing(10.0),
          ),
          YgSection.column(
            title: 'Icon color variations',
            subtitle: 'Spacing between buttons added manually.',
            children: <Widget>[
              YgButton.leadingIcon(
                icon: const YgIcon(YgIcons.deviceHub),
                onPressed: () {},
                child: const Text('Default icon color'),
              ),
              YgButton.leadingIcon(
                variant: YgButtonVariant.link,
                icon: const YgIcon(YgIcons.info),
                onPressed: () {},
                child: const Text('Link icon color'),
              ),
              YgButton.leadingIcon(
                variant: YgButtonVariant.text,
                icon: const YgIcon(YgIcons.info),
                onPressed: () {},
                child: const Text('Text icon color'),
              ),
            ].withVerticalSpacing(10.0),
          ),
        ],
      ),
    );
  }
}
