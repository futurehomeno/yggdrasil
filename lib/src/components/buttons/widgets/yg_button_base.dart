import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import '_widgets.dart';

abstract class YgButtonBase<T extends YgButtonBaseState> extends StatefulWidget with StatefulWidgetDebugMixin {
  const YgButtonBase({
    super.key,
    required this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.focusNode,
    this.autofocus = false,
  });

  /// Called when the user presses the button.
  final VoidCallback? onPressed;

  /// Called when the user long presses the button.
  final VoidCallback? onLongPress;

  /// Called when the user hovers over the button.
  final ValueChanged<bool>? onHover;

  /// Called when the user focuses the button.
  final ValueChanged<bool>? onFocusChange;

  /// The [FocusNode] in charge of managing focus for this button.
  final FocusNode? focusNode;

  /// Whether the button should focus on first build.
  final bool autofocus;

  @override
  YgDebugType get debugType {
    if (onPressed == null) {
      return YgDebugType.other;
    }

    return YgDebugType.intractable;
  }

  @override
  State<YgButtonBase<T>> createState() => _YgButtonBaseState<T>();

  /// Updates the button state whenever the widget gets updated.
  @protected
  void updateState(T state);

  /// Builds the child widget for the button.
  @protected
  Widget buildChild(BuildContext context);

  /// Creates the style applied to this button.
  @protected
  YgButtonBaseStyle<T> createStyle(YgVsync vsync, T state);

  /// Creates the button state for this widget.
  ///
  /// Must extend [YgButtonBaseState].
  @protected
  T createButtonState();
}

class _YgButtonBaseState<T extends YgButtonBaseState> extends StateWithYgStyle<YgButtonBase<T>, YgButtonBaseStyle<T>> {
  late final YgMaterialStatesControllerWithChangeCallback _materialController =
      YgMaterialStatesControllerWithChangeCallback(
    onStateChange: _handleMaterialStateChange,
  );

  late final T _state = widget.createButtonState();

  void _handleMaterialStateChange(MaterialState state, bool toggled) {
    switch (state) {
      case MaterialState.focused:
        _state.focused.value = toggled;
        break;
      case MaterialState.hovered:
        _state.hovered.value = toggled;
        break;
      case MaterialState.pressed:
        _state.pressed.value = toggled;
        break;
      default:
    }
  }

  @override
  void dispose() {
    _materialController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant YgButtonBase<T> oldWidget) {
    widget.updateState(_state);
    super.didUpdateWidget(oldWidget);
  }

  @override
  YgButtonBaseStyle<T> createStyle() {
    return widget.createStyle(
      this,
      _state,
    );
  }

  @override
  Set<YgDynamicDrivenProperty> getWatchedProperties() {
    return <YgDynamicDrivenProperty>{
      style.splashFactory,
      style.cursor,
      style.splashColor,
    };
  }

  @override
  Widget build(BuildContext context) {
    return YgAnimatedConstrainedBox(
      constraints: style.constraints,
      child: YgAnimatedPhysicalShape(
        clipBehavior: Clip.antiAlias,
        color: style.color,
        elevation: style.elevation,
        shape: style.shape,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            statesController: _materialController,
            splashFactory: style.splashFactory.value,
            onLongPress: _state.disabled.value ? null : widget.onLongPress,
            onTap: _state.disabled.value ? null : widget.onPressed,
            onHover: widget.onHover,
            onFocusChange: widget.onFocusChange,
            autofocus: widget.autofocus,
            focusNode: widget.focusNode,
            canRequestFocus: widget.onPressed != null,
            mouseCursor: style.cursor.value,
            overlayColor: MaterialStatePropertyAll<Color>(
              style.splashColor.value,
            ),
            splashColor: Colors.transparent,
            child: YgAnimatedPadding(
              padding: style.padding,
              child: AlignTransition(
                widthFactor: 1,
                heightFactor: 1,
                alignment: style.alignment,
                child: DefaultTextStyleTransition(
                  style: style.textStyle,
                  child: YgAnimatedIconTheme(
                    iconTheme: style.iconTheme,
                    child: widget.buildChild(context),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
