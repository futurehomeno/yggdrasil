import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';
import 'package:yggdrasil/src/components/buttons/yg_avatar/enums/yg_avatar_size.dart';
import 'package:yggdrasil/src/components/buttons/yg_avatar/yg_avatar_state.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

abstract class YgAvatarStyle extends YgButtonBaseStyle<YgAvatarState> {
  YgAvatarStyle({
    required super.state,
    required super.vsync,
  });

  @override
  Color resolveColor(BuildContext context, YgAvatarState state) {
    return theme.backgroundColor;
  }

  @override
  BoxConstraints resolveConstraints(BuildContext context, YgAvatarState state) {
    final double diameter = switch (state.size.value) {
      YgAvatarSize.small => theme.diameterSmall,
      YgAvatarSize.medium => theme.diameterMedium,
      YgAvatarSize.large => theme.diameterLarge,
    };

    return BoxConstraints.tightFor(
      width: diameter,
      height: diameter,
    );
  }

  YgAvatarTheme get theme => context.avatarTheme;

  @override
  Curve get curve => theme.animationCurve;

  @override
  Duration get duration => theme.animationDuration;
}
