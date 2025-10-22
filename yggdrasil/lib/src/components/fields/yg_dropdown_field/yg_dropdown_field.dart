import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
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

/// Implementation of the Yggdrasil dropdown.
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
    String? metric,
    FocusNode? focusNode,
    T? initialValue,
    Key? key,
    required String label,
    int? maxLines,
    int? minLines,
    ValueChanged<T?>? onChanged,
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
    String? metric,
    FocusNode? focusNode,
    Set<T>? initialValue,
    Key? key,
    required String label,
    int? maxLines,
    int? minLines,
    ValueChanged<Set<T>>? onChanged,
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
    this.metric,
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

  /// The metric shown behind the label and entry titles.
  final String? metric;

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
  final YgAnyDropdownController<T>? controller;

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

typedef _YgDropdownControllerManager<T extends Object> =
    YgControllerManager<YgDropdownController<T, Object?, YgDropdownFieldWidgetState<T, YgDropdownField<T>>>>;

abstract class YgDropdownFieldWidgetState<T extends Object, W extends YgDropdownField<T>>
    extends StateWithYgState<W, YgDropdownFieldState>
    with YgControllerManagerMixin {
  /// Manages the controller of this widget.
  late final _YgDropdownControllerManager<T> _controllerManager = manageController(
    createController: createController,
    getUserController: () => widget.controller,
    listener: _controllerListener,
  );

  /// Manages the [FocusNode] of this widget.
  late final YgControllerManager<FocusNode> _focusNodeManager = manageController(
    createController: () => FocusNode(),
    getUserController: () => widget.focusNode,
  );

  /// Whether the widget is visually focused (either focused of opened).
  late bool _visuallyFocused;

  @override
  YgDropdownFieldState createState() {
    return YgDropdownFieldState(
      filled: _controllerManager.value.filled,
      placeholder: widget.placeholder != null,
      error: widget.error != null,
      disabled: widget.disabled,
      size: widget.size,
      variant: widget.variant,
      suffix: true,
    );
  }

  @override
  void updateState() {
    state.placeholder.value = widget.placeholder != null;
    state.error.value = widget.error != null;
    state.disabled.value = widget.disabled;
    state.size.value = widget.size;
    state.variant.value = widget.variant;
  }

  @override
  void initState() {
    super.initState();

    state.addListener(_handleStateChanged);
    _visuallyFocused = state.showFocusHighlight;
  }

  @override
  void dispose() {
    state.removeListener(_handleStateChanged);
    super.dispose();
  }

  void _handleStateChanged() {
    final bool newVisuallyFocused = state.showFocusHighlight;
    if (_visuallyFocused != newVisuallyFocused) {
      _visuallyFocused = newVisuallyFocused;
      widget.onFocusChanged?.call(newVisuallyFocused);
    }
  }

  @override
  Widget build(BuildContext context) {
    final YgFieldTheme theme = context.fieldTheme;
    final YgAnyDropdownController<T> controller = _controllerManager.value;

    return YgFieldDecoration(
      error: widget.error,
      state: state,
      builder: (BuildContext context, Widget child) {
        if (widget.disabled) {
          return child;
        }

        return InkWell(
          onFocusChange: state.focused.update,
          onHover: state.hovered.update,
          onTap: controller.open,
          focusNode: _focusNodeManager.value,
          focusColor: Colors.transparent,
          child: child,
        );
      },
      suffix: AnimatedRotation(
        duration: theme.animationDuration,
        curve: theme.animationCurve,
        turns: state.opened.value ? 0.5 : 0,
        child: YgIconButton(
          onPressed: widget.disabled ? null : controller.open,
          size: YgIconButtonSize.small,
          icon: YgIcons.caretDown,
        ),
      ),
      content: YgFieldContent(
        value: ListenableBuilder(
          listenable: controller,
          builder: _buildText,
        ),
        state: state,
        label: widget.label,
        minLines: widget.minLines,
        placeholder: widget.placeholder,
        floatLabelOnFocus: false,
      ),
      counter: null,
    );
  }

  Widget _buildText(BuildContext context, Widget? child) {
    final int? minLines = widget.minLines;

    final Text text = Text(
      _controllerManager.value.buildTitle(widget.entries),
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
  YgAnyDropdownController<T> createController();

  void openMenu() {
    final RenderBox itemBox = context.findRenderObject()! as RenderBox;
    final Rect itemRect =
        itemBox.localToGlobal(
          Offset.zero,
          ancestor: Navigator.of(context).context.findRenderObject(),
        ) &
        itemBox.size;

    Navigator.of(context).push(
      YgDropdownMenuRoute<T>(
        entries: widget.entries,
        dropdownController: _controllerManager.value,
        rect: itemRect,
        onClose: _onClosed,
        metric: widget.metric,
      ),
    );
    state.opened.value = true;
  }

  void openBottomSheet() {
    Navigator.of(context).push(
      YgDropdownBottomSheetRoute<T>(
        metric: widget.metric,
        entries: widget.entries,
        label: widget.label,
        dropdownController: _controllerManager.value,
        onClose: _onClosed,
      ),
    );
    state.opened.value = true;
  }

  void openPickerBottomSheet() {
    final YgAnyDropdownController<T> controller = _controllerManager.value;

    if (controller is! YgSingleSelectDropdownController<T>) {
      _performPlatformAction(picker: false);

      return;
    }

    Navigator.of(context).push(
      YgDropdownPickerBottomSheetRoute<T>(
        entries: widget.entries,
        metric: widget.metric,
        label: widget.label,
        dropdownController: controller,
        onClose: _onClosed,
      ),
    );
    state.opened.value = true;
  }

  void open() {
    _focusNodeManager.value.requestFocus();
    widget.onPressed?.call();

    switch (widget.dropdownAction) {
      case YgDropdownAction.bottomSheet:
        return openBottomSheet();
      case YgDropdownAction.picker:
        return openPickerBottomSheet();
      case YgDropdownAction.menu:
        return openMenu();
      case YgDropdownAction.auto:
        return _performPlatformAction(picker: false);
      case YgDropdownAction.autoPicker:
        return _performPlatformAction(picker: true);
      case YgDropdownAction.none:
        return;
    }
  }

  void close() {
    Navigator.popUntil(
      context,
      // ignore: avoid-dynamic
      (Route<dynamic> route) =>
          route is! YgDropdownMenuRoute &&
          route is! YgDropdownBottomSheetRoute &&
          route is! YgDropdownPickerBottomSheetRoute,
    );

    _onClosed();
  }

  bool get isOpen {
    return state.opened.value;
  }

  void _onClosed() {
    if (!state.opened.update(false)) {
      return;
    }

    YgEditingCompleteHelper.onComplete(
      onEditingComplete: widget.onEditingComplete,
      focusNode: _focusNodeManager.value,
      completeAction: widget.completeAction,
    );
  }

  void _performPlatformAction({
    required bool picker,
  }) {
    if (!YgConsts.isMobile) {
      openMenu();
    } else if (picker) {
      openPickerBottomSheet();
    } else {
      openBottomSheet();
    }
  }

  void _controllerListener() {
    state.filled.value = _controllerManager.value.filled;
  }
}
