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
          const YgText('Standard'),
          YgIconButton(
            onPressed: () {},
            child: const YgIcon(YgIcons.info),
          ),
          const YgText('Filled'),
          YgIconButton(
            onPressed: () {},
            variant: YgIconButtonVariant.filled,
            child: const YgIcon(YgIcons.info),
          ),
          const YgText('Tonal'),
          YgIconButton(
            onPressed: () {},
            variant: YgIconButtonVariant.tonal,
            child: const YgIcon(YgIcons.info),
          ),
          const YgText('Outlined'),
          YgIconButton(
            onPressed: () {},
            variant: YgIconButtonVariant.outlined,
            child: const YgIcon(YgIcons.info),
          ),
          const YgListTile(title: 'Sizes'),
          const YgText('Small'),
          YgIconButton(
            onPressed: () {},
            variant: YgIconButtonVariant.filled,
            size: YgIconButtonSize.small,
            child: const YgIcon(YgIcons.info),
          ),
          const YgText('Medium'),
          YgIconButton(
            onPressed: () {},
            variant: YgIconButtonVariant.filled,
            child: const YgIcon(YgIcons.info),
          ),
          const YgListTile(title: 'States'),
          const YgText('Enabled'),
          YgIconButton(
            onPressed: () {},
            variant: YgIconButtonVariant.filled,
            child: const YgIcon(YgIcons.info),
          ),
          const YgText('Disabled'),
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
