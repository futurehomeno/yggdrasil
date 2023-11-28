import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_switch/yg_switch_state.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import 'helpers/_yg_switch_helpers.dart';
import 'yg_switch_style.dart';

/// Binary (or optionally tri-state) switch.
class YgSwitch extends StatefulWidget with StatefulWidgetDebugMixin {
  const YgSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.triState = false,
  });

  /// The current value of the switch.
  final bool? value;

  /// Callback to trigger when the value of the switch changes.
  ///
  /// The switch itself does not maintain any state. Instead, when the state of
  /// the switch changes, the widget calls the [onChanged] callback.
  final Function(bool? newValue)? onChanged;

  /// Enables `null` as a valid third state for the switch.
  ///
  /// The switch will then cycle through false --> null --> true --> false --> ...
  final bool triState;

  @override
  State<YgSwitch> createState() => _YgSwitchState();

  @override
  YgDebugType get debugType {
    if (onChanged == null) {
      return YgDebugType.other;
    }

    return YgDebugType.intractable;
  }
}

class _YgSwitchState extends StateWithYgStyle<YgSwitch, YgSwitchStyle> {
  late final YgSwitchState _state = YgSwitchState(
    disabled: widget.onChanged == null,
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
    _state.disabled.value = widget.onChanged == null;
    _state.selected.value = widget.value;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return YgFocusableActionDetector(
      onActivate: _onTap,
      enabled: !_state.disabled.value,
      onHoverChanged: _state.hovered.update,
      onFocusChanged: _state.focused.update,
      mouseCursor: MaterialStateMouseCursor.clickable,
      child: Semantics(
        toggled: widget.value,
        child: ConstrainedBox(
          constraints: const BoxConstraints.expand(
            width: 50,
            height: 30,
          ),
          child: CustomPaint(
            painter: _YgSwitchPainter(
              style: style,
            ),
          ),
        ),
      ),
    );
  }

  void _onTap() {
    final bool? nextValue = YgSwitchHelpers.getNextValue(widget.value, widget.triState);
    widget.onChanged?.call(nextValue);
  }
}

class _YgSwitchPainter extends CustomPainter {
  _YgSwitchPainter({
    required this.style,
  }) : super(repaint: style);

  final YgSwitchStyle style;

  @override
  void paint(Canvas canvas, Size size) {
    final double offset = style.handlePadding.value + (style.handleRadius.value / 2);
    final double offsetEnd = style.width.value - offset;

    final Paint trackPaint = Paint()
      ..color = style.trackColor.value
      ..style = PaintingStyle.stroke
      ..strokeWidth = offset * 2
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(offset, offset),
      Offset(offsetEnd, offset),
      trackPaint,
    );

    final Paint handlePaint = Paint()..color = style.handleColor.value;

    canvas.drawCircle(
      Offset(
        lerpDouble(offset, offsetEnd, style.handlePositionFraction.value)!,
        offset,
      ),
      style.handleRadius.value / 2,
      handlePaint,
    );
  }

  @override
  bool shouldRepaint(_YgSwitchPainter oldDelegate) => oldDelegate.style != style;

  @override
  bool shouldRebuildSemantics(_YgSwitchPainter oldDelegate) => false;
}
