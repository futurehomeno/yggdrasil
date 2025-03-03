import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

typedef RepeatableCallback = void Function({required bool repeat});

/// Stepper button which repeatedly calls [onTrigger] when long pressing the button.
class YgSliderRepeatingStepperButton extends StatefulWidget {
  const YgSliderRepeatingStepperButton({
    super.key,
    required this.onTrigger,
    required this.editingChanged,
    required this.icon,
    required this.disabled,
    required this.interval,
    required this.repeatDelay,
  });

  /// Called when the user either starts or ends pressing the button.
  final ValueChanged<bool> editingChanged;

  /// Called every time the button triggers.
  final RepeatableCallback onTrigger;

  /// The icons shown in the stepper button.
  final YgColorableIconData icon;

  /// Whether the button should be disabled.
  final bool disabled;

  /// The interval of the repeating button trigger.
  final Duration interval;

  /// The delay before the button start repeatedly triggering.
  final Duration repeatDelay;

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
    super.didUpdateWidget(oldWidget);
    if (widget.disabled != oldWidget.disabled && widget.disabled && _repeatTimer != null) {
      scheduleMicrotask(() {
        _cancelRepeat();
      });
    }
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
    widget.onTrigger(repeat: false);
    _repeatTimer = Timer(
      widget.repeatDelay,
      _startRepeat,
    );
  }

  void _startRepeat() {
    widget.onTrigger(repeat: true);
    _repeatTimer = Timer.periodic(
      widget.interval,
      (Timer timer) => widget.onTrigger(repeat: true),
    );
  }
}