import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgCheckboxGroup extends StatelessWidget {
  const YgCheckboxGroup({
    super.key,
    required this.label,
    required this.checkboxItems,
  });

  final String label;
  final List<YgCheckboxItem> checkboxItems;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: context.checkboxTheme.labelTextStyle,
        ),
        ...checkboxItems,
      ].withVerticalSpacing(context.checkboxTheme.checkboxGroupLabelColumnSpacing),
    );
  }
}
