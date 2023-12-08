import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({super.key});

  static const String routeName = 'AvatarScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const AvatarScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'Avatar',
      child: Column(
        children: <Widget>[
          const YgSection(
            title: 'Default Avatars',
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                YgAvatar(
                  name: 'User',
                ),
                YgAvatar.company(
                  name: 'Company',
                ),
              ],
            ),
          ),
          const YgSection(
            title: 'Avatar with badge',
            subtitle: 'The badge is not supported by the company avatar variant, only by the default one.',
            child: YgAvatar(
              name: 'User',
              badge: YgIcon(
                YgIcons.access,
              ),
            ),
          ),
          const YgSection(
            title: 'Sizes',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    YgAvatar(
                      name: 'User',
                      size: YgAvatarSize.large,
                    ),
                    YgAvatar(
                      name: 'User',
                      size: YgAvatarSize.medium,
                    ),
                    YgAvatar(
                      name: 'User',
                      size: YgAvatarSize.small,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    YgAvatar.company(
                      name: 'Company',
                      size: YgAvatarSize.large,
                    ),
                    YgAvatar.company(
                      name: 'Company',
                      size: YgAvatarSize.medium,
                    ),
                    YgAvatar.company(
                      name: 'Company',
                      size: YgAvatarSize.small,
                    ),
                  ],
                ),
              ],
            ),
          ),
          YgSection(
            title: 'Avatar with image',
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                YgAvatar(
                  name: 'User',
                  image: Image.asset(
                    'assets/images/example_avatar.png',
                    semanticLabel: 'example_avatar',
                  ),
                ),
                YgAvatar.company(
                  name: 'Company',
                  image: Image.asset(
                    'assets/images/example_company_avatar.png',
                    semanticLabel: 'example_avatar',
                  ),
                ),
              ],
            ),
          ),
          YgSection(
            title: 'Clickable Avatar',
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                YgAvatar(
                  name: 'User',
                  onPressed: () {},
                ),
                YgAvatar.company(
                  name: 'Company',
                  onPressed: () {},
                ),
              ],
            ),
          ),
          YgSection(
            title: 'Avatars with all options',
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                YgAvatar(
                  name: 'User',
                  badge: const YgIcon(
                    YgIcons.access,
                  ),
                  image: Image.asset(
                    'assets/images/example_avatar.png',
                    semanticLabel: 'example_avatar',
                  ),
                  onPressed: () {},
                ),
                YgAvatar.company(
                  name: 'Company',
                  image: Image.asset(
                    'assets/images/example_company_avatar.png',
                    semanticLabel: 'example_avatar',
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
