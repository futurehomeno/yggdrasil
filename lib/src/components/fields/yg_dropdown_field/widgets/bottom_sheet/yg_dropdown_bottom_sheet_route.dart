import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

part 'yg_dropdown_bottom_sheet_content.dart';

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
