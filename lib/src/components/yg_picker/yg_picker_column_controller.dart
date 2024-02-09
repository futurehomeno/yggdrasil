import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_picker/widgets/_widgets.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgPickerColumnController<T extends Object> extends ChangeNotifier {
  YgPickerColumnController({
    T? initialValue,
  }) : _value = initialValue {
    scrollController = YgFixedExtentScrollController(
      onAttach: _controllerAttached,
      onDetach: _controllerDetached,
    );
  }

  late final YgFixedExtentScrollController scrollController;
  YgPickerColumnState<T>? _column;
  T? _value;
  int _index = 0;

  T next() {
    final YgPickerColumnState<T>? column = _column;
    if (column == null) {
      throw Exception('Can not go to next value before controller is attached to Picker.');
    }

    final YgPickerColumn<T> widget = column.widget;
    final int nextIndex = _index + 1;
    if (widget.looping) {
      _animateTo(nextIndex);

      return widget.entries[_normalizeIndex(nextIndex)].value;
    }

    if (nextIndex < widget.entries.length - 1) {
      _animateTo(nextIndex);

      return widget.entries[nextIndex].value;
    }

    return value;
  }

  T previous() {
    final YgPickerColumnState<T>? column = _column;
    if (column == null) {
      throw Exception('Can not go to previous value before controller is attached to Picker.');
    }

    final YgPickerColumn<T> widget = column.widget;
    final int previousIndex = _index - 1;
    if (widget.looping) {
      _animateTo(previousIndex);

      return widget.entries[_normalizeIndex(previousIndex)].value;
    }

    if (previousIndex > 0) {
      _animateTo(previousIndex);

      return widget.entries[previousIndex].value;
    }

    return value;
  }

  T get value {
    final YgPickerColumnState<T>? column = _column;
    if (column == null) {
      throw Exception('Can not access value before controller is attached to Picker.');
    }

    return column.widget.entries[_normalizeIndex(_index)].value;
  }

  set value(T newValue) {
    final int index = _getValueIndex(newValue);
    final YgPickerColumnState<T>? column = _column;
    if (index == -1 || column == null) {
      return;
    }

    final YgPickerColumn<T> widget = column.widget;
    if (!widget.looping) {
      _animateTo(index);
    }

    final int normalizedIndex = _normalizeIndex(_index);
    final int difference = index - normalizedIndex;
    final int entryCount = widget.entries.length;
    final double halfEntryCount = entryCount / 2;

    // In a looping list the max distance to any other item is half the length
    // of a list, so if the difference is more than half the length of the
    // list we need to apply the inverted distance to find the nearest
    // instance of the entry.
    if (difference > halfEntryCount) {
      _animateTo(_index - (entryCount - difference));
    } else if (difference < -halfEntryCount) {
      _animateTo(_index + (entryCount + difference));
    } else {
      _animateTo(_index + difference);
    }
  }

  void attach(YgPickerColumnState<T> column) {
    _column = column;

    final T? value = this._value;
    if (value == null) {
      return;
    }

    _index = _getValueIndex(value);
    if (_index == -1) {
      _index = 0;
    }

    _value = column.widget.entries[_index].value;
    notifyListeners();
  }

  void detach() {
    _column = null;
  }

  @override
  void dispose() {
    detach();
    scrollController.dispose();
    super.dispose();
  }

  void _controllerAttached(ScrollPosition position) {
    position as YgFixedExtentScrollPosition;
    position.addListener(_handleScrollUpdate);
    isEditing.addListener(_handleEditingChanged);
    scheduleMicrotask(() {
      position.jumpTo(_index * position.itemExtent);
    });
  }

  void _controllerDetached(ScrollPosition position) {
    position.removeListener(_handleScrollUpdate);
    isEditing.removeListener(_handleEditingChanged);
  }

  void _handleScrollUpdate() {
    final YgPickerColumnState<T>? column = _column;
    if (scrollController.selectedItem == _index || column == null) {
      return;
    }

    final int entryCount = column.widget.entries.length;
    final int oldRolloverCount = (_index / entryCount).floor();
    final int newRolloverCount = (scrollController.selectedItem / entryCount).floor();

    _index = scrollController.selectedItem;
    _value = column.widget.entries[_normalizeIndex(_index)].value;
    notifyListeners();

    if (oldRolloverCount != newRolloverCount) {
      column.widget.onRollover?.call(newRolloverCount - oldRolloverCount);
    }

    column.widget.onChange?.call(value);
  }

  void _handleEditingChanged() {
    final YgPickerColumnState<T>? column = _column;
    if (!isEditing.value && column != null) {
      column.widget.onEditingComplete?.call(value);
    }
  }

  int _normalizeIndex(int index) {
    final YgPickerColumnState<T>? column = _column;

    if (column == null) {
      throw Exception('Can not get normalized index when controller is not attached to a picker.');
    }

    final YgPickerColumn<T> widget = column.widget;
    final int entryCount = widget.entries.length;
    if (widget.looping) {
      int normalized = index % entryCount;
      if (normalized < 0) {
        normalized += entryCount;
      }

      return normalized;
    }

    if (index > entryCount - 1) {
      return entryCount - 1;
    }

    if (index < 0) {
      return 0;
    }

    return index;
  }

  int _getValueIndex(T item) {
    final YgPickerColumnState<T>? column = _column;
    if (column == null) {
      throw Exception('Can not get value index before controller is attached to Picker.');
    }

    return column.widget.entries.indexWhere(
      (YgPickerEntry<T> entry) => entry.value == item,
    );
  }

  void _animateTo(int index) {
    // TODO(Tim): This gotta be selected from the theme somehow.
    scrollController.animateToItem(
      index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  ValueNotifier<bool> get isEditing => scrollController.position.isScrollingNotifier;

  bool get looping {
    final YgPickerColumnState<T>? column = _column;

    if (column == null) {
      throw Exception('Can not access looping before controller is attached to picker.');
    }

    return column.widget.looping;
  }
}
