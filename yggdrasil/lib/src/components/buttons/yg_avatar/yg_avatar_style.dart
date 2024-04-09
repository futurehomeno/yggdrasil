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
  Color resolveColor() {
    if (state.image.value) {
      return theme.imageBackgroundColor;
    }

    return theme.backgroundColor;
  }

  @override
  TextStyle resolveTextStyle() {
    switch (state.size.value) {
      case YgAvatarSize.large:
        return theme.initialsLargeTextStyle;
      case YgAvatarSize.medium:
      case YgAvatarSize.small:
        return theme.initialsMediumSmallTextStyle;
    }
  }

  @override
  BoxConstraints resolveConstraints() {
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
  Clip resolveClip() {
    return Clip.antiAliasWithSaveLayer;
  }

  @override
  OutlinedBorder resolveOutlinedBorder() {
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
  Color resolveSplashColor() {
    if (state.image.value) {
      return Colors.black.withOpacity(0.08);
    }

    return super.resolveSplashColor();
  }

  YgAvatarTheme get theme => context.avatarTheme;

  @override
  Curve get curve => theme.animationCurve;

  @override
  Duration get duration => theme.animationDuration;
}
