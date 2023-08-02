import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/theme.dart';

import 'yg_switch_handle.dart';

/// Binary (or optionally tri-state) switch.
// TODO(bjhandeland): Replace animation properties with theme tokens.
class YgSwitch extends StatelessWidget {
  const YgSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.triState = false,
  });

  /// Toggles the binary switch state.
  final bool? value;

  /// Callback to trigger when the value of the switch changes.
  final Function(bool? newValue)? onChanged;

  /// Enables `null` as a valid third state for the switch.
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
            onTap: onChanged == null ? null : onTap,
            child: SizedBox(
              width: context.switchTheme.width,
              height: context.switchTheme.height,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: AnimatedAlign(
                  curve: Curves.easeInOut,
                  alignment: _getHandleAlignment(),
                  duration: const Duration(milliseconds: 200),
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

  void onTap() {
    final bool? currentValue = value;
    bool? nextValue;

    if (triState) {
      if (currentValue == null) {
        nextValue = true;
      } else if (currentValue == true) {
        nextValue = false;
      } else {
        nextValue = null;
      }
    } else {
      nextValue = !currentValue!;
    }

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
