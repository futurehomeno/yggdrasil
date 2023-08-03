import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/theme.dart';

import 'helpers/_yg_switch_helpers.dart';
import 'yg_switch_handle.dart';

/// Binary (or optionally tri-state) switch.
class YgSwitch extends StatelessWidget {
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
        child: Material(
          color: _getBackgroundColor(context),
          shape: RoundedRectangleBorder(
            borderRadius: context.switchTheme.borderRadius,
          ),
          child: InkWell(
            excludeFromSemantics: true,
            borderRadius: context.switchTheme.borderRadius,
            onTap: onChanged == null ? null : _onTap,
            child: SizedBox(
              width: context.switchTheme.width,
              height: context.switchTheme.height,
              child: Padding(
                // Moves the switch away from the edges.
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: AnimatedAlign(
                  curve: context.switchTheme.animationCurve,
                  alignment: _getHandleAlignment(),
                  duration: context.switchTheme.animationDuration,
                  child: YgSwitchHandle(
                    color: _getHandleColor(context),
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

  Color _getBackgroundColor(BuildContext context) {
    if (onChanged == null) {
      return context.switchTheme.backgroundDisabledColor;
    }

    if (value == true) {
      return context.switchTheme.backgroundSelectedColor;
    }

    if (value == false) {
      return context.switchTheme.backgroundDeselectedColor;
    }

    return context.switchTheme.backgroundNullColor;
  }

  Color _getHandleColor(BuildContext context) {
    if (onChanged == null) {
      return context.switchTheme.handleDisabledColor;
    }

    if (value == true) {
      return context.switchTheme.handleSelectedColor;
    }

    if (value == false) {
      return context.switchTheme.handleDeselectedColor;
    }

    return context.switchTheme.handleNullColor;
  }
}
