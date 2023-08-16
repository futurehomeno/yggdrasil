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
    required this.value,
    required this.onChanged,
    this.triState = false,
  });

  /// Title to show to the right of the checkbox.
  final String title;

  /// See [YgCheckbox] documentation.
  final bool? value;

  /// See [YgCheckbox] documentation.
  final Function(bool? newValue)? onChanged;

  /// See [YgCheckbox] documentation.
  final bool triState;

  @override
  Widget build(BuildContext context) {
    final YgCheckboxTheme checkboxTheme = context.checkboxTheme;

    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onChanged == null ? null : _onTap,
        child: Row(
          children: <Widget>[
            AbsorbPointer(
              child: YgNoFocus(
                child: YgCheckbox(
                  value: value,
                  onChanged: onChanged,
                  triState: triState,
                ),
              ),
            ),
            Expanded(
              child: Text(
                title,
                style: checkboxTheme.checkboxItemTheme.titleTextStyle,
              ),
            ),
          ].withHorizontalSpacing(checkboxTheme.checkboxItemTheme.checkboxTitleSpacing),
        ),
      ),
    );
  }

  void _onTap() {
    final bool? nextValue = YgCheckboxHelpers.getNextValue(value, triState);
    onChanged?.call(nextValue);
  }
}
