import 'package:flutter/material.dart';
import 'package:yggdrasil/src/extensions/_extensions.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import 'yg_checkbox_item.dart';

class YgCheckboxGroup extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgCheckboxGroup({
    super.key,
    required this.label,
    required this.checkboxItems,
  });

  final String label;
  final List<YgCheckboxItem> checkboxItems;

  @override
  Widget build(BuildContext context) {
    final YgCheckboxTheme checkboxTheme = context.checkboxTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: checkboxTheme.checkboxGroupLabelTextStyle,
        ),
        ...checkboxItems,
      ].withVerticalSpacing(checkboxTheme.checkboxGroupLabelColumnSpacing),
    );
  }
}
