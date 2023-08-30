import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yggdrasil/src/components/yg_toggle_button/helpers/_helpers.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_toggle_button_style.dart';

/// Yggdrasil toggle button.
class YgToggleButton extends StatefulWidget with StatefulWidgetDebugMixin {
  const YgToggleButton({
    super.key,
    required this.value,
    required this.onChanged,
    this.icon,
    this.text,
    this.triState = false,
  }) : assert(icon != null || text != null, 'Either icon or text must be provided.');

  /// The current value of the button.
  final bool? value;

  /// Callback to trigger when the value of the button changes.
  ///
  /// The button itself does not maintain any state. Instead, when the state of
  /// the button changes, the widget calls the [onChanged] callback.
  final Function(bool? newValue)? onChanged;

  /// Icon to show in the button.
  final String? icon;

  /// Text to show in the button.
  final String? text;

  /// Enables `null` as a valid third state for the button.
  ///
  /// The button will then cycle through false --> null --> true --> false --> ...
  final bool triState;

  bool get _enabled => onChanged != null;

  bool get _selected => value == true;

  @override
  State<YgToggleButton> createState() => _YgToggleButtonState();
}

class _YgToggleButtonState extends State<YgToggleButton> {
  // region StatesController
  void _handleStatesControllerChange() {
    // Force a rebuild to resolve MaterialStateProperty properties.
    setState(() {});
  }

  final MaterialStatesController _statesController = MaterialStatesController();

  void _initStatesController() {
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
  void didUpdateWidget(covariant YgToggleButton oldWidget) {
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
    final YgToggleButtonTheme toggleButtonTheme = context.toggleButtonTheme;
    final YgToggleButtonStyle toggleButtonStyle = YgToggleButtonStyle.base(context);
    final Color resolvedFillColor = toggleButtonStyle.fillColor.resolveWith(_statesController.value, widget.value);
    final Color? resolvedBorderColor = toggleButtonStyle.borderColor.resolveWith(_statesController.value, widget.value);
    final Color resolvedIconColor = toggleButtonStyle.iconColor.resolve(_statesController.value);
    final MouseCursor resolvedMouseCursor = toggleButtonStyle.mouseCursor.resolve(_statesController.value);

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
            child: _buildToggleButton(
              resolvedFillColor: resolvedFillColor,
              resolvedBorderColor: resolvedBorderColor,
              resolvedIconColor: resolvedIconColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildToggleButton({
    required Color resolvedFillColor,
    required Color? resolvedBorderColor,
    required Color resolvedIconColor,
  }) {
    if (_onlyIcon) {
      return _buildIconToggleButton(
        resolvedFillColor: resolvedFillColor,
        resolvedBorderColor: resolvedBorderColor,
        resolvedIconColor: resolvedIconColor,
      );
    }

    if (_onlyText) {
      return _buildTextToggleButton(
        resolvedFillColor: resolvedFillColor,
        resolvedBorderColor: resolvedBorderColor,
        resolvedIconColor: resolvedIconColor,
      );
    }

    return _buildTextAndIconToggleButton(
      resolvedFillColor: resolvedFillColor,
      resolvedBorderColor: resolvedBorderColor,
      resolvedIconColor: resolvedIconColor,
    );
  }

  bool get _onlyIcon => widget.icon != null && widget.text == null;

  bool get _onlyText => widget.icon == null && widget.text != null;

  Widget _buildIconToggleButton({
    required Color resolvedFillColor,
    required Color? resolvedBorderColor,
    required Color resolvedIconColor,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: resolvedFillColor,
        shape: BoxShape.circle,
        border: Border.fromBorderSide(
          BorderSide(color: resolvedBorderColor ?? Colors.transparent),
        ),
      ),
      child: Center(
        child: YgIcon(
          widget.icon!,
          color: resolvedIconColor,
        ),
      ),
    );
  }

  Widget _buildTextToggleButton({
    required Color resolvedFillColor,
    required Color? resolvedBorderColor,
    required Color resolvedIconColor,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: resolvedFillColor,
        borderRadius: const BorderRadius.all(Radius.circular(50.0)),
        border: Border.fromBorderSide(
          BorderSide(color: resolvedBorderColor ?? Colors.transparent),
        ),
      ),
      child: Center(
        child: Text(
          widget.text!,
        ),
      ),
    );
  }

  Widget _buildTextAndIconToggleButton({
    required Color resolvedFillColor,
    required Color? resolvedBorderColor,
    required Color resolvedIconColor,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: resolvedFillColor,
        borderRadius: const BorderRadius.all(Radius.circular(50.0)),
        border: Border.fromBorderSide(
          BorderSide(color: resolvedBorderColor ?? Colors.transparent),
        ),
      ),
      child: Center(
        child: YgIcon(
          widget.icon!,
          color: resolvedIconColor,
        ),
      ),
    );
  }

  void _onShowFocusHighlight(bool value) {
    _statesController.update(MaterialState.focused, value);
  }

  void _onShowHoverHighlight(bool value) {
    _statesController.update(MaterialState.hovered, value);
  }

  void _onTap() {
    final Function(bool? newValue)? onChanged = widget.onChanged;
    if (onChanged != null) {
      final bool? nextValue = YgToggleButtonHelpers.getNextValue(widget.value, widget.triState);
      widget.onChanged?.call(nextValue);
    }
  }
}
