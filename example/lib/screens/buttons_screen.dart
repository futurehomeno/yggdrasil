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
          const YgListTile(title: 'Primary buttons'),
          Column(
            children: <Widget>[
              YgButton(
                variant: YgButtonVariant.primary,
                size: YgButtonSize.small,
                onPressed: () {},
                child: const Text('Button'),
              ),
              YgButton(
                variant: YgButtonVariant.primary,
                size: YgButtonSize.medium,
                onPressed: () {},
                child: const Text('Button'),
              ),
              YgButton(
                variant: YgButtonVariant.primary,
                size: YgButtonSize.large,
                onPressed: () {},
                child: const Text('Button'),
              ),
              YgButton.leadingIcon(
                variant: YgButtonVariant.primary,
                size: YgButtonSize.small,
                onPressed: () {},
                icon: const YgIcon(YgIcons.info),
                child: const Text('Button'),
              ),
              YgButton.trailingIcon(
                variant: YgButtonVariant.primary,
                size: YgButtonSize.small,
                onPressed: () {},
                icon: const YgIcon(YgIcons.info),
                child: const Text('Button'),
              ),
            ].withVerticalSpacing(10),
          ),
          const YgListTile(title: 'Secondary buttons'),
          Column(
            children: <Widget>[
              YgButton(
                variant: YgButtonVariant.secondary,
                size: YgButtonSize.small,
                onPressed: () {},
                child: const Text('Button'),
              ),
              YgButton(
                variant: YgButtonVariant.secondary,
                size: YgButtonSize.medium,
                onPressed: () {},
                child: const Text('Button'),
              ),
              YgButton(
                variant: YgButtonVariant.secondary,
                size: YgButtonSize.large,
                onPressed: () {},
                child: const Text('Button'),
              ),
              YgButton.leadingIcon(
                variant: YgButtonVariant.secondary,
                size: YgButtonSize.small,
                onPressed: () {},
                icon: const YgIcon(YgIcons.info),
                child: const Text('Button'),
              ),
              YgButton.trailingIcon(
                variant: YgButtonVariant.secondary,
                size: YgButtonSize.small,
                onPressed: () {},
                icon: const YgIcon(YgIcons.info),
                child: const Text('Button'),
              ),
            ].withVerticalSpacing(10),
          ),
          const YgListTile(title: 'Text buttons'),
          Column(
            children: <Widget>[
              YgButton(
                variant: YgButtonVariant.text,
                size: YgButtonSize.small,
                onPressed: () {},
                child: const Text('Button'),
              ),
              YgButton(
                variant: YgButtonVariant.text,
                size: YgButtonSize.medium,
                onPressed: () {},
                child: const Text('Button'),
              ),
              YgButton(
                variant: YgButtonVariant.text,
                size: YgButtonSize.large,
                onPressed: () {},
                child: const Text('Button'),
              ),
              YgButton.leadingIcon(
                variant: YgButtonVariant.text,
                size: YgButtonSize.small,
                onPressed: () {},
                icon: const YgIcon(YgIcons.info),
                child: const Text('Button'),
              ),
              YgButton.trailingIcon(
                variant: YgButtonVariant.text,
                size: YgButtonSize.small,
                onPressed: () {},
                icon: const YgIcon(YgIcons.info),
                child: const Text('Button'),
              ),
            ].withVerticalSpacing(10),
          ),
          const YgListTile(title: 'Critical buttons'),
          Column(
            children: <Widget>[
              YgButton(
                variant: YgButtonVariant.critical,
                size: YgButtonSize.small,
                onPressed: () {},
                child: const Text('Button'),
              ),
              YgButton(
                variant: YgButtonVariant.critical,
                size: YgButtonSize.medium,
                onPressed: () {},
                child: const Text('Button'),
              ),
              YgButton(
                variant: YgButtonVariant.critical,
                size: YgButtonSize.large,
                onPressed: () {},
                child: const Text('Button'),
              ),
              YgButton.leadingIcon(
                variant: YgButtonVariant.critical,
                size: YgButtonSize.small,
                onPressed: () {},
                icon: const YgIcon(YgIcons.info),
                child: const Text('Button'),
              ),
              YgButton.trailingIcon(
                variant: YgButtonVariant.critical,
                size: YgButtonSize.small,
                onPressed: () {},
                icon: const YgIcon(YgIcons.info),
                child: const Text('Button'),
              ),
            ].withVerticalSpacing(10),
          ),
          const YgListTile(title: 'Link buttons'),
          Column(
            children: <Widget>[
              YgButton(
                variant: YgButtonVariant.link,
                size: YgButtonSize.small,
                onPressed: () {},
                child: const Text('Button'),
              ),
              YgButton(
                variant: YgButtonVariant.link,
                size: YgButtonSize.medium,
                onPressed: () {},
                child: const Text('Button'),
              ),
              YgButton(
                variant: YgButtonVariant.link,
                size: YgButtonSize.large,
                onPressed: () {},
                child: const Text('Button'),
              ),
              YgButton.leadingIcon(
                variant: YgButtonVariant.link,
                size: YgButtonSize.small,
                onPressed: () {},
                icon: const YgIcon(YgIcons.info),
                child: const Text('Button'),
              ),
              YgButton.trailingIcon(
                variant: YgButtonVariant.link,
                size: YgButtonSize.small,
                onPressed: () {},
                icon: const YgIcon(YgIcons.info),
                child: const Text('Button'),
              ),
            ].withVerticalSpacing(10),
          ),
        ],
      ),
    );
  }
}
