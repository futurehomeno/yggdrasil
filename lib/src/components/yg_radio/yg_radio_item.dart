import 'package:flutter/material.dart';
import 'package:yggdrasil/src/extensions/_extensions.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import 'yg_radio.dart';

class YgRadioItem<T> extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgRadioItem({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  /// Title to show to the right of the radio.
  final String title;

  /// See [YgRadio] documentation.
  final T value;

  /// See [YgRadio] documentation.
  final T? groupValue;

  /// See [YgRadio] documentation.
  final ValueChanged<T?>? onChanged;

  @override
  Widget build(BuildContext context) {
    final YgRadioTheme radioTheme = context.radioTheme;

    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onChanged == null ? null : _onTap,
        child: Row(
          children: <Widget>[
            AbsorbPointer(
              child: YgNoFocus(
                child: YgRadio<T>(
                  value: value,
                  groupValue: groupValue,
                  onChanged: onChanged,
                ),
              ),
            ),
            Expanded(
              child: Text(
                title,
                style: radioTheme.radioItemTitleTextStyle,
              ),
            ),
          ].withHorizontalSpacing(radioTheme.radioItemRadioTitleSpacing),
        ),
      ),
    );
  }

  void _onTap() {
    onChanged?.call(value);
  }
}
