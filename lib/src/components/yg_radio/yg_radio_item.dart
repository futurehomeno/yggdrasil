import 'package:flutter/material.dart';
import 'package:yggdrasil/src/extensions/_extensions.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import 'yg_radio.dart';

class YgRadioItem<T> extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgRadioItem({
    super.key,
    required this.title,
    required this.radio,
  });

  /// Title to show to the right of the radio.
  final String title;

  /// The actual radio.
  ///
  /// Clicking anywhere on the [YgRadioItem] will trigger
  /// the onChanged callback of this radio.
  final YgRadio<T> radio;

  @override
  Widget build(BuildContext context) {
    final YgRadioTheme radioTheme = context.radioTheme;

    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: radio.onChanged == null ? null : _onTap,
        child: Row(
          children: <Widget>[
            AbsorbPointer(
              child: YgNoFocus(
                child: radio,
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
    radio.onChanged?.call(radio.value);
  }
}
