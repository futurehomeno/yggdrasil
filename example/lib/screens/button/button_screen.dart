import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key});

  static const String routeName = 'ButtonsScreen';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const ButtonScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'Button',
      componentDesc: 'Buttons',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          YgSection.column(
            title: 'Variants',
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
            ],
          ),
          YgSection.column(
            title: 'Size variations',
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
            ],
          ),
          YgSection.column(
            title: 'Icon variations',
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
            ],
          ),
          YgSection.column(
            title: 'State variations',
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
            ],
          ),
          YgSection.column(
            title: 'Icon color variations',
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
            ],
          ),
        ],
      ),
    );
  }
}
