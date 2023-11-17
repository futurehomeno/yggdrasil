import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgButtonBaseState extends YgState {
  YgButtonBaseState({
    bool focused = false,
    bool hovered = false,
    bool disabled = false,
    bool pressed = false,
  })  : focused = YgStateValue<bool>(focused),
        hovered = YgStateValue<bool>(hovered),
        disabled = YgStateValue<bool>(disabled),
        pressed = YgStateValue<bool>(pressed);

  final YgStateValue<bool> focused;
  final YgStateValue<bool> hovered;
  final YgStateValue<bool> disabled;
  final YgStateValue<bool> pressed;

  @override
  @mustCallSuper
  List<YgStateValue<Object>> get props => <YgStateValue<Object>>[
        focused,
        hovered,
        disabled,
        pressed,
      ];
}
