import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/yg_stepper_button/_yg_stepper_button.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgSliderRepeatingStepperButton extends StatefulWidget {
  const YgSliderRepeatingStepperButton({
    super.key,
    required this.onTrigger,
    required this.editingChanged,
    required this.icon,
    required this.disabled,
    required this.interval,
  });

  final ValueChanged<bool> editingChanged;
  final VoidCallback onTrigger;
  final YgColorableIconData icon;
  final bool disabled;
  final Duration interval;

  @override
  State<YgSliderRepeatingStepperButton> createState() => _YgSliderRepeatingStepperButtonState();
}

class _YgSliderRepeatingStepperButtonState extends State<YgSliderRepeatingStepperButton> {
  Timer? _repeatTimer;

  @override
  void dispose() {
    _repeatTimer?.cancel();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant YgSliderRepeatingStepperButton oldWidget) {
    if (widget.disabled != oldWidget.disabled && widget.disabled && _repeatTimer != null) {
      scheduleMicrotask(() {
        _cancelRepeat();
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return YgStepperButton(
      icon: widget.icon,
      size: YgStepperButtonSize.medium,
      onTapStart: _onPressStart,
      onTapEnd: _cancelRepeat,
      disabled: widget.disabled,
    );
  }

  void _cancelRepeat() {
    widget.editingChanged(false);
    _repeatTimer?.cancel();
    _repeatTimer = null;
  }

  void _onPressStart() {
    widget.editingChanged(true);
    widget.onTrigger();
    _repeatTimer = Timer(
      const Duration(seconds: 1),
      _startRepeat,
    );
  }

  void _startRepeat() {
    _repeatTimer = Timer.periodic(
      widget.interval,
      (Timer timer) => widget.onTrigger(),
    );
  }
}
