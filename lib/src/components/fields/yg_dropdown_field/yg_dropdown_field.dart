import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/fields/enums/field_state.dart';
import 'package:yggdrasil/src/theme/fields/field_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

import '../widgets/_widgets.dart';
import 'yg_dropdown_bottom_sheet.dart';

class YgDropdownEntry<T extends Object> {
  YgDropdownEntry({
    required this.title,
    required this.value,
    this.subtitle,
    this.icon,
  });

  final String title;
  final T value;
  final String? subtitle;
  final YgIcon? icon;
}

class YgDropdownField<T extends Object> extends StatefulWidget {
  const YgDropdownField({
    super.key,
    required this.entries,
    required this.label,
    required this.allowDeselect,
    this.variant = YgDropdownFieldVariant.standard,
    this.size = YgDropdownFieldSize.large,
    this.focusNode,
    this.initialValue,
    this.error,
    this.disabled = false,
    this.placeholder,
    this.minLines,
    this.maxLines = 1,
  });

  final YgDropdownFieldVariant variant;
  final YgDropdownFieldSize size;
  final List<YgDropdownEntry<T>> entries;
  final FocusNode? focusNode;
  final T? initialValue;
  final String? error;
  final String label;
  final int? minLines;
  final String? placeholder;
  final int maxLines;
  final bool disabled;
  final bool allowDeselect;

  @override
  State<YgDropdownField<T>> createState() => _YgDropdownFieldState<T>();
}

class _YgDropdownFieldState<T extends Object> extends State<YgDropdownField<T>> {
  late T? _value = widget.initialValue;
  late YgDropdownEntry<T>? _selected = _getSelectedEntry();
  bool _opened = false;

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
          turns: _opened ? 0.5 : 0,
          child: const YgIcon(
            YgIcons.caretDown,
          ),
        ),
        content: YgFieldTextContent(
          value: Text(
            _selected?.title ?? '',
          ),
          states: _states,
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
      onShowFocusHighlight: (bool focused) {
        _updateFieldState(FieldState.focused, focused || _opened);
      },
      onShowHoverHighlight: (bool hovered) {
        _updateFieldState(FieldState.hovered, hovered);
      },
      child: GestureDetector(
        onTap: _openSelectMenu,
        child: layout,
      ),
    );
  }

  YgDropdownEntry<T>? _getSelectedEntry() {
    for (final YgDropdownEntry<T> entry in widget.entries) {
      if (entry.value == _value) {
        return entry;
      }
    }

    return null;
  }

  void _updateValue(T? value) {
    _value = value;
    _selected = _getSelectedEntry();

    _updateFieldState(FieldState.filled, _selected != null);

    setState(() {});
  }

  void _updateFieldState(FieldState state, bool toggled) {
    final bool isToggled = _states.contains(state);
    if (isToggled != toggled) {
      if (toggled) {
        _states.add(state);
      } else {
        _states.remove(state);
      }
    }
  }

  void _openSelectMenu() {
    Navigator.of(context).push(
      YgDropdownBottomSheetRoute<T>(
        entries: widget.entries,
        label: widget.label,
        onChange: _updateValue,
        currentValue: _value,
        allowDeselect: widget.allowDeselect,
        onClose: () {
          _opened = false;
          _updateFieldState(FieldState.focused, false);
          setState(() {});
        },
      ),
    );
    _opened = true;
    _updateFieldState(FieldState.focused, true);
    setState(() {});
  }
}
