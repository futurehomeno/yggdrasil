import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/screens/_screens.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = 'HomeScreen';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YgScreen(
      componentName: 'Yggdrasil Components',
      componentDesc: 'List of supported components.',
      supernovaLink: '-',
      child: Column(
        children: <Widget>[
          YgListTile(
            title: 'Badge',
            onTap: () => sl<YgRouter>().push(BadgeScreen.route()),
            trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
          ),
          YgListTile(
            title: 'Bottom sheet',
            onTap: () => sl<YgRouter>().push(BottomSheetScreen.route()),
            trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
          ),
          YgListTile(
            title: 'Buttons',
            onTap: () => sl<YgRouter>().push(ButtonsScreen.route()),
            trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
          ),
          YgListTile(
            title: 'Button group',
            onTap: () => sl<YgRouter>().push(ButtonGroupScreen.route()),
            trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
          ),
          YgListTile(
            title: 'Callout',
            onTap: () => sl<YgRouter>().push(CalloutScreen.route()),
            trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
          ),
          YgListTile(
            title: 'Cards',
            onTap: () => sl<YgRouter>().push(CardScreen.route()),
            trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
          ),
          YgListTile(
            title: 'Dialog',
            onTap: () => sl<YgRouter>().push(DialogScreen.route()),
            trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
          ),
          YgListTile(
            title: 'Divider',
            onTap: () => sl<YgRouter>().push(DividerScreen.route()),
            trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
          ),
          YgListTile(
            title: 'Icon',
            onTap: () => sl<YgRouter>().push(IconScreen.route()),
            trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
          ),
          YgListTile(
            title: 'Icon list (all icons)',
            onTap: () => sl<YgRouter>().push(IconsListScreen.route()),
            trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
          ),
          YgListTile(
            title: 'List',
            onTap: () => sl<YgRouter>().push(ListScreen.route()),
            trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
          ),
          YgListTile(
            title: 'List tile',
            onTap: () => sl<YgRouter>().push(ListTileScreen.route()),
            trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
          ),
          YgListTile(
            title: 'Snackbar',
            onTap: () => sl<YgRouter>().push(SnackbarScreen.route()),
            trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
          ),
          YgListTile(
            title: 'Tags',
            onTap: () => sl<YgRouter>().push(TagsScreen.route()),
            trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
          ),
          YgListTile(
            title: 'Text link',
            onTap: () => sl<YgRouter>().push(TextLinkScreen.route()),
            trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
          ),
        ],
      ),
    );
  }
}
