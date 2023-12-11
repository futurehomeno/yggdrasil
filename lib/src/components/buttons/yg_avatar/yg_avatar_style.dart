import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';
import 'package:yggdrasil/src/components/buttons/yg_avatar/yg_avatar_state.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgAvatarStyle extends YgButtonBaseStyle<YgAvatarState> {
  YgAvatarStyle({
    required super.state,
    required super.vsync,
  });

  @override
  Color resolveColor(BuildContext context, YgAvatarState state) {
    if (state.image.value) {
      return theme.imageBackgroundColor;
    }

    return theme.backgroundColor;
  }

  @override
  TextStyle resolveTextStyle(BuildContext context, YgAvatarState state) {
    return theme.initialsTextStyle;
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

  @override
  Clip resolveClip(BuildContext context, YgAvatarState state) {
    return Clip.antiAliasWithSaveLayer;
  }

  @override
  OutlinedBorder resolveOutlinedBorder(BuildContext context, YgAvatarState state) {
    final BorderRadius borderRadius = switch (state.variant.value) {
      YgAvatarVariant.person => theme.personAvatarTheme.borderRadius,
      YgAvatarVariant.company => theme.companyAvatarTheme.borderRadius,
    };

    return RoundedRectangleBorder(
      borderRadius: borderRadius,
      side: theme.borderSide,
    );
  }

  @override
  Color resolveSplashColor(BuildContext context, YgAvatarState state) {
    if (state.image.value) {
      return Colors.black.withOpacity(0.08);
    }

    return super.resolveSplashColor(context, state);
  }

  YgAvatarTheme get theme => context.avatarTheme;

  @override
  Curve get curve => theme.animationCurve;

  @override
  Duration get duration => theme.animationDuration;
}
