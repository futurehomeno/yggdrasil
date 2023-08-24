import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import 'helpers/_helpers.dart';
import 'widgets/_widgets.dart';
import 'yg_checkbox_style.dart';

/// Yggdrasil radio button.
///
/// The widget consists of three circles stacked on top of one another.
/// The first circle creates the background (or border when not selected).
/// The second circle creates the handle, large when not selected, small when selected.
/// The last circle creates the helper handle, only used for the disabled state.
class YgCheckbox extends StatefulWidget with StatefulWidgetDebugMixin {
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
  void _handleStatesControllerChange() {
    // Force a rebuild to resolve MaterialStateProperty properties.
    setState(() {});
  }

  final MaterialStatesController _statesController = MaterialStatesController();

  void _initStatesController() {
    _statesController.update(MaterialState.error, widget.hasError);
    _statesController.update(MaterialState.disabled, !widget._enabled);
    _statesController.update(MaterialState.selected, widget._selected);
    _statesController.addListener(_handleStatesControllerChange);
  }

  @override
  void initState() {
    super.initState();
    _initStatesController();
  }

  @override
  void didUpdateWidget(covariant YgCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget._selected != oldWidget._selected) {
      _statesController.update(MaterialState.selected, widget._selected);
    }

    if (widget._enabled != oldWidget._enabled) {
      _statesController.update(MaterialState.disabled, !widget._enabled);
      if (!widget._enabled) {
        // The radio may have been disabled while a press gesture is currently underway.
        _statesController.update(MaterialState.pressed, false);
      }
    }

    if (widget.hasError != oldWidget.hasError) {
      _statesController.update(MaterialState.error, !widget.hasError);
    }
  }

  @override
  void dispose() {
    _statesController.removeListener(_handleStatesControllerChange);
    _statesController.dispose();
    super.dispose();
  }
  // endregion StatesController

  @override
  Widget build(BuildContext context) {
    final YgCheckboxTheme checkboxTheme = context.checkboxTheme;
    final YgCheckboxStyle checkboxStyle = YgCheckboxStyle.base(context);
    final Color resolvedFillColor = checkboxStyle.fillColor.resolveWith(_statesController.value, widget.value);
    final Color? resolvedBorderColor = checkboxStyle.borderColor.resolveWith(_statesController.value, widget.value);
    final Color resolvedCheckColor = checkboxStyle.checkColor.resolve(_statesController.value);
    final MouseCursor resolvedMouseCursor = checkboxStyle.mouseCursor.resolve(_statesController.value);

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
              ActivateIntent: CallbackAction<Intent>(onInvoke: (_) => _onTap()),
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
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  border: Border.fromBorderSide(BorderSide(
                    width: 2.0,
                    color: resolvedBorderColor ?? Colors.transparent,
                  )),
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
    _statesController.update(MaterialState.focused, value);
  }

  void _onShowHoverHighlight(bool value) {
    _statesController.update(MaterialState.hovered, value);
  }

  void _onTap() {
    final onChanged = widget.onChanged;
    if (onChanged != null) {
      final bool? nextValue = YgCheckboxHelpers.getNextValue(widget.value, widget.triState);
      widget.onChanged?.call(nextValue);
    }
  }
}
