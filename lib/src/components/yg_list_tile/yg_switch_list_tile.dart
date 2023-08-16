import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/_components.dart';
import 'package:yggdrasil/src/components/yg_switch/helpers/_yg_switch_helpers.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

/// Binary (or optionally tri-state) switch.
class YgSwitchListTile extends StatelessWidget {
  const YgSwitchListTile({
    super.key,
    required this.title,
    required this.ygSwitch,
    this.subtitle,
    this.subtitleIcon,
    this.trailingWidget,
  });

  /// See [YgListTile] documentation.
  final String title;

  /// The actual switch.
  ///
  /// Clicking anywhere on the [YgSwitchListTile] will trigger
  /// the onChanged callback of this switch.
  final YgSwitch ygSwitch;

  /// See [YgListTile] documentation.
  final String? subtitle;

  /// See [YgListTile] documentation.
  final Widget? subtitleIcon;

  /// Optional widget to display before the switch.
  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    return YgListTile(
      title: title,
      subtitle: subtitle,
      subtitleIcon: subtitleIcon,
      onTap: ygSwitch.onChanged == null ? null : _onTap,
      trailingWidgets: <Widget>[
        if (trailingWidget != null) trailingWidget!,
        AbsorbPointer(
          child: YgNoFocus(
            child: YgSwitch(
              value: ygSwitch.value,
              onChanged: ygSwitch.onChanged,
              triState: ygSwitch.triState,
            ),
          ),
        ),
      ],
    );
  }

  void _onTap() {
    final bool? nextValue = YgSwitchHelpers.getNextValue(ygSwitch.value, ygSwitch.triState);
    ygSwitch.onChanged?.call(nextValue);
  }
}
