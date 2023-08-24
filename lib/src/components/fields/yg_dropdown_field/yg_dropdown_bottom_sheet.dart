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
  String get name => 'YgDropdownBottomSheetModal($label)';

  @override
  Widget buildBottomSheet(BuildContext context) {
    return YgBottomSheet(
      title: label,
      content: _YgDropdownBottomSheetContent<T>(
        entries: entries,
        isValueSelected: isValueSelected,
        onClose: onClose,
        onValueTapped: onValueTapped,
      ),
    );
  }
}

class _YgDropdownBottomSheetContent<T extends Object> extends StatefulWidget {
  const _YgDropdownBottomSheetContent({
    required this.entries,
    required this.isValueSelected,
    required this.onClose,
    required this.onValueTapped,
  });

  final List<YgDropdownEntry<T>> entries;
  final bool Function(T value) onValueTapped;
  final bool Function(T value) isValueSelected;
  final VoidCallback onClose;

  @override
  State<_YgDropdownBottomSheetContent<T>> createState() => _YgDropdownBottomSheetContentState<T>();
}

class _YgDropdownBottomSheetContentState<T extends Object> extends State<_YgDropdownBottomSheetContent<T>> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: _buildEntries(),
    );
  }

  List<Widget> _buildEntries() {
    final List<Widget> widgets = <Widget>[];

    for (final YgDropdownEntry<T> entry in widget.entries) {
      final YgIcon? icon = entry.icon;

      widgets.add(
        YgListTile(
          title: entry.title,
          subtitle: entry.subtitle,
          leadingWidgets: <Widget>[
            if (icon != null) icon,
          ],
          trailingWidgets: <Widget>[
            if (widget.isValueSelected(entry.value))
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
    if (widget.onValueTapped(value)) {
      widget.onClose();
      Navigator.of(context).pop();
    }
    setState(() {});
  }
}
