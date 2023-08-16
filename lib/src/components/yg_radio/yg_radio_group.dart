import 'package:flutter/material.dart';
import 'package:yggdrasil/src/extensions/_extensions.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import 'yg_radio_item.dart';

class YgRadioGroup<T> extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgRadioGroup({
    super.key,
    required this.label,
    required this.radioItems,
  });

  final String label;
  final List<YgRadioItem<T>> radioItems;

  @override
  Widget build(BuildContext context) {
    final YgRadioTheme radioTheme = context.radioTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: radioTheme.radioGroupLabelTextStyle,
        ),
        ...radioItems,
      ].withVerticalSpacing(radioTheme.radioGroupLabelColumnSpacing),
    );
  }
}
