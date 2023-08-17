import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgDropdownBottomSheetRoute<T extends Object> extends YgBottomSheetModalRoute {
  YgDropdownBottomSheetRoute({
    required this.entries,
    required this.label,
    required this.onChange,
    required this.onClose,
    required this.currentValue,
    required this.allowDeselect,
  });

  final String label;
  final List<YgDropdownEntry<T>> entries;
  final ValueChanged<T?> onChange;
  final VoidCallback onClose;
  final T? currentValue;
  final bool allowDeselect;

  @override
  Widget buildBottomSheet(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        onClose();

        return true;
      },
      child: YgBottomSheet(
        title: label,
        content: Column(
          children: _buildEntries(),
        ),
      ),
    );
  }

  List<Widget> _buildEntries() {
    final List<Widget> widgets = <Widget>[];

    for (final YgDropdownEntry<T> entry in entries) {
      final YgIcon? icon = entry.icon;

      final bool selected = currentValue == entry.value;

      widgets.add(
        YgListTile(
          title: entry.title,
          subtitle: entry.subtitle,
          leadingWidgets: <Widget>[
            if (icon != null) icon,
          ],
          trailingWidgets: <Widget>[
            if (selected)
              const YgIcon(
                YgIcons.check,
              ),
          ],
          onTap: () {
            if (!selected) {
              _handleNewValue(entry.value);
            } else if (allowDeselect) {
              _handleNewValue(null);
            }
          },
        ),
      );
    }

    return widgets;
  }

  void _handleNewValue(T? value) {
    onChange(value);
    Navigator.of(context).pop();
  }

  @override
  String get name => 'YgDropdownBottomSheetModal($label)';
}
