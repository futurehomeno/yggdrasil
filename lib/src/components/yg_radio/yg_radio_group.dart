import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgRadioGroup<T> extends StatelessWidget {
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
