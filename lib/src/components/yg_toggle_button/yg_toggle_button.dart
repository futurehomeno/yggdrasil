import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'mappers/_mappers.dart';
import 'yg_toggle_button_style.dart';

/// Yggdrasil toggle button.
class YgToggleButton extends StatefulWidget with StatefulWidgetDebugMixin {
  const YgToggleButton({
    super.key,
    required this.value,
    required this.onChanged,
    this.size = YgToggleButtonSize.medium,
    this.icon,
    this.text,
  }) : assert(icon != null || text != null, 'Either icon or text must be provided.');

  /// The current value of the button.
  final bool value;

  /// Callback to trigger when the value of the button changes.
  ///
  /// The button itself does not maintain any state. Instead, when the state of
  /// the button changes, the widget calls the [onChanged] callback.
  final Function(bool newValue)? onChanged;

  /// The size of the toggle button.
  final YgToggleButtonSize size;

  /// Icon to show in the button.
  final String? icon;

  /// Text to show in the button.
  final String? text;

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
    final Color resolvedTextColor = toggleButtonStyle.textColor.resolve(_statesController.value);
    final MouseCursor resolvedMouseCursor = toggleButtonStyle.mouseCursor.resolve(_statesController.value);

    final String? text = widget.text;
    final String? icon = widget.icon;
    final YgToggleButtonVariant variant = _variant;

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
            child: AnimatedContainer(
              duration: toggleButtonTheme.animationDuration,
              curve: toggleButtonTheme.animationCurve,
              padding: YgToggleButtonMapper.buildPadding(
                theme: toggleButtonTheme,
                size: widget.size,
                variant: variant,
              ),
              decoration: BoxDecoration(
                color: resolvedFillColor,
                border: Border.fromBorderSide(
                  BorderSide(color: resolvedBorderColor ?? Colors.transparent),
                ),
                borderRadius: BorderRadius.all(Radius.circular(toggleButtonTheme.borderRadius)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (icon != null)
                    YgIcon(
                      widget.icon,
                      color: resolvedIconColor,
                      size: _iconSize,
                    ),
                  if (text != null)
                    Text(
                      text,
                      style: YgToggleButtonMapper.buildTextStyle(
                        theme: toggleButtonTheme,
                        size: widget.size,
                      ).copyWith(color: resolvedTextColor),
                    ),
                ].withHorizontalSpacing(toggleButtonTheme.iconTextSpacing),
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool get _onlyIcon => widget.icon != null && widget.text == null;

  bool get _onlyText => widget.icon == null && widget.text != null;

  void _onShowFocusHighlight(bool value) {
    _statesController.update(MaterialState.focused, value);
  }

  void _onShowHoverHighlight(bool value) {
    _statesController.update(MaterialState.hovered, value);
  }

  void _onTap() {
    final Function(bool newValue)? onChanged = widget.onChanged;
    if (onChanged != null) {
      widget.onChanged?.call(!widget.value);
    }
  }

  YgIconSize get _iconSize {
    if (_onlyIcon && widget.size == YgToggleButtonSize.large) {
      return YgIconSize.large;
    }

    return YgIconSize.small;
  }

  YgToggleButtonVariant get _variant {
    if (_onlyIcon) {
      return YgToggleButtonVariant.icon;
    }

    if (_onlyText) {
      return YgToggleButtonVariant.text;
    }

    return YgToggleButtonVariant.iconAndText;
  }
}
