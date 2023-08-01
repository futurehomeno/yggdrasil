import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/theme.dart';

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

  /// Makes switch toggle from true --> false --> null --> true --> ...
  final bool triState;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _getBackgroundColor(context),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(50.0),
        onTap: onChanged == null ? null : onTap,
        child: SizedBox(
          width: 50.0,
          height: 30.0,
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

class YgSwitchHandle extends StatelessWidget {
  const YgSwitchHandle({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.0,
      width: 20.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
