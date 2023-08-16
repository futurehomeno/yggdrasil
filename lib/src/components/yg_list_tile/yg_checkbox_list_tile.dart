import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/_components.dart';
import 'package:yggdrasil/src/components/yg_switch/helpers/_yg_switch_helpers.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

/// Binary (or optionally tri-state) switch.
class YgCheckboxListTile extends StatelessWidget {
  const YgCheckboxListTile({
    super.key,
    required this.title,
    required this.checkbox,
    this.subtitle,
    this.subtitleIcon,
    this.trailingWidget,
  });

  /// See [YgListTile] documentation.
  final String title;

  /// The actual checkbox.
  ///
  /// Clicking anywhere on the [YgCheckboxListTile] will trigger
  /// the onChanged callback of this checkbox.
  final YgCheckbox checkbox;

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
      onTap: checkbox.onChanged == null ? null : _onTap,
      trailingWidgets: <Widget>[
        if (trailingWidget != null) trailingWidget!,
        AbsorbPointer(
          child: YgNoFocus(
            child: YgCheckbox(
              value: checkbox.value,
              onChanged: checkbox.onChanged,
              triState: checkbox.triState,
            ),
          ),
        ),
      ],
    );
  }

  void _onTap() {
    final bool? nextValue = YgSwitchHelpers.getNextValue(checkbox.value, checkbox.triState);
    checkbox.onChanged?.call(nextValue);
  }
}
