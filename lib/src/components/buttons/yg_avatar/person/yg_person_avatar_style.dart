import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/yg_avatar/yg_avatar_state.dart';
import 'package:yggdrasil/src/components/buttons/yg_avatar/yg_avatar_style.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

class YgPersonAvatarStyle extends YgAvatarStyle {
  YgPersonAvatarStyle({
    required super.state,
    required super.vsync,
  });

  late final YgDrivenColorProperty badgeColor;
  late final YgDrivenEdgeInsetsProperty badgePadding;

  @override
  void init() {
    badgeColor = drive(YgColorProperty<YgAvatarState>.all(_resolveBadgeColor));
    badgePadding = drive(YgEdgeInsetsProperty<YgAvatarState>.all(_resolveBadgePadding));
    super.init();
  }

  Color _resolveBadgeColor(BuildContext context) {
    return theme.personAvatarTheme.badgeColor;
  }

  EdgeInsets _resolveBadgePadding(BuildContext context) {
    return theme.personAvatarTheme.badgePadding;
  }

  @override
  OutlinedBorder resolveOutlinedBorder(BuildContext context, YgAvatarState state) {
    return CircleBorder(
      side: theme.borderSide,
    );
  }
}
