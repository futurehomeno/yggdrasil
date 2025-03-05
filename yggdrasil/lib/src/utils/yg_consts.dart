// ignore_for_file: prefer-static-class

import 'dart:io';

import 'package:flutter/foundation.dart';

/// Constants used in Yggdrasil
abstract final class YgConsts {
  const YgConsts._();

  /// Whether the current platform is a mobile platform.
  static final bool isMobile = !kIsWeb && (Platform.isAndroid || Platform.isIOS);

  /// Whether the current platform is ios.
  static final bool isIos = !kIsWeb && Platform.isIOS;

  /// The package name of yggdrasil, used for loading assets.
  static const String package = 'yggdrasil';
}
