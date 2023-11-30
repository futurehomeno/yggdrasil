import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_switch/yg_switch_state.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import 'yg_switch_painter.dart';
import 'yg_switch_style.dart';

part 'yg_switch_dual_state.dart';
part 'yg_switch_tri_state.dart';

// TODO(Tim): Add mouse cursor support.

/// Binary (or optionally tri-state) switch.
abstract base class YgSwitch extends StatefulWidget with StatefulWidgetDebugMixin implements YgToggleable {
  const factory YgSwitch({
    Key? key,
    required ValueChanged<bool>? onChanged,
    required bool value,
  }) = YgSwitchDualState;

  const factory YgSwitch.triState({
    Key? key,
    required ValueChanged<bool?>? onChanged,
    required bool? value,
  }) = YgSwitchTriState;

  const YgSwitch._({
    super.key,
  });

  @override
  State<YgSwitch> createState() => _YgSwitchState();

  @override
  YgDebugType get debugType {
    if (disabled) {
      return YgDebugType.other;
    }

    return YgDebugType.intractable;
  }
}

class _YgSwitchState extends StateWithYgStyle<YgSwitch, YgSwitchStyle> {
  late final YgSwitchState _state = YgSwitchState(
    disabled: widget.disabled,
    selected: widget.value,
  );

  @override
  YgSwitchStyle createStyle() {
    return YgSwitchStyle(state: _state, vsync: this);
  }

  @override
  void dispose() {
    _state.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant YgSwitch oldWidget) {
    _state.disabled.value = widget.disabled;
    _state.selected.value = widget.value;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return YgFocusableActionDetector(
      onActivate: widget.toggle,
      enabled: !_state.disabled.value,
      onHoverChanged: _state.hovered.update,
      onFocusChanged: _state.focused.update,
      mouseCursor: MaterialStateMouseCursor.clickable,
      child: Semantics(
        toggled: widget.value,
        child: SizedBox(
          width: 50,
          height: 30,
          child: RepaintBoundary(
            child: CustomPaint(
              painter: YgSwitchPainter(
                style: style,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
