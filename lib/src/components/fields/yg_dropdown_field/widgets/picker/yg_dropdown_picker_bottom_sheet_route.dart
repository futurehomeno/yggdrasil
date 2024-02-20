import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgDropdownPickerBottomSheetRoute<T extends Object> extends YgBottomSheetModalRoute {
  YgDropdownPickerBottomSheetRoute({
    required this.entries,
    required this.label,
    required this.metric,
    required this.onClose,
    required this.dropdownController,
  });

  final String label;
  final String? metric;
  final List<YgDropdownEntry<T>> entries;
  final YgSingleSelectDropdownController<T> dropdownController;
  final VoidCallback onClose;

  @override
  void onPopInvoked(bool didPop) {
    if (!didPop) {
      return;
    }

    onClose();
    dropdownController.discardChanges(close: false);
  }

  @override
  String get name => 'YgDropdownPickerBottomSheetRoute($label)';

  @override
  Widget buildBottomSheet(BuildContext context) {
    return YgBottomSheet(
      title: label,
      content: YgPicker(
        columns: <YgPickerColumn<Object>>[
          YgPickerColumn<T>(
            onChange: dropdownController.onValueTapped,
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
      footerButtons: YgButtonGroup.vertical(
        children: <YgButton>[
          YgButton(
            onPressed: dropdownController.submitChanges,
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }
}
