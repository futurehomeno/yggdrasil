import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/_components.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

/// Radio button inside a list tile.
class YgRadioListTile<T> extends StatelessWidget {
  const YgRadioListTile({
    super.key,
    required this.title,
    required this.radio,
    this.subtitle,
    this.subtitleIcon,
    this.trailingWidget,
  });

  /// See [YgListTile] documentation.
  final String title;

  /// The actual radio.
  ///
  /// Clicking anywhere on the [YgRadioListTile] will trigger
  /// the onChanged callback of this radio.
  final YgRadio<T> radio;

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
      onTap: radio.onChanged == null ? null : _onTap,
      trailingWidgets: <Widget>[
        if (trailingWidget != null) trailingWidget!,
        AbsorbPointer(
          child: YgNoFocus(
            child: YgRadio<T>(
              value: radio.value,
              groupValue: radio.groupValue,
              onChanged: radio.onChanged,
            ),
          ),
        ),
      ],
    );
  }

  void _onTap() {
    radio.onChanged?.call(radio.value);
  }
}
