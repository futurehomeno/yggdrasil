import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/_components.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

/// Radio button inside a list tile.
class YgRadioListTile<T> extends StatelessWidget {
  const YgRadioListTile({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.subtitle,
    this.subtitleIcon,
    this.leadingWidget,
  });

  /// See [YgListTile.title].
  final String title;

  /// See [YgListTile.subtitle].
  final String? subtitle;

  /// See [YgListTile.subtitleIcon].
  final Widget? subtitleIcon;

  /// See [YgRadio.value].
  final T value;

  /// See [YgRadio.groupValue].
  final T? groupValue;

  /// See [YgRadio.onChanged].
  final ValueChanged<T?>? onChanged;

  /// Optional widget to display before the switch.
  final Widget? leadingWidget;

  @override
  Widget build(BuildContext context) {
    final Widget? leadingWidget = this.leadingWidget;

    final AbsorbPointer radioButton = AbsorbPointer(
      child: YgNoFocus(
        child: YgRadio<T>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
      ),
    );

    return YgListTile(
      title: title,
      subtitle: subtitle,
      subtitleIcon: subtitleIcon,
      onTap: onChanged == null ? null : _onTap,
      leadingWidgets: <Widget>[
        if (leadingWidget == null) radioButton else leadingWidget,
      ],
      trailingWidgets: <Widget>[
        if (leadingWidget != null) radioButton,
      ],
    );
  }

  void _onTap() {
    onChanged?.call(value);
  }
}
