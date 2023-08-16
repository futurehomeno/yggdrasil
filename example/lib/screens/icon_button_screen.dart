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
    return DemoScreen(
      componentName: 'IconButton',
      componentDesc: 'Icon Buttons',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          const YgListTile(title: 'Variants - Normal / Disabled'),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              YgIconButton(
                onPressed: () {},
                child: const YgIcon(YgIcons.info),
              ),
              const YgIconButton(
                onPressed: null,
                child: YgIcon(YgIcons.info),
              ),
            ].withHorizontalSpacing(10),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              YgIconButton(
                onPressed: () {},
                variant: YgIconButtonVariant.filled,
                child: const YgIcon(YgIcons.info),
              ),
              const YgIconButton(
                onPressed: null,
                variant: YgIconButtonVariant.filled,
                child: YgIcon(YgIcons.info),
              ),
            ].withHorizontalSpacing(10),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              YgIconButton(
                onPressed: () {},
                variant: YgIconButtonVariant.tonal,
                child: const YgIcon(YgIcons.info),
              ),
              const YgIconButton(
                onPressed: null,
                variant: YgIconButtonVariant.tonal,
                child: YgIcon(YgIcons.info),
              ),
            ].withHorizontalSpacing(10),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              YgIconButton(
                onPressed: () {},
                variant: YgIconButtonVariant.outlined,
                child: const YgIcon(YgIcons.info),
              ),
              const YgIconButton(
                onPressed: null,
                variant: YgIconButtonVariant.outlined,
                child: YgIcon(YgIcons.info),
              ),
            ].withHorizontalSpacing(10),
          ),
          const YgListTile(title: 'Sizes'),
          YgIconButton(
            onPressed: () {},
            variant: YgIconButtonVariant.filled,
            size: YgIconButtonSize.small,
            child: const YgIcon(YgIcons.info),
          ),
          YgIconButton(
            onPressed: () {},
            variant: YgIconButtonVariant.filled,
            child: const YgIcon(YgIcons.info),
          ),
        ].withVerticalSpacing(10),
      ),
    );
  }
}
