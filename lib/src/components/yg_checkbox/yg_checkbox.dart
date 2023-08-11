import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yggdrasil/src/components/yg_checkbox/helpers/_helpers.dart';
import 'package:yggdrasil/src/components/yg_checkbox/yg_checkbox.style.dart';
import 'package:yggdrasil/src/components/yg_checkbox/yg_checkbox_line.dart';
import 'package:yggdrasil/src/theme/checkbox/_checkbox.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_checkbox_checkmark.dart';

/// Yggdrasil radio button.
///
/// The widget consists of three circles stacked on top of one another.
/// The first circle creates the background (or border when not selected).
/// The second circle creates the handle, large when not selected, small when selected.
/// The last circle creates the helper handle, only used for the disabled state.
class YgCheckbox extends StatefulWidget {
  const YgCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.triState = false,
    this.hasError = false,
  });

  /// The current value of the checkbox.
  final bool? value;

  /// Callback to trigger when the value of the checkbox changes.
  ///
  /// The checkbox itself does not maintain any state. Instead, when the state of
  /// the checkbox changes, the widget calls the [onChanged] callback.
  final Function(bool? newValue)? onChanged;

  /// Enables `null` as a valid third state for the checkbox.
  ///
  /// The checkbox will then cycle through false --> null --> true --> false --> ...
  final bool triState;

  /// Whether the checkbox is in an error state.
  final bool hasError;

  bool get _enabled => onChanged != null;

  bool get _selected => value == true;

  @override
  State<YgCheckbox> createState() => _YgRadioState();
}

class _YgRadioState extends State<YgCheckbox> {
  // region StatesController
  void handleStatesControllerChange() {
    // Force a rebuild to resolve MaterialStateProperty properties.
    setState(() {});
  }

  MaterialStatesController statesController = MaterialStatesController();
  late final Map<ShortcutActivator, Intent> shortcutMap;
  late final Map<Type, Action<Intent>> actionMap;

  void initStatesController() {
    statesController.update(MaterialState.error, widget.hasError);
    statesController.update(MaterialState.disabled, !widget._enabled);
    statesController.update(MaterialState.selected, widget._selected);
    statesController.addListener(handleStatesControllerChange);
  }

  @override
  void initState() {
    super.initState();
    initStatesController();
  }

  @override
  void didUpdateWidget(covariant YgCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget._selected != oldWidget._selected) {
      statesController.update(MaterialState.selected, widget._selected);
    }

    if (widget._enabled != oldWidget._enabled) {
      statesController.update(MaterialState.disabled, !widget._enabled);
      if (!widget._enabled) {
        // The radio may have been disabled while a press gesture is currently underway.
        statesController.update(MaterialState.pressed, false);
      }
    }

    if (widget.hasError != oldWidget.hasError) {
      statesController.update(MaterialState.error, !widget.hasError);
    }
  }

  @override
  void dispose() {
    statesController.removeListener(handleStatesControllerChange);
    super.dispose();
  }
  // endregion StatesController

  @override
  Widget build(BuildContext context) {
    final YgCheckboxTheme checkboxTheme = context.checkboxTheme;
    final YgCheckboxStyle checkboxStyle = YgCheckboxStyle.base(context);
    final Color? resolvedFillColor = checkboxStyle.fillColor.resolveWith(statesController.value, widget.value);
    final Color? resolvedBorderColor = checkboxStyle.borderColor.resolveWith(statesController.value, widget.value);
    final Color? resolvedCheckColor = checkboxStyle.checkColor.resolve(statesController.value);
    final MouseCursor resolvedMouseCursor = checkboxStyle.mouseCursor.resolve(statesController.value)!;

    return RepaintBoundary(
      child: Semantics(
        checked: widget._selected,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: widget.onChanged == null ? null : _onTap,
          child: FocusableActionDetector(
            onShowHoverHighlight: _onShowHoverHighlight,
            onShowFocusHighlight: _onShowFocusHighlight,
            shortcuts: const <ShortcutActivator, Intent>{
              SingleActivator(LogicalKeyboardKey.space, control: true): ActivateIntent(),
            },
            actions: <Type, Action<Intent>>{
              ActivateIntent: CallbackAction<Intent>(onInvoke: (_) {
                return widget.onChanged == null ? null : _onTap();
              }),
            },
            mouseCursor: resolvedMouseCursor,
            enabled: widget._enabled,
            child: Padding(
              padding: EdgeInsets.all(checkboxTheme.padding),
              child: AnimatedContainer(
                duration: checkboxTheme.animationDuration,
                curve: checkboxTheme.animationCurve,
                width: checkboxTheme.size,
                height: checkboxTheme.size,
                decoration: BoxDecoration(
                  color: widget.value == null ? checkboxTheme.selectedFillColor : resolvedFillColor,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    width: 2.0,
                    color: resolvedBorderColor ?? Colors.transparent,
                  ),
                ),
                child: AnimatedSwitcher(
                  duration: checkboxTheme.animationDuration,
                  switchInCurve: checkboxTheme.animationCurve,
                  switchOutCurve: checkboxTheme.animationCurve,
                  child: _getCheckmark(resolvedCheckColor),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget? _getCheckmark(Color? resolvedCheckColor) {
    if (widget.value == null) {
      return YgCheckboxLine(color: resolvedCheckColor ?? Colors.transparent);
    }

    return widget._selected ? YgCheckboxCheckmark(color: resolvedCheckColor ?? Colors.transparent) : null;
  }

  void _onShowFocusHighlight(bool value) {
    statesController.update(MaterialState.focused, value);
  }

  void _onShowHoverHighlight(bool value) {
    statesController.update(MaterialState.hovered, value);
  }

  void _onTap() {
    final bool? nextValue = YgCheckboxHelpers.getNextValue(widget.value, widget.triState);
    widget.onChanged?.call(nextValue);
  }
}
