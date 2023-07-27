import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class IconButtonScreen extends StatelessWidget {
  const IconButtonScreen({super.key});

  static const String routeName = 'IconButtonScreen';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const IconButtonScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YgScreen(
      componentName: 'IconButton',
      componentDesc: 'Icon Buttons',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          const YgListTile(title: 'Variants'),
          const Text('Standard'),
          YgIconButton(
            onPressed: () {},
            child: const YgIcon(YgIcons.info),
          ),
          const Text('Filled'),
          YgIconButton(
            onPressed: () {},
            variant: YgIconButtonVariant.filled,
            child: const YgIcon(YgIcons.info),
          ),
          const Text('Tonal'),
          YgIconButton(
            onPressed: () {},
            variant: YgIconButtonVariant.tonal,
            child: const YgIcon(YgIcons.info),
          ),
          const Text('Outlined'),
          YgIconButton(
            onPressed: () {},
            variant: YgIconButtonVariant.outlined,
            child: const YgIcon(YgIcons.info),
          ),
          const YgListTile(title: 'Sizes'),
          const Text('Small'),
          YgIconButton(
            onPressed: () {},
            variant: YgIconButtonVariant.filled,
            size: YgIconButtonSize.small,
            child: const YgIcon(YgIcons.info),
          ),
          const Text('Medium'),
          YgIconButton(
            onPressed: () {},
            variant: YgIconButtonVariant.filled,
            child: const YgIcon(YgIcons.info),
          ),
          const YgListTile(title: 'States'),
          const Text('Enabled'),
          YgIconButton(
            onPressed: () {},
            variant: YgIconButtonVariant.filled,
            child: const YgIcon(YgIcons.info),
          ),
          const Text('Disabled'),
          const YgIconButton(
            onPressed: null,
            variant: YgIconButtonVariant.filled,
            child: YgIcon(YgIcons.info),
          ),
        ],
      ),
    );
  }
}
