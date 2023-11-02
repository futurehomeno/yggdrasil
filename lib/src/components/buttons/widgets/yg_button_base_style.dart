import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

abstract class YgButtonBaseStyle<T extends YgState> extends YgStyleWithDefaults<T> {
  YgButtonBaseStyle({
    required super.state,
    required super.vsync,
  });

  late YgAnimatedNullableBorderSideProperty borderSide;
  late YgAnimatedNullableShapeBorderProperty shape;
  late YgAnimatedBoxConstraintsProperty constraints;
  late YgAnimatedColorProperty color;
  late YgAnimatedIconThemeDataProperty iconTheme;
  late YgAnimatedTextStyleProperty textStyle;
  late YgAnimatedEdgeInsetsProperty padding;
  late YgAnimatedAlignmentProperty alignment;
  late YgAnimatedDoubleProperty elevation;
  late YgDrivenProperty<MouseCursor?> cursor;
  late YgDrivenColorProperty splashColor;
  late YgDrivenProperty<InteractiveInkFeatureFactory> splashFactory;

  @override
  void init() {
    constraints = animate(YgBoxConstraintsProperty<T>.resolveWith(resolveConstraints));
    color = animate(YgColorProperty<T>.resolveWith(resolveColor));
    iconTheme = animate(YgIconThemeDataProperty<T>.resolveWith(_resolveIconTheme));
    textStyle = animate(YgTextStyleProperty<T>.resolveWith(resolveTextStyle));
    padding = animate(YgEdgeInsetsProperty<T>.resolveWith(resolvePadding));
    alignment = animate(YgAlignmentProperty<T>.resolveWith(resolveAlignment));
    borderSide = animate(YgNullableBorderSideProperty<T>.resolveWith(resolveBorderSide));
    elevation = animate(YgDoubleProperty<T>.resolveWith(resolveElevation));
    shape = animate(YgProperty<T, OutlinedBorder?>.resolveWith(resolveOutlinedBorder));
    cursor = drive(YgProperty<T, MouseCursor?>.resolveWith(resolveCursor));
    splashColor = drive(YgColorProperty<T>.resolveWith(resolveSplashColor));
    splashFactory = drive(YgProperty<T, InteractiveInkFeatureFactory>.resolveWith(resolveSplashFactory));
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

  MouseCursor resolveCursor(BuildContext context, T state);

  Alignment resolveAlignment(BuildContext context, T state) {
    return Alignment.center;
  }

  BorderSide? resolveBorderSide(BuildContext context, T state) {
    return null;
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
}
