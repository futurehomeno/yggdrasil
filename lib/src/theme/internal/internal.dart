import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/theme/internal/scroll_shadow/scroll_shadow.dart';

part 'internal.tailor.dart';

@tailorComponent
class _$YgInternalThemes {
  @themeExtension
  static List<YgScrollShadowThemes> scrollShadow = YgScrollShadowThemes.themes;
}
