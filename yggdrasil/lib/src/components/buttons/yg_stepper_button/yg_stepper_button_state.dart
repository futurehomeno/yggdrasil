import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import 'enums/_enums.dart';

class YgStepperButtonState extends YgButtonBaseState {
  YgStepperButtonState({
    super.disabled,
    super.focused,
    super.hovered,
    super.pressed,
    YgStepperButtonSize size = YgStepperButtonSize.large,
    YgStepperButtonVariant variant = YgStepperButtonVariant.outlined,
    Color? color,
  }) : size = YgStateValue<YgStepperButtonSize>(size),
       variant = YgStateValue<YgStepperButtonVariant>(variant),
       color = YgStateValue<Color?>(color);

  final YgStateValue<YgStepperButtonSize> size;

  final YgStateValue<YgStepperButtonVariant> variant;

  final YgStateValue<Color?> color;

  @override
  List<YgStateValue<Object?>> get props => <YgStateValue<Object?>>[
    ...super.props,
    size,
    variant,
    color,
  ];
}
