import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/screens/icon_list/icon_list_screen.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class IconScreen extends StatelessWidget {
  const IconScreen({super.key});

  static const String routeName = 'IconScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const IconScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'Icon',
      child: Column(
        children: <Widget>[
          YgSection.list(
            title: 'Available icons',
            subtitle: 'List of all available icons can be found on the IconListScreen.',
            children: <YgListTile>[
              YgListTile(
                title: 'Icon list (all icons)',
                onTap: () => sl<YgRouter>().push(IconListScreen.route()),
                trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
              ),
            ],
          ),
          const YgSection(
            title: 'Sizes',
            subtitle: 'Icons come in small and large.',
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                YgIcon(
                  YgIcons.info,
                  size: YgIconSize.small,
                ),
                YgIcon(
                  YgIcons.info,
                  size: YgIconSize.large,
                ),
              ],
            ),
          ),
          YgSection(
            title: 'Animated',
            subtitle: 'An animated icon.',
            child: YgIcon(
              YgAnimatedIcons.arrowDecrease,
            ),
          ),
          YgSection(
            title: 'Inherited color',
            subtitle: 'Color switching is handled by the parent widget.',
            child: YgIconButton(
              variant: YgIconButtonVariant.filled,
              icon: YgIcons.info,
              onPressed: () {},
            ),
          ),
          YgSection(
            title: 'Override color',
            subtitle: 'Override the default theme color.\nWarning: color will no longer adapt to the theme.',
            child: YgTag(
              child: YgIcon.colorable(
                YgIcons.deviceHubChange,
                color: context.tokens.colors.iconCritical,
                size: YgIconSize.large,
              ),
            ),
          ),
          const YgSection(
            title: 'Use embedded color',
            subtitle: 'Color embedded in the SVG is used.\nThe color will adapt to the theme.',
            child: YgTag(
              child: YgIcon(
                YgIcons.deviceHubColorful,
                size: YgIconSize.large,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
