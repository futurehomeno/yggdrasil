import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/_components.dart';
import 'package:yggdrasil/src/components/yg_switch/helpers/_yg_switch_helpers.dart';

/// Binary (or optionally tri-state) switch.
class YgSwitchListTile extends StatelessWidget {
  const YgSwitchListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
    this.triState = false,
  });

  /// See [YgListTile] documentation.
  final String title;

  /// See [YgListTile] documentation.
  final String subtitle;

  /// See [YgSwitch] documentation.
  final bool? value;

  /// See [YgSwitch] documentation.
  final Function(bool? newValue)? onChanged;

  /// See [YgSwitch] documentation.
  final bool triState;

  @override
  Widget build(BuildContext context) {
    return YgListTile(
      title: title,
      subtitle: subtitle,
      onTap: onChanged == null ? null : _onTap,
      trailingWidgets: <Widget>[
        YgSwitch(
          value: value,
          onChanged: onChanged,
          triState: triState,
        ),
      ],
    );
  }

  void _onTap() {
    final bool? nextValue = YgSwitchHelpers.getNextValue(value, triState);
    onChanged?.call(nextValue);
  }
}
