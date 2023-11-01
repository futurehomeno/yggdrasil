import 'package:flutter/material.dart';

import 'yg_state_value.dart';

abstract class YgState extends ChangeNotifier {
  YgState() {
    for (final YgStateValue<Object> prop in props) {
      prop.addListener(notifyListeners);
    }
  }

  @override
  void dispose() {
    for (final YgStateValue<Object> value in props) {
      value.dispose();
    }
    super.dispose();
  }

  List<YgStateValue<Object>> get props;
}
