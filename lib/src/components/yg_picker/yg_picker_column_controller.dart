part of 'yg_picker_column.dart';

/// Controls the value of a [YgPickerColumn].
class YgPickerColumnController<T extends Object> extends ChangeNotifier {
  YgPickerColumnController({
    T? initialValue,
  }) : _value = initialValue {
    _scrollController = YgFixedExtentScrollController(
      onAttach: _controllerAttached,
      onDetach: _controllerDetached,
    );
  }

  late final YgFixedExtentScrollController _scrollController;
  _YgPickerColumnState<T>? _column;
  T? _value;
  int _index = 0;
  int _targetIndex = 0;
  bool _isAnimating = false;

  /// Moves the [YgPicker] to the next value.
  T next() {
    final _YgPickerColumnState<T>? column = _column;
    if (column == null) {
      throw Exception('Can not go to next value before controller is attached to Picker.');
    }
    final YgPickerColumn<T> widget = column.widget;

    final int nextIndex = _clampIndex((_isAnimating ? _targetIndex : _index) + 1);
    if (_targetIndex == nextIndex) {
      return widget.entries[_normalizeIndex(nextIndex)].value;
    }

    _animateTo(nextIndex);

    return value;
  }

  /// Moves the [YgPicker] to the previous value.
  T previous() {
    final _YgPickerColumnState<T>? column = _column;
    if (column == null) {
      throw Exception('Can not go to previous value before controller is attached to Picker.');
    }

    final YgPickerColumn<T> widget = column.widget;
    final int previousIndex = _clampIndex((_isAnimating ? _targetIndex : _index) - 1);
    if (_targetIndex == previousIndex) {
      return widget.entries[_normalizeIndex(previousIndex)].value;
    }

    _animateTo(previousIndex);

    return value;
  }

  /// The current value of the [YgPicker].
  ///
  /// When set animates to the new value, this means [value] will only reflect
  /// the change as soon as the animation is done.
  T get value {
    final T? value = _value;
    if (value == null) {
      throw Exception('Can not access value before controller is attached to Picker.');
    }

    return value;
  }

  set value(T newValue) {
    final int index = _getValueIndex(newValue);
    final _YgPickerColumnState<T>? column = _column;
    if (index == -1 || column == null) {
      return;
    }

    final YgPickerColumn<T> widget = column.widget;
    if (!widget.looping) {
      _animateTo(index);
    }

    // Calculate the difference between the target index and the normalized
    // current index, and determine the halfway point of the entries list for
    // animation direction.
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

  void _attach(_YgPickerColumnState<T> column) {
    _column = column;

    final T? value = this._value;
    if (value == null) {
      return;
    }

    /// If the current value can not be found in the column, select the first
    /// value instead.
    _index = _getValueIndex(value);
    if (_index == -1) {
      _index = 0;
    }

    _value = column.widget.entries[_index].value;
    notifyListeners();
  }

  void _detach() {
    _index = _normalizeIndex(_index);
    _column = null;
  }

  @override
  void dispose() {
    _detach();
    _scrollController.dispose();
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
    final _YgPickerColumnState<T>? column = _column;

    if (_scrollController.selectedItem == _index || column == null) {
      return;
    }

    // Calculate the rollover counts for the old and new selected items. This
    // has to happen before the _index is reassigned.
    final int entryCount = column.widget.entries.length;
    final int oldRolloverCount = (_index / entryCount).floor();
    final int newRolloverCount = (_scrollController.selectedItem / entryCount).floor();

    // Update the index and value, and notify listeners.
    _index = _scrollController.selectedItem;
    _value = column.widget.entries[_normalizeIndex(_index)].value;
    notifyListeners();

    // If the rollover count has changed, call the onRollover callback.
    if (oldRolloverCount != newRolloverCount) {
      column.widget.onRollover?.call(newRolloverCount - oldRolloverCount);
    }

    column.widget.onChange?.call(value);
  }

  void _handleEditingChanged() {
    final _YgPickerColumnState<T>? column = _column;
    if (!isEditing.value && column != null) {
      column.widget.onEditingComplete?.call(value);
    }
  }

  int _normalizeIndex(int index) {
    final _YgPickerColumnState<T>? column = _column;

    if (column == null) {
      throw Exception('Can not get normalized index when controller is not attached to a picker.');
    }

    final YgPickerColumn<T> widget = column.widget;
    final int entryCount = widget.entries.length;

    // If the widget is looping, normalize the index by looping around to the
    // beginning.
    if (widget.looping) {
      int normalized = index % entryCount;
      if (normalized < 0) {
        normalized += entryCount;
      }

      return normalized;
    }

    // If the widget is not looping, clamp the index to the bounds of the
    // entries list.
    if (index > entryCount - 1) {
      return entryCount - 1;
    }
    if (index < 0) {
      return 0;
    }

    return index;
  }

  int _clampIndex(int index) {
    final _YgPickerColumnState<T>? column = _column;
    if (column == null) {
      throw Exception('Can not clamp index before controller is attached to Picker.');
    }

    final YgPickerColumn<T> widget = column.widget;

    if (widget.looping) {
      return index;
    }

    return index.clamp(0, widget.entries.length - 1);
  }

  int _getValueIndex(T item) {
    final _YgPickerColumnState<T>? column = _column;
    if (column == null) {
      throw Exception('Can not get value index before controller is attached to Picker.');
    }

    return column.widget.entries.indexWhere(
      (YgPickerEntry<T> entry) => entry.value == item,
    );
  }

  void _animateTo(int index) async {
    final YgPickerTheme theme = _column!.context.pickerTheme;

    _targetIndex = index;
    _isAnimating = true;
    await _scrollController.animateToItem(
      index,
      duration: theme.animationDuration,
      curve: theme.animationCurve,
    );
    _isAnimating = false;
  }

  /// A [ValueNotifier] which value indicates whether the value is being edited.
  ValueNotifier<bool> get isEditing => _scrollController.position.isScrollingNotifier;

  /// Whether this column loops back around.
  bool get looping {
    final _YgPickerColumnState<T>? column = _column;

    if (column == null) {
      throw Exception('Can not access looping before controller is attached to picker.');
    }

    return column.widget.looping;
  }
}
