import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_icon/icon_frame/yg_icon_frame_state.dart';
import 'package:yggdrasil/src/theme/icon/icon_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgIconFrameStyle extends YgStyle<YgIconFrameState> {
  YgIconFrameStyle({
    required super.state,
    required super.vsync,
  });

  late final YgAnimatedProperty<Size> size = animate(_resolveSize);
  late final YgAnimatedProperty<Color> color = animate(_resolveColor);

  Size _resolveSize() {
    final double size = switch (state.size.value) {
      null => _iconTheme.size ?? _theme.sizeSmall,
      YgIconSize.large => _theme.sizeLarge,
      YgIconSize.small => _theme.sizeSmall,
    };

    return Size.square(size);
  }

  Color _resolveColor() {
    final Color? userColor = state.color.value;

    if (userColor != null) {
      return userColor;
    }

    return _iconTheme.color ?? _theme.defaultColor;
  }

  @override
  Curve get curve => _theme.animationCurve;

  @override
  Duration get duration => _theme.animationDuration;

  YgIconTheme get _theme => context.iconTheme;

  IconThemeData get _iconTheme => IconTheme.of(context);
}
