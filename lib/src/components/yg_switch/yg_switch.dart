import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'helpers/_yg_switch_helpers.dart';
import 'yg_switch_thumb.dart';

/// Binary (or optionally tri-state) switch.
class YgSwitch extends StatelessWidget with StatelessWidgetDebugMixin {
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
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Semantics(
        toggled: value,
        child: GestureDetector(
          onTap: onChanged == null ? null : _onTap,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: _getTrackColor(context),
              borderRadius: context.switchTheme.borderRadius,
            ),
            child: SizedBox(
              width: context.switchTheme.width,
              height: context.switchTheme.height,
              child: Padding(
                // Moves the switch away from the edges.
                padding: context.switchTheme.trackPadding,
                child: AnimatedAlign(
                  curve: context.switchTheme.animationCurve,
                  alignment: _getHandleAlignment(),
                  duration: context.switchTheme.animationDuration,
                  child: YgSwitchThumb(
                    color: _getThumbColor(context),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTap() {
    final bool? nextValue = YgSwitchHelpers.getNextValue(value, triState);
    onChanged?.call(nextValue);
  }

  Alignment _getHandleAlignment() {
    if (value == true) {
      return Alignment.centerRight;
    }

    if (value == false) {
      return Alignment.centerLeft;
    }

    return Alignment.center;
  }

  Color _getTrackColor(BuildContext context) {
    if (onChanged == null) {
      return context.switchTheme.trackDisabledColor;
    }

    if (value == true) {
      return context.switchTheme.trackToggledColor;
    }

    if (value == false) {
      return context.switchTheme.trackNotToggledColor;
    }

    return context.switchTheme.trackNullColor;
  }

  Color _getThumbColor(BuildContext context) {
    if (onChanged == null) {
      return context.switchTheme.thumbDisabledColor;
    }

    if (value == true) {
      return context.switchTheme.thumbToggledColor;
    }

    if (value == false) {
      return context.switchTheme.thumbNotToggledColor;
    }

    return context.switchTheme.thumbNullColor;
  }
}
