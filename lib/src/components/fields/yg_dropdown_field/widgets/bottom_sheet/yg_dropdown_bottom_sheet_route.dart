import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgDropdownBottomSheetRoute<T extends Object> extends YgBottomSheetModalRoute {
  YgDropdownBottomSheetRoute({
    required this.entries,
    required this.label,
    required this.onClose,
    required this.dropdownController,
  });

  final String label;
  final List<YgDropdownEntry<T>> entries;
  final YgDynamicDropdownController<T> dropdownController;
  final VoidCallback onClose;

  @override
  Future<RoutePopDisposition> willPop() {
    onClose();

    return super.willPop();
  }

  @override
  String get name => 'YgDropdownBottomSheetModal($label)';

  @override
  Widget buildBottomSheet(BuildContext context) {
    return YgBottomSheet(
      title: label,
      content: ListenableBuilder(
        listenable: dropdownController,
        builder: (BuildContext context, Widget? child) {
          return Column(
            children: _buildEntries(),
          );
        },
      ),
    );
  }

  List<Widget> _buildEntries() {
    final List<Widget> widgets = <Widget>[];
    final YgDynamicDropdownController<T> controller = dropdownController;

    for (final YgDropdownEntry<T> entry in entries) {
      if (controller is YgSingleSelectDropdownController<T>) {
        widgets.add(
          YgRadioListTile<T>(
            title: entry.title,
            subtitle: entry.subtitle,
            leadingWidget: entry.icon,
            groupValue: controller.value,
            value: entry.value,
            onChanged: (_) => _onEntryTapped(entry),
          ),
        );
      } else {
        widgets.add(
          YgCheckboxListTile(
            title: entry.title,
            subtitle: entry.subtitle,
            leadingWidget: entry.icon,
            onChanged: (_) => _onEntryTapped(entry),
            value: controller.isEntrySelected(entry),
          ),
        );
      }
    }

    return widgets;
  }

  void _onEntryTapped(YgDropdownEntry<T> value) {
    dropdownController.onEntryTapped(value);
  }
}
