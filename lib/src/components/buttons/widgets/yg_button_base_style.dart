import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import '_widgets.dart';

abstract class YgButtonBaseStyle<T extends YgButtonBaseState> extends YgStyleWithDefaults<T> {
  YgButtonBaseStyle({
    required super.state,
    required super.vsync,
  });

  late final YgAnimatedNullableShapeBorderProperty shape;
  late final YgAnimatedBoxConstraintsProperty constraints;
  late final YgAnimatedColorProperty color;
  late final YgAnimatedIconThemeDataProperty iconTheme;
  late final YgAnimatedTextStyleProperty textStyle;
  late final YgAnimatedEdgeInsetsProperty padding;
  late final YgAnimatedAlignmentProperty alignment;
  late final YgAnimatedDoubleProperty elevation;
  late final YgDrivenProperty<MouseCursor?> cursor;
  late final YgDrivenColorProperty splashColor;
  late final YgDrivenProperty<InteractiveInkFeatureFactory> splashFactory;
  late final YgDrivenProperty<Clip> clip;

  @override
  void init() {
    constraints = animate(YgBoxConstraintsProperty<T>.resolveWith(resolveConstraints));
    color = animate(YgColorProperty<T>.resolveWith(resolveColor));
    iconTheme = animate(YgIconThemeDataProperty<T>.resolveWith(_resolveIconTheme));
    textStyle = animate(YgTextStyleProperty<T>.resolveWith(resolveTextStyle));
    padding = animate(YgEdgeInsetsProperty<T>.resolveWith(resolvePadding));
    alignment = animate(YgAlignmentProperty<T>.resolveWith(resolveAlignment));
    elevation = animate(YgDoubleProperty<T>.resolveWith(resolveElevation));
    shape = animate(YgProperty<T, OutlinedBorder?>.resolveWith(resolveOutlinedBorder));
    cursor = drive(YgProperty<T, MouseCursor?>.resolveWith(resolveCursor));
    splashColor = drive(YgColorProperty<T>.resolveWith(resolveSplashColor));
    splashFactory = drive(YgProperty<T, InteractiveInkFeatureFactory>.resolveWith(resolveSplashFactory));
    clip = drive(YgProperty<T, Clip>.resolveWith(resolveClip));
  }

  Color resolveColor(BuildContext context, T state);

  TextStyle resolveTextStyle(BuildContext context, T state) {
    return DefaultTextStyle.of(context).style;
  }

  BoxConstraints resolveConstraints(BuildContext context, T state) {
    return const BoxConstraints();
  }

  OutlinedBorder? resolveOutlinedBorder(BuildContext context, T state) {
    return null;
  }

  EdgeInsets resolvePadding(BuildContext context, T state) {
    return const EdgeInsets.all(0);
  }

  MouseCursor resolveCursor(BuildContext context, T state) {
    if (state.disabled.value) {
      return SystemMouseCursors.basic;
    }

    return SystemMouseCursors.click;
  }

  Alignment resolveAlignment(BuildContext context, T state) {
    return Alignment.center;
  }

  double resolveElevation(BuildContext context, T state) {
    return 0.0;
  }

  IconThemeData _resolveIconTheme(BuildContext context, T state) {
    return IconTheme.of(context).copyWith(
      color: resolveIconColor(context, state),
      size: resolveIconSize(context, state),
    );
  }

  Color resolveIconColor(BuildContext context, T state) {
    return context.ygTheme.tokens.colors.iconDefault;
  }

  double resolveIconSize(BuildContext context, T state) {
    return context.ygTheme.tokens.dimensions.lg;
  }

  InteractiveInkFeatureFactory resolveSplashFactory(BuildContext context, T state) {
    return InkSplash.splashFactory;
  }

  Color resolveSplashColor(BuildContext context, T state) {
    final Color color = resolveColor(context, state);

    if (color.computeLuminance() > 0.5) {
      return Colors.black.withOpacity(0.08);
    }

    return Colors.white.withOpacity(0.08);
  }

  Clip resolveClip(BuildContext context, T state) {
    return Clip.none;
  }
}
