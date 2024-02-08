import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_picker/widgets/_widgets.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgPickerController<V extends Record, P extends YgPicker<V>> {
  V get value;
  set value(V newValue);

  void attach(P picker) {}

  void detach() {}
}

typedef TripleValue<T1, T2, T3> = ({T1 value1, T2 value2, T3 value3});

class TriplePickerController<T1 extends Object, T2 extends Object, T3 extends Object> extends ChangeNotifier
    implements YgPickerController<TripleValue<T1, T2, T3>, YgPicker<TripleValue<T1, T2, T3>>> {
  TriplePickerController({
    T1? initialValue1,
    T2? initialValue2,
    T3? initialValue3,
  })  : column1 = PickerColumnController<T1>(
          initialValue: initialValue1,
        ),
        column2 = PickerColumnController<T2>(
          initialValue: initialValue2,
        ),
        column3 = PickerColumnController<T3>(
          initialValue: initialValue3,
        ) {
    column1.addListener(notifyListeners);
    column2.addListener(notifyListeners);
    column3.addListener(notifyListeners);
  }

  final PickerColumnController<T1> column1;
  final PickerColumnController<T2> column2;
  final PickerColumnController<T3> column3;

  void _handleChange() {}

  @override
  void attach() {}
}

class PickerColumnController<T extends Object> extends ChangeNotifier {
  PickerColumnController({
    T? initialValue,
  }) : _value = initialValue;

  final YgFixedExtentScrollController scrollController = YgFixedExtentScrollController();

  YgPickerColumn<T>? _column;
  T? _value;
  int _index = 0;

  T next() {
    final YgPickerColumn<T>? column = _column;
    if (column == null) {
      throw Exception('Can not go to next value before controller is attached to Picker.');
    }

    final int nextIndex = _index + 1;
    if (column.looping) {
      _animateTo(nextIndex);

      return column.entries[_normalizeIndex(nextIndex)].value;
    }

    if (nextIndex < column.entries.length - 1) {
      _animateTo(nextIndex);

      return column.entries[nextIndex].value;
    }

    return value;
  }

  T previous() {
    final YgPickerColumn<T>? column = _column;
    if (column == null) {
      throw Exception('Can not go to previous value before controller is attached to Picker.');
    }

    final int previousIndex = _index - 1;
    if (column.looping) {
      _animateTo(previousIndex);

      return column.entries[_normalizeIndex(previousIndex)].value;
    }

    if (previousIndex > 0) {
      _animateTo(previousIndex);

      return column.entries[previousIndex].value;
    }

    return value;
  }

  T get value {
    final YgPickerColumn<T>? column = _column;
    if (column == null) {
      throw Exception('Can not access value before controller is attached to Picker.');
    }

    return column.entries[_normalizeIndex(_index)].value;
  }

  set value(T newValue) {
    final int index = _getValueIndex(newValue);
    final YgPickerColumn<T>? column = _column;
    if (index == -1 || column == null) {
      return;
    }

    if (!column.looping) {
      _animateTo(index);
    }

    final int normalizedIndex = _normalizeIndex(_index);
    final int difference = index - normalizedIndex;
    final int entryCount = column.entries.length;
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

  void attach(YgPickerColumn<T> column) {
    _column = column;

    final T? value = this._value;
    if (value == null) {
      return;
    }

    final int index = _getValueIndex(value);

    if (index == -1) {
      _value = column.entries.first.value;
      notifyListeners();

      return;
    }

    scrollController.jumpToItem(index);
    scrollController.addListener(_handleScrollUpdate);
  }

  void detach() {
    final YgPickerColumn<T>? column = _column;

    scrollController.removeListener(_handleScrollUpdate);
    if (column == null) {
      return;
    }

    _column = null;
  }

  int _normalizeIndex(int index) {
    final YgPickerColumn<T>? column = _column;

    if (column == null) {
      throw Exception('Can not get normalized index when controller is not attached to a picker.');
    }

    final int entryCount = column.entries.length;
    if (column.looping) {
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
    final YgPickerColumn<T>? column = _column;
    if (column == null) {
      throw Exception('Can not get value index before controller is attached to Picker.');
    }

    return column.entries.indexWhere(
      (YgPickerEntry<T> entry) => entry.value == item,
    );
  }

  void _handleScrollUpdate() {
    final YgPickerColumn<T>? column = _column;
    if (scrollController.selectedItem != _index && column != null) {
      _index = scrollController.selectedItem;
      _value = column.entries[_normalizeIndex(_index)].value;
    }
  }

  void _animateTo(int index) {
    // TODO(Tim): This gotta be selected from the theme somehow.
    scrollController.animateToItem(
      index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  bool get isAnimating => scrollController.position.isScrollingNotifier.value;

  bool get looping {
    final YgPickerColumn<T>? column = _column;

    if (column == null) {
      throw Exception('Can not access looping before controller is attached to picker.');
    }

    return column.looping;
  }
}
