import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import 'yg_checkbox_item.dart';

/// Group of [YgCheckboxItem]s.
// TODO(bjhandeland): Check if these should have rounded corners.
class YgCheckboxGroup extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgCheckboxGroup({
    super.key,
    required this.label,
    required this.checkboxItems,
  }) : assert(checkboxItems.length <= 5, 'Checkbox group can only have 5 items');

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
          style: checkboxTheme.checkboxGroupTheme.labelTextStyle,
        ),
        SizedBox(height: checkboxTheme.checkboxGroupTheme.labelColumnSpacing),
        ...checkboxItems,
      ],
    );
  }
}
