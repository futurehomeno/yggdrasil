import 'dart:io';

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/fields/yg_dropdown_field/widgets/menu/yg_dropdown_menu.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

import '../helpers/_helpers.dart';
import '../widgets/_widgets.dart';
import 'widgets/_widgets.dart';
import 'yg_dropdown_field_state.dart';

// This is really not ideal, but this is the only way to prevent us from
// polluting the exports with classes that really should be private.
part 'multi_select/yg_dropdown_field_multi_select.dart';
part 'multi_select/yg_dropdown_form_field_multi_select.dart';
part 'multi_select/yg_multi_select_dropdown_controller.dart';
part 'single_select/yg_dropdown_field_single_select.dart';
part 'single_select/yg_dropdown_form_field_single_select.dart';
part 'single_select/yg_single_select_dropdown_controller.dart';
part 'yg_dropdown_controller.dart';
part 'yg_dropdown_form_field.dart';

abstract class YgDropdownField<T extends Object> extends StatefulWidget with StatefulWidgetDebugMixin {
  /// Factory constructor for a [YgDropdownField] with a single value.
  ///
  /// See [YgDropdownField] for the documentation of every argument.
  const factory YgDropdownField({
    bool allowDeselect,
    YgSingleSelectDropdownController<T>? controller,
    bool disabled,
    YgDropdownAction dropdownAction,
    required List<YgDropdownEntry<T>> entries,
    String? error,
    FocusNode? focusNode,
    T? initialValue,
    Key? key,
    required String label,
    int? maxLines,
    int? minLines,
    ValueChanged<T?>? onChange,
    ValueChanged<bool>? onFocusChanged,
    VoidCallback? onPressed,
    String? placeholder,
    YgFieldSize size,
    YgFieldVariant variant,
    YgCompleteAction completeAction,
    VoidCallback? onEditingComplete,
  }) = _YgDropdownFieldSingleSelect<T>;

  /// Factory constructor for a [YgDropdownField] with more than one value.
  ///
  /// See [YgDropdownField] for the documentation of every argument.
  const factory YgDropdownField.multiSelect({
    bool allowDeselect,
    YgMultiSelectDropdownController<T>? controller,
    bool disabled,
    YgDropdownAction dropdownAction,
    required List<YgDropdownEntry<T>> entries,
    String? error,
    FocusNode? focusNode,
    Set<T>? initialValue,
    Key? key,
    required String label,
    int? maxLines,
    int? minLines,
    ValueChanged<Set<T>>? onChange,
    ValueChanged<bool>? onFocusChanged,
    VoidCallback? onPressed,
    String? placeholder,
    YgFieldSize size,
    YgFieldVariant variant,
    YgCompleteAction completeAction,
    VoidCallback? onEditingComplete,
  }) = _YgDropdownFieldMultiSelect<T>;

  const YgDropdownField._({
    super.key,
    required this.entries,
    required this.label,
    required this.maxLines,
    this.allowDeselect = false,
    this.variant = YgFieldVariant.standard,
    this.size = YgFieldSize.large,
    this.dropdownAction = YgDropdownAction.auto,
    this.completeAction = YgCompleteAction.unfocus,
    this.focusNode,
    this.error,
    this.disabled = false,
    this.placeholder,
    this.minLines,
    this.onFocusChanged,
    this.onPressed,
    this.controller,
    this.onEditingComplete,
  });

  /// The variant of the field.
  final YgFieldVariant variant;

  /// The size of the field.
  final YgFieldSize size;

  /// The dropdown entries.
  ///
  /// These will be rendered as either [YgListTile]s in a [YgBottomSheet] or as
  /// menu entries.
  final List<YgDropdownEntry<T>> entries;

  /// Controls the focus of the widget.
  final FocusNode? focusNode;

  /// The error to display under the dropdown field.
  ///
  /// Will change the styling of the widget to reflect the presence of the error.
  /// Must be null when there is no error, an empty string is still seen as an
  /// valid error.
  final String? error;

  /// The label shown on top of the dropdown field.
  final String label;

  /// The placeholder shown in the dropdown field.
  ///
  /// Gets replaced with the value entered by the user if the value is not empty.
  final String? placeholder;

  /// The minimum number of lines to occupy when the content spans fewer lines.
  ///
  /// This affects the height of the field itself and does not limit the number
  /// of values that can be selected at once.
  ///
  /// If this is null (default), value container starts with enough vertical space
  /// for one line and grows to accommodate additional values as they are selected.
  ///
  /// This can be used in combination with [maxLines] for a varying set of behaviors.
  ///
  /// If the value is set, it must be greater than zero. If the value is greater
  /// than 1, [maxLines] should also be set to either null or greater than
  /// this value.
  ///
  /// When [maxLines] is set as well, the height will grow between the indicated
  /// range of lines. When [maxLines] is null, it will grow as high as needed,
  /// starting from [minLines].
  final int? minLines;

  /// The maximum number of lines to show at one time, wrapping if necessary.
  ///
  /// This affects the height of the field itself and does not limit the number
  /// of values that can be selected at once.
  ///
  /// If this is null, there is no limit to the number of lines, and the text
  /// container will start with enough vertical space for one line and
  /// automatically grow to accommodate additional values as they are selected, up
  /// to the height of its constraints.
  ///
  /// If this is not null, the value must be greater than zero, and it will lock
  /// the dropdown field to the given number of lines and take up enough horizontal space
  /// to accommodate that number of lines. Setting [minLines] as well allows the
  /// dropdown field to grow and shrink between the indicated range.
  final int? maxLines;

  /// Whether the dropdown field is disabled.
  ///
  /// Applies styling for the disabled dropdown field. Also disables all interaction.
  final bool disabled;

  /// Whether the value can be deselected by pressing it again.
  final bool allowDeselect;

  /// The action that should be performed when the user presses the dropdown.
  ///
  /// By default checks the platform and will show a [YgBottomSheet] for mobile
  /// devices and a menu for other devices.
  final YgDropdownAction dropdownAction;

  /// Called when the widget gains or loses focus
  final ValueChanged<bool>? onFocusChanged;

  /// Called when the user presses the dropdown.
  final VoidCallback? onPressed;

  /// Controls the value of the dropdown and can open or close the dropdown.
  ///
  /// When defined will overwrite the [initialValue].
  final YgDynamicDropdownController<T>? controller;

  /// The action to perform when the user completes editing the field.
  ///
  /// By default [YgCompleteAction.unfocus].
  final YgCompleteAction completeAction;

  /// Called when the dropdown is closed.
  ///
  /// Overrides the completeAction.
  final VoidCallback? onEditingComplete;

  @override
  YgDebugType get debugType {
    if (disabled) {
      return YgDebugType.other;
    }

    return YgDebugType.intractable;
  }
}

abstract class YgDropdownFieldWidgetState<T extends Object, W extends YgDropdownField<T>> extends State<W> {
  /// The current controller of the dropdown, either user specified or a default one.
  late YgDynamicDropdownController<T> _controller = widget.controller ?? createController();

  /// The current [FocusNode] of the dropdown, either user specified of a default one.
  late FocusNode _focusNode = widget.focusNode ?? FocusNode();

  /// Whether the widget is visually focused (either focused of opened).
  late bool _visuallyFocused;

  bool _menuOpened = false;

  late final YgDropdownFieldState _state = YgDropdownFieldState(
    placeholder: widget.placeholder != null,
    error: widget.error != null,
    filled: _controller.filled,
    disabled: widget.disabled,
    size: widget.size,
    variant: widget.variant,
    suffix: true,
  );

  @override
  void initState() {
    super.initState();

    _controller.addListener(_controllerListener);
    _controller._attach(this);
    _state.addListener(_handleStateChanged);
    _visuallyFocused = _state.showFocusHighlight;
  }

  @override
  void didUpdateWidget(covariant W oldWidget) {
    final YgDynamicDropdownController<T>? newController = widget.controller;
    final FocusNode? newFocusNode = widget.focusNode;

    if (newFocusNode == null) {
      if (oldWidget.focusNode != null) {
        _focusNode = FocusNode();
      }
    } else if (newFocusNode != _focusNode) {
      _focusNode = newFocusNode;
    }

    if (newController == null) {
      if (oldWidget.controller != null) {
        _updateController(createController());
      }
    } else if (newController != _controller) {
      _updateController(newController);
    }

    _state.placeholder.value = widget.placeholder != null;
    _state.error.value = widget.error != null;
    _state.disabled.value = widget.disabled;
    _state.size.value = widget.size;
    _state.variant.value = widget.variant;

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _state.removeListener(_handleStateChanged);
    _state.dispose();
    _controller.removeListener(_controllerListener);
    _controller._detach();
    if (widget.controller == null) {
      _controller.dispose();
    }

    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final YgFieldTheme theme = context.fieldTheme;

    return YgDropdownMenu<T>(
      controller: _controller,
      entries: widget.entries,
      opened: _menuOpened,
      animationCurve: theme.animationCurve,
      animationDuration: theme.animationDuration,
      padding: theme.dropdownTheme.menuToFieldPadding,
      child: _buildContent(theme),
    );
  }

  YgFieldDecoration _buildContent(YgFieldTheme theme) {
    return YgFieldDecoration(
      variant: widget.variant,
      size: widget.size,
      error: widget.error,
      state: _state,
      builder: (BuildContext context, Widget child) {
        if (widget.disabled) {
          return child;
        }

        return InkWell(
          onFocusChange: _state.focused.update,
          onHover: _state.hovered.update,
          onTap: _controller.open,
          focusNode: _focusNode,
          focusColor: Colors.transparent,
          child: child,
        );
      },
      suffix: AnimatedRotation(
        duration: theme.animationDuration,
        curve: theme.animationCurve,
        turns: _state.opened.value ? 0.5 : 0,
        child: YgIconButton(
          onPressed: widget.disabled ? null : _controller.open,
          size: YgIconButtonSize.small,
          child: const YgIcon(
            YgIcons.caretDown,
          ),
        ),
      ),
      content: YgFieldContent(
        value: ListenableBuilder(
          listenable: _controller,
          builder: _buildText,
        ),
        state: _state,
        label: widget.label,
        minLines: widget.minLines,
        placeholder: widget.placeholder,
        floatLabelOnFocus: false,
      ),
    );
  }

  Widget _buildText(BuildContext context, Widget? child) {
    final int? minLines = widget.minLines;

    final Text text = Text(
      _controller.buildTitle(widget.entries),
      maxLines: widget.maxLines,
      overflow: widget.maxLines != 1 ? null : TextOverflow.ellipsis,
    );

    if (minLines != null && minLines > 1) {
      final TextStyle style = DefaultTextStyle.of(context).style;

      return ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: style.computedHeight * minLines,
        ),
        child: text,
      );
    }

    return text;
  }

  /// Creates a default controller to be used if there is no user specified one.
  YgDynamicDropdownController<T> createController();

  void openMenu() {
    _menuOpened = true;
    _state.opened.value = true;
    setState(() {});
  }

  void openBottomSheet() {
    Navigator.of(context).push(
      YgDropdownBottomSheetRoute<T>(
        entries: widget.entries,
        label: widget.label,
        dropdownController: _controller,
        onClose: _onClosed,
      ),
    );
    _state.opened.value = true;
  }

  void open() {
    _focusNode.requestFocus();

    switch (widget.dropdownAction) {
      case YgDropdownAction.bottomSheet:
        return openBottomSheet();
      case YgDropdownAction.menu:
        return openMenu();
      case YgDropdownAction.auto:
        return _performPlatformAction();
      case YgDropdownAction.none:
        return;
    }
  }

  void close() {
    if (_menuOpened) {
      _menuOpened = false;
      setState(() {});
    } else {
      Navigator.popUntil(
        context,
        (Route<Object?> route) => route is! YgDropdownBottomSheetRoute,
      );
    }
    _onClosed();
  }

  bool get isOpen {
    return _state.opened.value;
  }

  void _onClosed() {
    _state.opened.value = false;

    final VoidCallback? onEditingComplete = widget.onEditingComplete;

    if (onEditingComplete != null) {
      onEditingComplete();

      return;
    }

    switch (widget.completeAction) {
      case YgCompleteAction.focusNext:
        _focusNode.nextFocus();
        break;
      case YgCompleteAction.focusPrevious:
        _focusNode.previousFocus();
        break;
      case YgCompleteAction.unfocus:
        _focusNode.unfocus();
        break;
      case YgCompleteAction.none:
    }
  }

  void _performPlatformAction() {
    if (Platform.isAndroid || Platform.isIOS) {
      openBottomSheet();
    } else {
      openMenu();
    }
  }

  void _updateController(YgDynamicDropdownController<T> controller) {
    _controller.removeListener(_controllerListener);
    _controller._detach();
    _controller = controller;
    _controller.addListener(_controllerListener);
    _controller._attach(this);
  }

  void _controllerListener() {
    _state.filled.value = _controller.filled;
  }

  void _handleStateChanged() {
    final bool newVisuallyFocused = _state.showFocusHighlight;
    if (_visuallyFocused != newVisuallyFocused) {
      _visuallyFocused = newVisuallyFocused;
      widget.onFocusChanged?.call(newVisuallyFocused);
    }
  }
}
