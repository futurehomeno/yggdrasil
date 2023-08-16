import 'package:flutter/material.dart';
import 'package:yggdrasil/src/extensions/_extensions.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import 'helpers/_helpers.dart';
import 'yg_checkbox.dart';

class YgCheckboxItem extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgCheckboxItem({
    super.key,
    required this.title,
    required this.checkbox,
  });

  /// Title to show to the right of the checkbox.
  final String title;

  /// The actual checkbox.
  ///
  /// Clicking anywhere on the [YgCheckboxItem] will trigger
  /// the onChanged callback of this checkbox.
  final YgCheckbox checkbox;

  @override
  Widget build(BuildContext context) {
    final YgCheckboxTheme checkboxTheme = context.checkboxTheme;

    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: checkbox.onChanged == null ? null : _onTap,
        child: Row(
          children: <Widget>[
            AbsorbPointer(
              child: YgNoFocus(
                child: checkbox,
              ),
            ),
            Expanded(
              child: Text(
                title,
                style: checkboxTheme.checkboxItemTitleTextStyle,
              ),
            ),
          ].withHorizontalSpacing(checkboxTheme.checkboxItemCheckboxTitleSpacing),
        ),
      ),
    );
  }

  void _onTap() {
    final bool? nextValue = YgCheckboxHelpers.getNextValue(checkbox.value, checkbox.triState);
    checkbox.onChanged?.call(nextValue);
  }
}
