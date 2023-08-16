import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/_components.dart';
import 'package:yggdrasil/src/components/yg_switch/helpers/_yg_switch_helpers.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

/// Binary (or optionally tri-state) switch.
class YgCheckboxListTile extends StatelessWidget {
  const YgCheckboxListTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.subtitle,
    this.subtitleIcon,
    this.trailingWidget,
    this.triState = false,
  });

  /// See [YgListTile] documentation.
  final String title;

  /// See [YgListTile] documentation.
  final String? subtitle;

  /// See [YgListTile] documentation.
  final Widget? subtitleIcon;

  /// See [YgSwitch] documentation.
  final bool? value;

  /// See [YgSwitch] documentation.
  final Function(bool? newValue)? onChanged;

  /// See [YgSwitch] documentation.
  final bool triState;

  /// Optional widget to display before the switch.
  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    return YgListTile(
      title: title,
      subtitle: subtitle,
      subtitleIcon: subtitleIcon,
      onTap: onChanged == null ? null : _onTap,
      trailingWidgets: <Widget>[
        if (trailingWidget != null) trailingWidget!,
        AbsorbPointer(
          child: YgNoFocus(
            child: YgCheckbox(
              value: value,
              onChanged: onChanged,
              triState: triState,
            ),
          ),
        ),
      ],
    );
  }

  void _onTap() {
    final bool? nextValue = YgSwitchHelpers.getNextValue(value, triState);
    onChanged?.call(nextValue);
  }
}
