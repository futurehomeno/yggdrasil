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

    // TODO(DEV-2458): Find alternative way to intercept willPop.
    // ignore: deprecated_member_use
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
      YgIcon? icon;

      if (entry.icon != null) {
        icon = YgIcon(entry.icon);
      }

      if (controller is YgSingleSelectDropdownController<T>) {
        widgets.add(
          YgRadioListTile<T>(
            title: entry.title,
            subtitle: entry.subtitle,
            leadingWidget: icon,
            groupValue: controller.value,
            value: entry.value,
            onChanged: (_) => dropdownController.onValueTapped(entry.value),
          ),
        );
      } else {
        widgets.add(
          YgCheckboxListTile(
            title: entry.title,
            subtitle: entry.subtitle,
            leadingWidget: icon,
            onChanged: (_) => dropdownController.onValueTapped(entry.value),
            value: controller.isValueSelected(entry.value),
          ),
        );
      }
    }

    return widgets;
  }
}
