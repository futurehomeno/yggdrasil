import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'enums/_enums.dart';
import 'yg_avatar_button_state.dart';

class YgAvatarButtonStyle extends YgButtonBaseStyle<YgAvatarButtonState> {
  YgAvatarButtonStyle({
    required super.state,
    required super.vsync,
  });

  @override
  Color resolveColor(BuildContext context, YgAvatarButtonState state) {
    if (state.image.value) {
      return theme.imageBackgroundColor;
    }

    return theme.backgroundColor;
  }

  @override
  TextStyle resolveTextStyle(BuildContext context, YgAvatarButtonState state) {
    return theme.initialsTextStyle;
  }

  @override
  BoxConstraints resolveConstraints(BuildContext context, YgAvatarButtonState state) {
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
  Clip resolveClip(BuildContext context, YgAvatarButtonState state) {
    return Clip.antiAliasWithSaveLayer;
  }

  @override
  OutlinedBorder resolveOutlinedBorder(BuildContext context, YgAvatarButtonState state) {
    final BorderRadius borderRadius = switch (state.variant.value) {
      YgAvatarButtonVariant.person => theme.personAvatarTheme.borderRadius,
      YgAvatarButtonVariant.company => theme.companyAvatarTheme.borderRadius,
    };

    return RoundedRectangleBorder(
      borderRadius: borderRadius,
      side: theme.borderSide,
    );
  }

  @override
  Color resolveSplashColor(BuildContext context, YgAvatarButtonState state) {
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
