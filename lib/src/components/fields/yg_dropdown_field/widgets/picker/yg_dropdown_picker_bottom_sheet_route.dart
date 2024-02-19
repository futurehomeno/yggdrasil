import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgDropdownPickerBottomSheetRoute<T extends Object> extends YgBottomSheetModalRoute {
  YgDropdownPickerBottomSheetRoute({
    required this.entries,
    required this.label,
    required this.onClose,
    required this.dropdownController,
  });

  final String label;
  final List<YgDropdownEntry<T>> entries;
  final YgSingleSelectDropdownController<T> dropdownController;
  final VoidCallback onClose;

  @override
  void onPopInvoked(bool didPop) {
    if (!didPop) {
      return;
    }

    onClose();
  }

  @override
  String get name => 'YgDropdownPickerBottomSheetRoute($label)';

  @override
  Widget buildBottomSheet(BuildContext context) {
    return YgDropdownPicker<T>(
      dropdownController: dropdownController,
      entries: entries,
      label: label,
    );
  }
}

class YgDropdownPicker<T extends Object> extends StatefulWidget {
  const YgDropdownPicker({
    super.key,
    required this.entries,
    required this.dropdownController,
    required this.label,
  });

  final List<YgDropdownEntry<T>> entries;
  final YgSingleSelectDropdownController<T> dropdownController;
  final String label;

  @override
  State<YgDropdownPicker<T>> createState() => _YgDropdownPickerState<T>();
}

class _YgDropdownPickerState<T extends Object> extends State<YgDropdownPicker<T>> {
  late final YgPickerColumnController<T> _pickerColumnController = YgPickerColumnController<T>(
    initialValue: widget.dropdownController.value,
  );

  @override
  void dispose() {
    _pickerColumnController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YgBottomSheet(
      title: widget.label,
      content: YgPicker(
        columns: <YgPickerColumn<Object>>[
          YgPickerColumn<T>(
            controller: _pickerColumnController,
            entries: widget.entries
                .map(
                  (YgDropdownEntry<T> entry) => YgPickerEntry<T>(
                    title: entry.title,
                    value: entry.value,
                  ),
                )
                .toList(),
          ),
        ],
      ),
      footerButtons: YgButtonGroup.vertical(
        children: <YgButton>[
          YgButton(
            onPressed: _onSubmit,
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }

  void _onSubmit() {
    widget.dropdownController.onValueTapped(
      _pickerColumnController.value,
    );
  }
}
