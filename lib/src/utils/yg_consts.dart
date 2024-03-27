// ignore_for_file: prefer-static-class

import 'dart:io';

import 'package:flutter/foundation.dart';

final class YgConsts {
  const YgConsts._();

  static final bool isMobile = !kIsWeb && (Platform.isAndroid || Platform.isIOS);
}
