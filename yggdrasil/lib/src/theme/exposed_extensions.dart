import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

extension YgThemeBuildContextProps on BuildContext {
  YgTokens get tokens => Theme.of(this).extension<YgTheme>()!.tokens;
}
