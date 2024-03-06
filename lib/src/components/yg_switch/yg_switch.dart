import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_switch/yg_switch_state.dart';
import 'package:yggdrasil/src/theme/switch/switch_theme.dart';
import 'package:yggdrasil/src/theme/theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import 'yg_switch_painter.dart';
import 'yg_switch_style.dart';

part 'yg_switch_dual_state.dart';
part 'yg_switch_tri_state.dart';

/// Binary (or optionally tri-state) switch.
abstract base class YgSwitch extends StatefulWidget with StatefulWidgetDebugMixin implements YgToggleable {
  const factory YgSwitch({
    Key? key,
    required ValueChanged<bool>? onChanged,
    required bool? value,
  }) = YgSwitchDualState;

  /// Supports a nullable value, i.e. "indeterminate".
  const factory YgSwitch.triState({
    Key? key,
    required ValueChanged<bool?>? onChanged,
    required bool? value,
  }) = YgSwitchTriState;

  const YgSwitch._({
    super.key,
    this.value,
  });

  /// The current value of the switch.
  @override
  final bool? value;

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

class _YgSwitchState extends StateWithYgStateAndStyle<YgSwitch, YgSwitchState, YgSwitchStyle> {
  @override
  YgSwitchState createState() {
    return YgSwitchState(
      disabled: widget.disabled,
      toggled: widget.value,
    );
  }

  @override
  void updateState() {
    state.disabled.value = widget.disabled;
    state.toggled.value = widget.value;
  }

  @override
  YgSwitchStyle createStyle() {
    return YgSwitchStyle(
      state: state,
      vsync: this,
    );
  }

  @override
  Set<Listenable> getWatchedProperties() {
    return <Listenable>{
      style.mouseCursor,
    };
  }

  @override
  Widget build(BuildContext context) {
    final YgSwitchTheme theme = context.switchTheme;
    final double computedHeight = theme.handleSize + (theme.handlePadding * 2);

    return YgFocusableActionDetector(
      onActivate: widget.toggle,
      enabled: !state.disabled.value,
      onHoverChanged: state.hovered.update,
      onFocusChanged: state.focused.update,
      mouseCursor: style.mouseCursor.value,
      child: Semantics(
        toggled: state.toggled.value,
        enabled: state.disabled.value,
        child: SizedBox(
          width: style.width.value,
          height: computedHeight,
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
