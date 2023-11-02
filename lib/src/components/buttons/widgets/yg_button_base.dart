import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import '_widgets.dart';

typedef YbButtonStyleCreator<T extends YgButtonBaseState> = YgButtonBaseStyle<T> Function(YgVsync vsync);

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

  void updateState(T state);

  Widget buildChild(BuildContext context);

  YgButtonBaseStyle<T> createStyle(YgVsync vsync, T state);

  T createButtonState();
}

class _YgButtonBaseState<T extends YgButtonBaseState> extends State<YgButtonBase<T>> {
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
  Widget build(BuildContext context) {
    return YgStyleBuilder<YgButtonBaseStyle<T>>(
      createStyle: (YgVsync vsync) => widget.createStyle(vsync, _state),
      getWatchedProperties: (YgButtonBaseStyle<T> style) => <YgDynamicDrivenProperty>{
        style.splashFactory,
        style.cursor,
        style.splashColor,
      },
      builder: (BuildContext context, YgButtonBaseStyle<T> style) {
        return YgAnimatedConstrainedBox(
          constraints: style.constraints,
          child: YgAnimatedShapeBorderClipper(
            shape: style.shape,
            child: YgAnimatedPhysicalModel(
              color: style.color,
              elevation: style.elevation,
              child: Material(
                color: Colors.transparent,
                child: YgAnimatedShapeBorderPainter(
                  shape: style.shape,
                  child: InkWell(
                    statesController: _materialController,
                    splashFactory: style.splashFactory.value,
                    onLongPress: widget.onLongPress,
                    onTap: widget.onPressed,
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
            ),
          ),
        );
      },
    );
  }
}
