import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgSliverTopAppBarMapper {
  const YgSliverTopAppBarMapper._();

  static TextStyle getTitleTextStyle({
    required YgTopAppBarTheme theme,
    required YgSliverTopAppBarVariant variant,
  }) {
    switch (variant) {
      case YgSliverTopAppBarVariant.small:
        return theme.smallTopAppBarTheme.titleTextStyle;
      case YgSliverTopAppBarVariant.medium:
        return theme.mediumTopAppBarTheme.titleTextStyle;
      case YgSliverTopAppBarVariant.large:
        return theme.largeTopAppBarTheme.titleTextStyle;
    }
  }
}
