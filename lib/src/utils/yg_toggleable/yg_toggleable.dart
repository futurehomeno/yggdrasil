import 'package:flutter/widgets.dart';

abstract class YgToggleable {
  bool? get value;

  bool get enabled;

  bool get triState;

  VoidCallback? get toggle;
}
