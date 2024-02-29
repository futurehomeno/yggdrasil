import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/fields/yg_dropdown_field/yg_drop_down_child_route_mixin.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgDropdownPickerBottomSheetRoute<T extends Object> extends YgBottomSheetModalRoute
    with YgDropDownChildRouteMixin<T> {
  YgDropdownPickerBottomSheetRoute({
    required this.entries,
    required this.label,
    required this.metric,
    required this.onClose,
    required this.dropdownController,
  });

  @override
  final YgSingleSelectDropdownController<T> dropdownController;
  final List<YgDropdownEntry<T>> entries;
  @override
  final VoidCallback onClose;
  final String? metric;
  final String label;

  @override
  String get name => 'YgDropdownPickerBottomSheetRoute($label)';

  @override
  Widget buildBottomSheet(BuildContext context) {
    return YgBottomSheet(
      title: label,
      content: YgSection(
        child: YgPicker(
          columns: <YgPickerColumn<Object>>[
            YgPickerColumn<T>(
              onChange: dropdownController.onValueTapped,
              initialValue: dropdownController.pendingValue.value,
              entries: entries
                  .map(
                    (YgDropdownEntry<T> entry) => YgPickerEntry<T>(
                      title: entry.title,
                      value: entry.value,
                    ),
                  )
                  .toList(),
            ),
          ],
          metric: metric,
        ),
      ),
      footerButtons: YgButtonGroup.vertical(
        children: <YgButton>[
          YgButton(
            onPressed: () => dropdownController.submitChanges(close: true),
            child: Text(DefaultYggdrasilLocalizations.current.dropdownDone),
          ),
        ],
      ),
    );
  }
}
