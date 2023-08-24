import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yggdrasil/src/components/fields/enums/field_state.dart';
import 'package:yggdrasil/yggdrasil.dart';

import './widgets/_widgets.dart';
import '../widgets/_widgets.dart';

part 'yg_dropdown_field_multi_select.dart';
part 'yg_dropdown_field_single_select.dart';

abstract class YgDropdownField<T extends Object> extends StatefulWidget {
  const factory YgDropdownField({
    Key key,
    required List<YgDropdownEntry<T>> entries,
    required String label,
    YgDropdownFieldVariant variant,
    YgDropdownFieldSize size,
    FocusNode? focusNode,
    T initialValue,
    String? error,
    int? minLines,
    String? placeholder,
    int maxLines,
    bool disabled,
    bool allowDeselect,
    YgDropdownAction dropdownAction,
    ValueChanged<T?>? onChange,
  }) = _YgDropdownFieldSingleSelect<T>;

  const factory YgDropdownField.multiSelect({
    Key key,
    required List<YgDropdownEntry<T>> entries,
    required String label,
    YgDropdownFieldVariant variant,
    YgDropdownFieldSize size,
    FocusNode? focusNode,
    Set<T> initialValue,
    String? error,
    int? minLines,
    String? placeholder,
    int maxLines,
    bool disabled,
    bool allowDeselect,
    YgDropdownAction dropdownAction,
    ValueChanged<Set<T>>? onChange,
  }) = _YgDropdownFieldMultiSelect<T>;

  const YgDropdownField._({
    super.key,
    required this.entries,
    required this.label,
    required this.multiSelect,
    required this.maxLines,
    this.allowDeselect = false,
    this.variant = YgDropdownFieldVariant.standard,
    this.size = YgDropdownFieldSize.large,
    this.dropdownAction = YgDropdownAction.auto,
    this.focusNode,
    this.error,
    this.disabled = false,
    this.placeholder,
    this.minLines,
  });

  final YgDropdownFieldVariant variant;
  final YgDropdownFieldSize size;
  final List<YgDropdownEntry<T>> entries;
  final FocusNode? focusNode;
  final String? error;
  final String label;
  final int? minLines;
  final String? placeholder;
  final int? maxLines;
  final bool disabled;
  final bool allowDeselect;
  final YgDropdownAction dropdownAction;
  final bool multiSelect;
}

abstract class _YgDropdownFieldState<T extends Object, W extends YgDropdownField<T>> extends State<W> {
  late final FieldStates _states = <FieldState>{
    if (widget.disabled) FieldState.disabled,
    if (widget.error != null) FieldState.error,
  };

  @override
  Widget build(BuildContext context) {
    final YgFieldTheme theme = context.fieldTheme;

    final Widget layout = RepaintBoundary(
      child: YgFieldDecoration(
        outlined: widget.variant == YgDropdownFieldVariant.outlined,
        large: widget.size == YgDropdownFieldSize.large,
        error: widget.error,
        states: _states,
        suffix: AnimatedRotation(
          duration: theme.animationDuration,
          curve: theme.animationCurve,
          turns: _states.opened ? 0.5 : 0,
          child: YgIconButton(
            onPressed: () => _open(),
            size: YgIconButtonSize.small,
            child: const YgIcon(
              YgIcons.caretDown,
            ),
          ),
        ),
        content: YgFieldTextContent(
          value: Text(
            title,
            maxLines: widget.maxLines,
            overflow: widget.maxLines != 1 ? null : TextOverflow.ellipsis,
          ),
          states: _states.without(FieldState.focused),
          label: widget.label,
          minLines: widget.minLines,
          placeholder: widget.placeholder,
        ),
      ),
    );

    if (widget.disabled) {
      return layout;
    }

    return FocusableActionDetector(
      mouseCursor: SystemMouseCursors.click,
      focusNode: widget.focusNode,
      onShowFocusHighlight: (bool focused) => updateFieldState(FieldState.focused, focused),
      onShowHoverHighlight: (bool hovered) => updateFieldState(FieldState.hovered, hovered),
      shortcuts: const <ShortcutActivator, Intent>{
        SingleActivator(LogicalKeyboardKey.space, control: false): ActivateIntent(),
      },
      actions: <Type, Action<Intent>>{
        ActivateIntent: CallbackAction<Intent>(onInvoke: (_) => _open()),
      },
      child: GestureDetector(
        onTap: _open,
        child: layout,
      ),
    );
  }

  void updateFieldState(FieldState state, bool toggled) {
    final bool isToggled = _states.contains(state);
    if (isToggled != toggled) {
      if (toggled) {
        _states.add(state);
      } else {
        _states.remove(state);
      }
    }
    setState(() {});
  }

  void _showMenu() {
    final RenderBox itemBox = context.findRenderObject()! as RenderBox;
    final Rect itemRect = itemBox.localToGlobal(
          Offset.zero,
          ancestor: Navigator.of(context).context.findRenderObject(),
        ) &
        itemBox.size;

    Navigator.of(context).push(
      YgDropdownMenuRoute<T>(
        entries: widget.entries,
        onValueTapped: onValueTapped,
        isValueSelected: isValueSelected,
        rect: itemRect,
        onClose: () => updateFieldState(FieldState.opened, false),
      ),
    );
    updateFieldState(FieldState.opened, true);
  }

  void _showBottomSheet() {
    Navigator.of(context).push(
      YgDropdownBottomSheetRoute<T>(
        entries: widget.entries,
        label: widget.label,
        onValueTapped: onValueTapped,
        isValueSelected: isValueSelected,
        onClose: () => updateFieldState(FieldState.opened, false),
      ),
    );
    updateFieldState(FieldState.opened, true);
  }

  void _performPlatformAction() {
    if (Platform.isAndroid || Platform.isIOS) {
      _showBottomSheet();
    } else {
      _showMenu();
    }
  }

  void _open() {
    switch (widget.dropdownAction) {
      case YgDropdownAction.bottomSheet:
        return _showBottomSheet();
      case YgDropdownAction.menu:
        return _showMenu();
      case YgDropdownAction.auto:
        return _performPlatformAction();
      case YgDropdownAction.nothing:
        return;
    }
  }

  bool isValueSelected(T value);

  bool onValueTapped(T value);

  String get title;
}

class _YgDropdownFieldMultiSelectState<T extends Object>
    extends _YgDropdownFieldState<T, _YgDropdownFieldMultiSelect<T>> {
  late final Set<T> _values = widget.initialValue ?? <T>{};

  @override
  bool isValueSelected(T value) => _values.contains(value);

  @override
  bool onValueTapped(T value) {
    if (_values.contains(value)) {
      if (widget.allowDeselect) {
        _values.remove(value);
        _onChange();
      }
    } else {
      _values.add(value);
      _onChange();
    }

    return false;
  }

  @override
  String get title {
    final List<String> titles = <String>[];

    for (final YgDropdownEntry<T> entry in widget.entries) {
      if (_values.contains(entry.value)) {
        titles.add(entry.title);
      }
    }

    return titles.join(', ');
  }

  void _onChange() {
    widget.onChange?.call(_values);
    updateFieldState(FieldState.filled, _values.isNotEmpty);
    setState(() {});
  }
}

class _YgDropdownFieldSingleSelectState<T extends Object>
    extends _YgDropdownFieldState<T, _YgDropdownFieldSingleSelect<T>> {
  late T? _value = widget.initialValue;

  @override
  bool isValueSelected(T value) => value == _value;

  @override
  bool onValueTapped(T value) {
    if (value == _value) {
      if (widget.allowDeselect) {
        _value = null;
        _onChange();

        return true;
      }
    } else {
      _value = value;
      _onChange();

      return true;
    }

    return false;
  }

  void _onChange() {
    widget.onChange?.call(_value);
    updateFieldState(FieldState.filled, _value != null);
    setState(() {});
  }

  @override
  String get title {
    if (_value == null) {
      return '';
    }

    for (final YgDropdownEntry<T> entry in widget.entries) {
      if (entry.value == _value) {
        return entry.title;
      }
    }

    return '';
  }
}
