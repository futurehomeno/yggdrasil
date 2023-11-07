import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class IconButtonScreen extends StatelessWidget {
  const IconButtonScreen({super.key});

  static const String routeName = 'IconButtonScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
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
          YgSection.column(
            title: 'Variants - Normal / Disabled',
            subtitle: 'Spacing between icon buttons added manually.',
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  YgIconButton(
                    onPressed: () {},
                    colorableIconData: YgIcons.info,
                  ),
                  YgIconButton(
                    onPressed: null,
                    colorableIconData: YgIcons.info,
                  ),
                ].withHorizontalSpacing(10.0),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  YgIconButton(
                    onPressed: () {},
                    variant: YgIconButtonVariant.filled,
                    colorableIconData: YgIcons.info,
                  ),
                  YgIconButton(
                    onPressed: null,
                    variant: YgIconButtonVariant.filled,
                    colorableIconData: YgIcons.info,
                  ),
                ].withHorizontalSpacing(10.0),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  YgIconButton(
                    onPressed: () {},
                    variant: YgIconButtonVariant.tonal,
                    colorableIconData: YgIcons.info,
                  ),
                  YgIconButton(
                    onPressed: null,
                    variant: YgIconButtonVariant.tonal,
                    colorableIconData: YgIcons.info,
                  ),
                ].withHorizontalSpacing(10.0),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  YgIconButton(
                    onPressed: () {},
                    variant: YgIconButtonVariant.outlined,
                    colorableIconData: YgIcons.info,
                  ),
                  YgIconButton(
                    onPressed: null,
                    variant: YgIconButtonVariant.outlined,
                    colorableIconData: YgIcons.info,
                  ),
                ].withHorizontalSpacing(10.0),
              ),
            ].withVerticalSpacing(10.0),
          ),
          YgSection.base(
            title: 'Sizes',
            subtitle: 'Spacing between icon buttons added manually.',
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                YgIconButton(
                  onPressed: () {},
                  variant: YgIconButtonVariant.filled,
                  size: YgIconButtonSize.small,
                  colorableIconData: YgIcons.info,
                ),
                YgIconButton(
                  onPressed: () {},
                  variant: YgIconButtonVariant.filled,
                  colorableIconData: YgIcons.info,
                ),
              ].withHorizontalSpacing(10.0),
            ),
          ),
        ],
      ),
    );
  }
}
