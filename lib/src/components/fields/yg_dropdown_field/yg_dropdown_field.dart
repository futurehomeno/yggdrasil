import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yggdrasil/src/components/fields/enums/field_state.dart';
import 'package:yggdrasil/yggdrasil.dart';

import '../widgets/_widgets.dart';
import 'widgets/_widgets.dart';

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
    T? initialValue,
    String? error,
    int? minLines,
    String? placeholder,
    int maxLines,
    bool disabled,
    bool allowDeselect,
    YgDropdownAction dropdownAction,
    ValueChanged<T?>? onChange,
    ValueChanged<bool>? onFocusChanged,
  }) = _YgDropdownFieldSingleSelect<T>;

  const factory YgDropdownField.multiSelect({
    Key key,
    required List<YgDropdownEntry<T>> entries,
    required String label,
    YgDropdownFieldVariant variant,
    YgDropdownFieldSize size,
    FocusNode? focusNode,
    Set<T>? initialValue,
    String? error,
    int? minLines,
    String? placeholder,
    int maxLines,
    bool disabled,
    bool allowDeselect,
    YgDropdownAction dropdownAction,
    ValueChanged<Set<T>>? onChange,
    ValueChanged<bool>? onFocusChanged,
  }) = _YgDropdownFieldMultiSelect<T>;

  const YgDropdownField._({
    super.key,
    required this.entries,
    required this.label,
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
    this.onFocusChanged,
    this.onPressed,
    this.controller,
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
  final ValueChanged<bool>? onFocusChanged;
  final VoidCallback? onPressed;

  // Can safely ignore dynamic here because anywhere the controller is used
  // the type is overwritten.
  final YgDynamicDropdownController<T>? controller;
}

abstract class YgDropdownFieldState<T extends Object, W extends YgDropdownField<T>> extends State<W> {
  late YgDynamicDropdownController<T> _controller = widget.controller ?? createController();

  @override
  void didUpdateWidget(covariant W oldWidget) {
    final YgDynamicDropdownController<T>? newController = widget.controller;

    if (newController == null) {
      if (oldWidget.controller != null) {
        _updateController(createController());
      }
    } else if (newController != _controller) {
      _updateController(newController);
    }
    super.didUpdateWidget(oldWidget);
  }

  late final FieldStates _states = <FieldState>{
    if (widget.disabled) FieldState.disabled,
    if (widget.error != null) FieldState.error,
  };

  bool _opened = false;

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
            onPressed: _controller.open,
            size: YgIconButtonSize.small,
            child: const YgIcon(
              YgIcons.caretDown,
            ),
          ),
        ),
        content: YgFieldTextContent(
          value: ListenableBuilder(
            listenable: _controller,
            builder: (context, child) {
              return Text(
                _controller.buildTitle(widget.entries),
                maxLines: widget.maxLines,
                overflow: widget.maxLines != 1 ? null : TextOverflow.ellipsis,
              );
            },
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
      onShowFocusHighlight: _onFocusChanged,
      onShowHoverHighlight: (bool hovered) => _updateFieldState(FieldState.hovered, hovered),
      shortcuts: const <ShortcutActivator, Intent>{
        SingleActivator(LogicalKeyboardKey.space, control: false): ActivateIntent(),
      },
      actions: <Type, Action<Intent>>{
        ActivateIntent: CallbackAction<Intent>(onInvoke: (_) => _controller.open()),
      },
      child: GestureDetector(
        onTap: _controller.open,
        child: layout,
      ),
    );
  }

  @override
  void dispose() {
    _controller.removeListener(_controllerListener);
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _onFocusChanged(bool focused) {
    widget.onFocusChanged?.call(focused);
    _updateFieldState(FieldState.focused, focused);
  }

  void _updateFieldState(FieldState state, bool toggled) {
    final bool isToggled = _states.contains(state);
    if (isToggled != toggled) {
      if (toggled) {
        _states.add(state);
      } else {
        _states.remove(state);
      }
      setState(() {});
    }
  }

  void _updateController(YgDynamicDropdownController<T> controller) {
    _controller.removeListener(_controllerListener);
    _controller = controller;
    _controller.addListener(_controllerListener);
  }

  void _controllerListener() {
    _updateFieldState(FieldState.filled, _controller.filled);
  }

  Rect get rect {
    final RenderBox itemBox = context.findRenderObject()! as RenderBox;

    return itemBox.localToGlobal(
          Offset.zero,
          ancestor: Navigator.of(context).context.findRenderObject(),
        ) &
        itemBox.size;
  }

  // region Menu

  void openMenu() {}

  void openBottomSheet() {}

  void open() {
    switch (widget.dropdownAction) {
      case YgDropdownAction.bottomSheet:
        return openBottomSheet();
      case YgDropdownAction.menu:
        return openMenu();
      case YgDropdownAction.auto:
        return _performPlatformAction();
      case YgDropdownAction.nothing:
        return;
    }
  }

  void close() {
    Navigator.popUntil(
      context,
      (Route route) => route is! YgDropdownMenuRoute && route is! YgDropdownBottomSheetRoute,
    );
    _opened = false;
    setState(() {});
  }

  void _performPlatformAction() {
    if (Platform.isAndroid || Platform.isIOS) {
      openBottomSheet();
    } else {
      openMenu();
    }
  }

  bool get isOpen {
    return _opened;
  }

  // endregion
  YgDynamicDropdownController<T> createController();
}
