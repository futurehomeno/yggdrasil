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
            title: 'Default Avatar',
            child: YgAvatar(
              name: 'User',
            ),
          ),
          const YgSection(
            title: 'Company Avatar',
            child: YgAvatar.company(
              name: 'Company',
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
                      name: 'User',
                      size: YgAvatarSize.large,
                    ),
                    YgAvatar.company(
                      name: 'User',
                      size: YgAvatarSize.medium,
                    ),
                    YgAvatar.company(
                      name: 'User',
                      size: YgAvatarSize.small,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const YgSection(
            title: 'Avatar with role',
            child: YgAvatar(
              name: 'User',
              badge: YgIcon(
                YgIcons.access,
              ),
            ),
          ),
          YgSection(
            title: 'Avatar with image',
            child: YgAvatar(
              name: 'User',
              image: Image.asset(
                'assets/images/example_avatar.png',
                semanticLabel: 'example_avatar',
              ),
            ),
          ),
          YgSection(
            title: 'Clickable Avatar',
            child: YgAvatar(
              name: 'User',
              onPressed: () {
                print('test');
              },
            ),
          ),
          YgSection(
            title: 'Avatar with image and role',
            child: YgAvatar(
              name: 'User',
              badge: const YgIcon(
                YgIcons.access,
              ),
              image: Image.asset(
                'assets/images/example_avatar.png',
                semanticLabel: 'example_avatar',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
