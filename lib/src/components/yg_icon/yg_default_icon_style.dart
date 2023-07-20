import 'package:flutter/material.dart';

import '_yg_icon.dart';

class YgDefaultIconStyle extends InheritedWidget {
  const YgDefaultIconStyle({
    super.key,
    required super.child,
    this.color,
    this.invertColor,
    this.useSvgColor,
    this.size,
    this.tapSize,
  });

  /// See [YgIcon.color].
  final Color? color;

  /// See [YgIcon.invertColor].
  final bool? invertColor;

  /// See [YgIcon.useSvgColor].
  final bool? useSvgColor;

  /// See [YgIcon.size].
  final YgIconSize? size;

  /// See [YgIcon.tapSize].
  final YgIconTapSize? tapSize;

  static YgDefaultIconStyle? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<YgDefaultIconStyle>();
  }

  @override
  bool updateShouldNotify(YgDefaultIconStyle oldWidget) {
    return oldWidget.color != color ||
        oldWidget.invertColor != invertColor ||
        oldWidget.useSvgColor != useSvgColor ||
        oldWidget.size != size ||
        oldWidget.tapSize != tapSize;
  }
}
