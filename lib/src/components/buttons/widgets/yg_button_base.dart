import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import '_widgets.dart';

typedef YbButtonStyleCreator<T extends Enum> = YgButtonBaseStyle<T> Function(YgVsync vsync);

class YgButtonBase<T extends Enum> extends StatefulWidget with StatefulWidgetDebugMixin {
  const YgButtonBase({
    super.key,
    required this.child,
    required this.controller,
    required this.onPressed,
    required this.createStyle,
    required this.focusedState,
    required this.pressedState,
    required this.hoveredState,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.focusNode,
    this.autofocus = false,
  });

  final T focusedState;
  final T pressedState;
  final T hoveredState;

  final YbButtonStyleCreator<T> createStyle;
  final YgStatesController<T> controller;
  final Widget child;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final FocusNode? focusNode;
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
}

class _YgButtonBaseState<T extends Enum> extends State<YgButtonBase<T>> {
  late final YgMaterialStatesControllerWithChangeCallback<T> _materialController =
      YgMaterialStatesControllerWithChangeCallback<T>(
    onStateChange: _handleMaterialStateChange,
  );

  void _handleMaterialStateChange(MaterialState state, bool toggled) {
    final T? parentState = switch (state) {
      MaterialState.focused => widget.focusedState,
      MaterialState.pressed => widget.pressedState,
      MaterialState.hovered => widget.hoveredState,
      _ => null,
    };

    if (parentState == null) {
      return;
    }

    widget.controller.update(
      parentState,
      toggled,
    );
  }

  @override
  void dispose() {
    _materialController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YgStyleBuilder<YgButtonBaseStyle<T>>(
      createStyle: widget.createStyle,
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
                            child: widget.child,
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
