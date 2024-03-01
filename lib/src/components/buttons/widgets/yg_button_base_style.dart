import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import '_widgets.dart';

abstract class YgButtonBaseStyle<T extends YgButtonBaseState> extends YgStyleWithDefaults<T> {
  YgButtonBaseStyle({
    required super.state,
    required super.vsync,
  });

  late final YgAnimatedProperty<BoxConstraints> constraints = animate(resolveConstraints);
  late final YgAnimatedProperty<Color> color = animate(resolveColor);
  late final YgAnimatedProperty<IconThemeData> iconTheme = animate(_resolveIconTheme);
  late final YgAnimatedProperty<TextStyle> textStyle = animate(resolveTextStyle);
  late final YgAnimatedProperty<EdgeInsets> padding = animate(resolvePadding);
  late final YgAnimatedProperty<Alignment> alignment = animate(resolveAlignment);
  late final YgAnimatedProperty<double> elevation = animate(resolveElevation);
  late final YgAnimatedProperty<OutlinedBorder?> shape = animate(resolveOutlinedBorder);
  late final YgDrivenProperty<MouseCursor> cursor = drive(resolveCursor);
  late final YgDrivenProperty<Color> splashColor = drive(resolveSplashColor);
  late final YgDrivenProperty<InteractiveInkFeatureFactory> splashFactory = drive(resolveSplashFactory);
  late final YgDrivenProperty<Clip> clip = drive(resolveClip);

  Color resolveColor();

  TextStyle resolveTextStyle() {
    return DefaultTextStyle.of(context).style;
  }

  BoxConstraints resolveConstraints() {
    return const BoxConstraints();
  }

  OutlinedBorder? resolveOutlinedBorder() {
    return null;
  }

  EdgeInsets resolvePadding() {
    return const EdgeInsets.all(0);
  }

  MouseCursor resolveCursor() {
    if (state.disabled.value) {
      return SystemMouseCursors.basic;
    }

    return SystemMouseCursors.click;
  }

  Alignment resolveAlignment() {
    return Alignment.center;
  }

  double resolveElevation() {
    return 0.0;
  }

  IconThemeData _resolveIconTheme() {
    return IconTheme.of(context).copyWith(
      color: resolveIconColor(),
      size: resolveIconSize(),
    );
  }

  Color resolveIconColor() {
    return context.ygTheme.tokens.colors.iconDefault;
  }

  double resolveIconSize() {
    return context.ygTheme.tokens.dimensions.lg;
  }

  InteractiveInkFeatureFactory resolveSplashFactory() {
    return InkSplash.splashFactory;
  }

  Color resolveSplashColor() {
    final Color color = resolveColor();

    if (color.computeLuminance() > 0.5) {
      return Colors.black.withOpacity(0.08);
    }

    return Colors.white.withOpacity(0.08);
  }

  Clip resolveClip() {
    return Clip.antiAlias;
  }
}
