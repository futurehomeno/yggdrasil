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
          YgSection(
            title: 'Default Avatars',
            subtitle: 'Supported variants are person and company.',
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const YgAvatar(
                  initials: 'P',
                ),
                const YgAvatar(
                  initials: 'C',
                  variant: YgAvatarVariant.company,
                ),
              ].withHorizontalSpacing(10),
            ),
          ),
          const YgSection(
            title: 'Avatar with badge',
            subtitle: 'The badge is only supported by the person variant.',
            child: YgBadge.icon(
              icon: YgIcons.access,
              child: YgAvatar(
                initials: 'P',
                size: YgAvatarSize.medium,
              ),
            ),
          ),
          YgSection.column(
            title: 'Sizes',
            children: <Row>[
              Row(
                children: <Widget>[
                  const YgAvatar(
                    initials: 'P',
                    size: YgAvatarSize.large,
                  ),
                  const YgAvatar(
                    initials: 'C',
                    variant: YgAvatarVariant.company,
                    size: YgAvatarSize.large,
                  ),
                ].withHorizontalSpacing(10),
              ),
              Row(
                children: <Widget>[
                  const YgAvatar(
                    initials: 'P',
                    size: YgAvatarSize.medium,
                  ),
                  const YgAvatar(
                    initials: 'C',
                    variant: YgAvatarVariant.company,
                    size: YgAvatarSize.medium,
                  ),
                ].withHorizontalSpacing(10),
              ),
              Row(
                children: <Widget>[
                  const YgAvatar(
                    initials: 'P',
                    size: YgAvatarSize.small,
                  ),
                  const YgAvatar(
                    initials: 'C',
                    variant: YgAvatarVariant.company,
                    size: YgAvatarSize.small,
                  ),
                ].withHorizontalSpacing(10),
              ),
            ].withVerticalSpacing(10),
          ),
          YgSection(
            title: 'Avatar with image',
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                YgAvatar(
                  initials: 'P',
                  image: Image.asset(
                    'assets/images/example_avatar_1.webp',
                    semanticLabel: 'example_avatar',
                  ),
                ),
                YgAvatar(
                  initials: 'C',
                  variant: YgAvatarVariant.company,
                  image: Image.asset(
                    'assets/images/example_company_avatar.webp',
                    semanticLabel: 'example_avatar',
                  ),
                ),
              ].withHorizontalSpacing(10),
            ),
          ),
          YgSection(
            title: 'Clickable Avatar',
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                YgAvatar(
                  initials: 'P',
                  onPressed: () {},
                ),
                YgAvatar(
                  initials: 'C',
                  variant: YgAvatarVariant.company,
                  onPressed: () {},
                ),
              ].withHorizontalSpacing(10),
            ),
          ),
          YgSection(
            title: 'Clickable Avatar with image',
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                YgAvatar(
                  initials: 'P',
                  image: Image.asset(
                    'assets/images/example_avatar_1.webp',
                    semanticLabel: 'example_avatar',
                  ),
                  onPressed: () {},
                ),
                YgAvatar(
                  initials: 'C',
                  variant: YgAvatarVariant.company,
                  image: Image.asset(
                    'assets/images/example_company_avatar.webp',
                    semanticLabel: 'example_avatar',
                  ),
                  onPressed: () {},
                ),
              ].withHorizontalSpacing(10),
            ),
          ),
        ],
      ),
    );
  }
}
