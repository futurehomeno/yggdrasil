import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/enums/yg_button_state.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

abstract class YgButtonStyle extends YgStyleWithDefaults<YgButtonState> {
  YgButtonStyle({
    required super.controller,
    required super.vsync,
  });

  late YgAnimatedNullableBorderSideProperty borderSide;

  late YgAnimatedNullableShapeBorderProperty shape;
  late YgAnimatedBoxConstraintsProperty constraints;
  late YgAnimatedColorProperty color;
  late YgAnimatedTextStyleProperty textStyle;
  late YgAnimatedEdgeInsetsProperty padding;
  late YgAnimatedAlignmentProperty alignment;
  late YgAnimatedDoubleProperty elevation;

  late YgDrivenProperty<MouseCursor?> cursor;
  late YgDrivenProperty<InteractiveInkFeatureFactory> splashFactory;

  @override
  void init() {
    constraints = animate(YgBoxConstraintsProperty<YgButtonState>.resolveWith(resolveConstraints));
    color = animate(YgColorProperty<YgButtonState>.resolveWith(resolveColor));
    textStyle = animate(YgTextStyleProperty<YgButtonState>.resolveWith(resolveTextStyle));
    padding = animate(YgEdgeInsetsProperty<YgButtonState>.resolveWith(resolvePadding));
    alignment = animate(YgAlignmentProperty<YgButtonState>.resolveWith(resolveAlignment));
    borderSide = animate(YgNullableBorderSideProperty<YgButtonState>.resolveWith(resolveBorderSide));
    elevation = animate(YgDoubleProperty<YgButtonState>.resolveWith(resolveElevation));
    shape = animate(YgProperty<YgButtonState, OutlinedBorder?>.resolveWith(resolveShape));
    cursor = drive(YgProperty<YgButtonState, MouseCursor?>.resolveWith(resolveCursor));
    splashFactory = drive(YgProperty<YgButtonState, InteractiveInkFeatureFactory>.resolveWith(resolveSplashFactory));
  }

  Color resolveColor(BuildContext context, Set<YgButtonState> states);

  TextStyle resolveTextStyle(BuildContext context, Set<YgButtonState> states);

  BoxConstraints resolveConstraints(BuildContext context, Set<YgButtonState> states) {
    return const BoxConstraints();
  }

  OutlinedBorder? resolveShape(BuildContext context, Set<YgButtonState> states) {
    return null;
  }

  EdgeInsets resolvePadding(BuildContext context, Set<YgButtonState> states) {
    return const EdgeInsets.all(0);
  }

  MouseCursor? resolveCursor(BuildContext context, Set<YgButtonState> states) {
    if (states.disabled) {
      return null;
    }

    return SystemMouseCursors.click;
  }

  Alignment resolveAlignment(BuildContext context, Set<YgButtonState> states) {
    return Alignment.center;
  }

  BorderSide? resolveBorderSide(BuildContext context, Set<YgButtonState> states) {
    return null;
  }

  double resolveElevation(BuildContext context, Set<YgButtonState> states) {
    return 0.0;
  }

  Color resolveIconColor(BuildContext context, Set<YgButtonState> states) {
    if(states.disabled) {
      return 
    }
  }

  InteractiveInkFeatureFactory resolveSplashFactory(BuildContext context, Set<YgButtonState> states) {
    return InkRipple.splashFactory;
  }
}
