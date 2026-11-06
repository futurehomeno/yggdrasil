import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class SettingSectionScreen extends StatelessWidget {
  const SettingSectionScreen({super.key});

  static const String routeName = 'SettingSectionScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const SettingSectionScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final YgTokens tokens = context.tokens;

    return DemoScreen(
      componentName: 'SettingSection',
      child: YgLayoutBody(
        child: ColoredBox(
          color: tokens.colors.backgroundWeak,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              YgSettingSection(
                groups: <YgSettingGroup>[
                  YgSettingGroup(
                    positions: <Widget>[
                      YgListTile(
                        title: 'Stian Øien',
                        subtitle: 'stian@sikom.no\n+47 912 34 567',
                        leadingWidgets: const <Widget>[
                          YgAvatar(
                            initials: 'S',
                            size: YgAvatarSize.large,
                          ),
                        ],
                        trailingWidgets: const <Widget>[YgIcon(YgIcons.caretRight)],
                        onTap: () {},
                      ),
                    ],
                  ),
                  YgSettingGroup(
                    name: 'Subscription',
                    positions: <Widget>[
                      YgListTile(
                        title: 'My subscriptions',
                        leadingWidgets: const <Widget>[YgIcon(YgIcons.moneyBag)],
                        supportingWidgets: <Widget>[
                          Text(
                            '2 households',
                            style: tokens.textStyles.paragraph2Regular.copyWith(
                              color: tokens.colors.textWeak,
                            ),
                          ),
                        ],
                        trailingWidgets: const <Widget>[YgIcon(YgIcons.caretRight)],
                        onTap: () {},
                      ),
                    ],
                  ),
                  YgSettingGroup(
                    name: 'Account and security',
                    positions: <Widget>[
                      YgListTile.link(
                        link: 'Personal information',
                        icon: YgIcons.info,
                        onTap: () {},
                      ),
                      YgListTile.link(
                        link: 'Change password',
                        icon: YgIcons.key,
                        onTap: () {},
                      ),
                      YgListTile.link(
                        link: 'Marketing consent',
                        icon: YgIcons.email,
                        onTap: () {},
                      ),
                      YgListTile.link(
                        link: 'Manage account',
                        icon: YgIcons.logout,
                        onTap: () {},
                      ),
                    ],
                  ),
                  const YgSettingGroup(
                    name: 'Empty group is not rendered',
                    positions: <Widget>[],
                  ),
                  YgSettingGroup(
                    positions: <Widget>[
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.all(tokens.dimensions.md),
                          child: Text(
                            'Log out',
                            textAlign: TextAlign.center,
                            style: tokens.textStyles.sectionHeading3Medium.copyWith(
                              color: tokens.colors.textCritical,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: tokens.dimensions.md),
                child: Text(
                  'Futurehome app · version 6.4.0',
                  textAlign: TextAlign.center,
                  style: tokens.textStyles.paragraph2Regular.copyWith(
                    color: tokens.colors.textWeak,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
