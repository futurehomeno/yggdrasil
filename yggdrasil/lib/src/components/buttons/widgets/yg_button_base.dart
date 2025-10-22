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
    this.onTapEnd,
    this.onTapStart,
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

  /// Called when the user ends a tap.
  final VoidCallback? onTapEnd;

  /// Called when the user starts a tap.
  final VoidCallback? onTapStart;

  /// The [FocusNode] in charge of managing focus for this button.
  final FocusNode? focusNode;

  /// Whether the button should focus on first build.
  final bool autofocus;

  @override
  YgDebugType get debugType {
    if (disabled) {
      return YgDebugType.other;
    }

    return YgDebugType.intractable;
  }

  /// Whether the buttons is visually disabled.
  bool get disabled {
    return onPressed == null;
  }

  @override
  State<YgButtonBase<T>> createState() => _YgButtonBaseState<T>();

  /// Updates the button state whenever the widget gets updated.
  @protected
  void updateState(T state);

  /// Builds the child widget for the button.
  @protected
  Widget buildChild(BuildContext context);

  /// Builds an optional background.
  ///
  /// Gets rendered behind the button content, but in front of the background color.
  @protected
  Widget? buildBackground(BuildContext context) => null;

  /// Builds a wrapper for the button.
  @protected
  Widget buildWrapper(BuildContext context, Widget child) => child;

  /// Creates the style applied to this button.
  @protected
  YgButtonBaseStyle<T> createStyle(YgVsync vsync, T state);

  /// Creates the button state for this widget.
  ///
  /// Must extend [YgButtonBaseState].
  @protected
  T createButtonState();
}

class _YgButtonBaseState<T extends YgButtonBaseState>
    extends StateWithYgStateAndStyle<YgButtonBase<T>, T, YgButtonBaseStyle<T>> {
  late final YgMaterialStatesControllerWithChangeCallback _materialController =
      YgMaterialStatesControllerWithChangeCallback(
        onStateChange: _handleMaterialStateChange,
      );

  @override
  T createState() {
    return widget.createButtonState();
  }

  @override
  YgButtonBaseStyle<T> createStyle() {
    return widget.createStyle(
      this,
      state,
    );
  }

  @override
  void updateState() {
    state.disabled.value = widget.disabled;
    widget.updateState(state);
  }

  void _handleMaterialStateChange(WidgetState widgetState, bool toggled) {
    switch (widgetState) {
      case WidgetState.focused:
        state.focused.value = toggled;
        break;

      case WidgetState.hovered:
        state.hovered.value = toggled;
        break;

      case WidgetState.pressed:
        state.pressed.value = toggled;
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
  Set<YgDynamicDrivenProperty> getWatchedProperties() {
    return <YgDynamicDrivenProperty>{
      style.splashFactory,
      style.cursor,
      style.splashColor,
      style.clip,
    };
  }

  @override
  Widget build(BuildContext context) {
    final Widget? background = widget.buildBackground(context);
    final VoidCallback? onTapEnd = widget.onTapEnd;
    final VoidCallback? onTapStart = widget.onTapStart;

    Widget content = YgAnimatedConstrainedBox(
      constraints: style.constraints,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          statesController: _materialController,
          splashFactory: style.splashFactory.value,
          onLongPress: state.disabled.value ? null : widget.onLongPress,
          onTap: state.disabled.value ? null : widget.onPressed,
          onHover: widget.onHover,
          onFocusChange: widget.onFocusChange,
          onTapUp: onTapEnd == null ? null : (_) => onTapEnd(),
          onTapDown: onTapStart == null ? null : (_) => onTapStart(),
          onTapCancel: onTapEnd,
          autofocus: widget.autofocus,
          focusNode: widget.focusNode,
          canRequestFocus: widget.onPressed != null,
          mouseCursor: style.cursor.value,
          overlayColor: WidgetStatePropertyAll<Color>(
            style.splashColor.value,
          ),
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          child: YgAnimatedPadding(
            padding: style.padding,
            child: AlignTransition(
              widthFactor: 1,
              heightFactor: 1,
              alignment: style.alignment,
              child: DefaultTextStyleTransition(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
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
    );

    if (background != null) {
      content = Stack(
        children: <Widget>[
          Positioned.fill(
            child: background,
          ),
          content,
        ],
      );
    }

    return YgAnimatedPhysicalShape(
      clipBehavior: style.clip.value,
      color: style.color,
      elevation: style.elevation,
      shape: style.shape,
      child: content,
    );
  }
}
