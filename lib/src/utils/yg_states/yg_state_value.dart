import 'package:flutter/material.dart';

class YgStateValue<T> extends ValueNotifier<T> {
  YgStateValue({
    required T initialValue,
  }) : super(initialValue);
}
