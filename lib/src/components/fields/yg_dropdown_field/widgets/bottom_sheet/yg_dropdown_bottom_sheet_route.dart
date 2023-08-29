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
        builder: (context, child) {
          return Column(
            children: _buildEntries(),
          );
        },
      ),
    );
  }

  List<Widget> _buildEntries() {
    final List<Widget> widgets = <Widget>[];

    for (final YgDropdownEntry<T> entry in entries) {
      final YgIcon? icon = entry.icon;

      widgets.add(
        YgListTile(
          title: entry.title,
          subtitle: entry.subtitle,
          leadingWidgets: <Widget>[
            if (icon != null) icon,
          ],
          trailingWidgets: <Widget>[
            if (dropdownController.isEntrySelected(entry))
              const YgIcon(
                YgIcons.check,
              ),
          ],
          onTap: () => _handleNewValue(entry),
        ),
      );
    }

    return widgets;
  }

  void _handleNewValue(YgDropdownEntry<T> value) {
    dropdownController.onEntryTapped(value);
  }
}
