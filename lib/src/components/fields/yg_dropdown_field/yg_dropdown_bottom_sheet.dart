import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgDropdownBottomSheetRoute<T extends Object> extends YgBottomSheetModalRoute {
  YgDropdownBottomSheetRoute({
    required this.entries,
    required this.label,
    required this.onValueTapped,
    required this.isValueSelected,
    required this.onClose,
  });

  final String label;
  final List<YgDropdownEntry<T>> entries;
  final bool Function(T value) onValueTapped;
  final bool Function(T value) isValueSelected;
  final VoidCallback onClose;

  @override
  Future<RoutePopDisposition> willPop() {
    onClose();

    return super.willPop();
  }

  @override
  Widget buildBottomSheet(BuildContext context) {
    return YgBottomSheet(
      title: label,
      content: Column(
        children: _buildEntries(),
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
            if (isValueSelected(entry.value))
              const YgIcon(
                YgIcons.check,
              ),
          ],
          onTap: () => _handleNewValue(entry.value),
        ),
      );
    }

    return widgets;
  }

  void _handleNewValue(T value) {
    if (onValueTapped(value)) {
      onClose();
      Navigator.of(context).pop();
    }
  }

  @override
  String get name => 'YgDropdownBottomSheetModal($label)';
}
