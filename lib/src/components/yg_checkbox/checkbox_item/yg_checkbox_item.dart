import 'package:flutter/material.dart';
import 'package:yggdrasil/src/extensions/_extensions.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import '../checkbox/yg_checkbox.dart';

part 'yg_checkbox_item_dual_state.dart';
part 'yg_checkbox_item_tri_state.dart';

abstract base class YgCheckboxItem extends StatelessWidget with StatelessWidgetDebugMixin implements YgToggleable {
  const factory YgCheckboxItem({
    Key? key,
    required ValueChanged<bool>? onChanged,
    required String title,
    required bool value,
  }) = YgCheckboxItemDualState;

  const factory YgCheckboxItem.triState({
    Key? key,
    required ValueChanged<bool?>? onChanged,
    required String title,
    required bool? value,
  }) = YgCheckboxItemTriState;

  const YgCheckboxItem._({
    super.key,
    required this.title,
  });

  /// Title to show to the right of the checkbox.
  final String title;

  @override
  Widget build(BuildContext context) {
    final YgCheckboxTheme checkboxTheme = context.checkboxTheme;

    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: toggle,
        child: Row(
          children: <Widget>[
            AbsorbPointer(
              child: YgNoFocus(
                child: _buildCheckbox(),
              ),
            ),
            Expanded(
              child: Padding(
                padding: checkboxTheme.checkboxItemTheme.titlePadding,
                child: Text(
                  title,
                  style: checkboxTheme.checkboxItemTheme.titleTextStyle,
                ),
              ),
            ),
          ].withHorizontalSpacing(checkboxTheme.checkboxItemTheme.checkboxTitleSpacing),
        ),
      ),
    );
  }

  YgCheckbox _buildCheckbox();

  @override
  YgDebugType get debugType {
    if (disabled) {
      return YgDebugType.other;
    }

    return YgDebugType.intractable;
  }
}
