import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

import '../yg_switch/helpers/_yg_switch_helpers.dart';

class YgCheckboxItem extends StatelessWidget {
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
                style: context.checkboxTheme.titleTextStyle,
              ),
            ),
          ].withHorizontalSpacing(context.checkboxTheme.checkboxItemCheckboxTitleSpacing),
        ),
      ),
    );
  }

  void _onTap() {
    final bool? nextValue = YgSwitchHelpers.getNextValue(checkbox.value, checkbox.triState);
    checkbox.onChanged?.call(nextValue);
  }
}
