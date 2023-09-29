import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgSliverAppBarMapper {
  const YgSliverAppBarMapper._();

  static TextStyle getTitleTextStyle({
    required YgAppBarTheme theme,
    required YgSliverAppBarVariant variant,
  }) {
    return theme.smallAppBarTheme.titleTextStyle;
  }
}
