import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  static const String routeName = 'ButtonsScreen';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const ButtonsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YgScreen(
      componentName: 'Button',
      componentDesc: 'Buttons',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          // const YgListTile(title: 'Variants'),
          // Column(
          //   children: <Widget>[
          //     YgButton(
          //       onPressed: () {},
          //       child: const Text('Primary'),
          //     ),
          //     YgButton(
          //       variant: YgButtonVariant.secondary,
          //       onPressed: () {},
          //       child: const Text('Secondary'),
          //     ),
          //     YgButton(
          //       variant: YgButtonVariant.text,
          //       onPressed: () {},
          //       child: const Text('Text'),
          //     ),
          //     YgButton(
          //       variant: YgButtonVariant.link,
          //       onPressed: () {},
          //       child: const Text('Link'),
          //     ),
          //     YgButton(
          //       variant: YgButtonVariant.critical,
          //       onPressed: () {},
          //       child: const Text('Critical'),
          //     ),
          //   ],
          // ),
          // const YgListTile(title: 'Size variations'),
          // Column(
          //   children: <Widget>[
          //     YgButton(
          //       size: YgButtonSize.small,
          //       onPressed: () {},
          //       child: const Text('Small'),
          //     ),
          //     YgButton(
          //       onPressed: () {},
          //       child: const Text('Medium'),
          //     ),
          //     YgButton(
          //       size: YgButtonSize.large,
          //       onPressed: () {},
          //       child: const Text('Large'),
          //     ),
          //   ],
          // ),
          // const YgListTile(title: 'Icon variations'),
          // Column(
          //   children: <Widget>[
          //     YgButton.leadingIcon(
          //       icon: const YgIcon(YgIcons.info),
          //       onPressed: () {},
          //       child: const Text('Leading icon'),
          //     ),
          //     YgButton.trailingIcon(
          //       icon: const YgIcon(YgIcons.info),
          //       onPressed: () {},
          //       child: const Text('Trailing icon'),
          //     ),
          //   ],
          // ),
          // const YgListTile(title: 'State variations'),
          // Column(
          //   children: <Widget>[
          //     YgButton.trailingIcon(
          //       icon: const YgIcon(YgIcons.check),
          //       onPressed: () {},
          //       child: const Text('Enabled'),
          //     ),
          //     YgButton.trailingIcon(
          //       icon: const YgIcon(YgIcons.cross),
          //       onPressed: null,
          //       child: const Text('Disabled'),
          //     ),
          //   ],
          // ),
          const YgListTile(title: 'Icon color variations'),
          Column(
            children: <Widget>[
              YgButton.leadingIcon(
                icon: const YgIcon(YgIcons.deviceHub),
                onPressed: () {},
                child: const Text('Default icon color'),
              ),
              YgButton.leadingIcon(
                icon: YgIcon(YgIcons.deviceHub, color: context.tokens.colors.iconSuccess),
                onPressed: () {},
                child: const Text('Colored icon'),
              ),
              YgButton.leadingIcon(
                icon: const YgIcon(YgIcons.deviceHub, useSvgColor: true),
                onPressed: () {},
                child: const Text('Use svg icon color'),
              ),
              YgButton.leadingIcon(
                icon: const YgIcon(YgIcons.deviceHub),
                onPressed: null,
                child: const Text('Disabled default icon color'),
              ),
              YgButton.leadingIcon(
                icon: YgIcon(YgIcons.deviceHub, color: context.tokens.colors.iconSuccess),
                onPressed: null,
                child: const Text('Disabled colored icon'),
              ),
              YgButton.leadingIcon(
                icon: const YgIcon(YgIcons.deviceHub, useSvgColor: true),
                onPressed: null,
                child: const Text('Disabled use svg icon color'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
