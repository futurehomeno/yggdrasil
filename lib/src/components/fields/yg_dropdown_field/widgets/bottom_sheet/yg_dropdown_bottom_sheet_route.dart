import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgDropdownBottomSheetRoute<T extends Object> extends YgBottomSheetModalRoute {
  YgDropdownBottomSheetRoute({
    required this.entries,
    required this.label,
    required this.metric,
    required this.onClose,
    required this.dropdownController,
  });

  final String label;
  final String? metric;
  final List<YgDropdownEntry<T>> entries;
  final YgAnyDropdownController<T> dropdownController;
  final VoidCallback onClose;

  @override
  void onPopInvoked(bool didPop) {
    if (!didPop) {
      return;
    }

    onClose();
    dropdownController.discardChanges();
  }

  @override
  String get name => 'YgDropdownBottomSheetModal($label)';

  @override
  Widget buildBottomSheet(BuildContext context) {
    return YgBottomSheet(
      title: label,
      content: ListenableBuilder(
        listenable: dropdownController.pendingValue,
        builder: (BuildContext context, Widget? child) {
          return Column(
            children: _buildEntries(),
          );
        },
      ),
      footerButtons: _maybeBuildFooter(),
    );
  }

  List<Widget> _buildEntries() {
    final List<Widget> widgets = <Widget>[];
    final YgAnyDropdownController<T> controller = dropdownController;

    for (final YgDropdownEntry<T> entry in entries) {
      YgIcon? icon;

      if (entry.icon != null) {
        icon = YgIcon(entry.icon);
      }

      if (controller is YgSingleSelectDropdownController<T>) {
        widgets.add(
          YgRadioListTile<T>(
            title: entry.titleWithMetric(metric),
            subtitle: entry.subtitle,
            leadingWidget: icon,
            groupValue: controller.value,
            value: entry.value,
            onChanged: (_) => dropdownController.onValueTapped(
              entry.value,
              submit: true,
              close: true,
            ),
          ),
        );
      } else {
        widgets.add(
          YgCheckboxListTile(
            title: entry.titleWithMetric(metric),
            subtitle: entry.subtitle,
            leadingWidget: icon,
            onChanged: (_) => dropdownController.onValueTapped(entry.value),
            value: controller.isValuePendingSelected(entry.value),
          ),
        );
      }
    }

    return widgets;
  }

  YgButtonGroup? _maybeBuildFooter() {
    final YgAnyDropdownController<T> controller = dropdownController;

    if (controller is! YgMultiSelectDropdownController<T>) {
      return null;
    }

    return YgButtonGroup.vertical(
      children: <YgButton>[
        YgButton(
          onPressed: () => controller.submitChanges(close: true),
          child: Text(DefaultYggdrasilLocalizations.current.dropdownDone),
        ),
      ],
    );
  }
}
