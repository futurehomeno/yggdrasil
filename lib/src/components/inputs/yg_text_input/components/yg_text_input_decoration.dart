import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

import '_components.dart';

class YgTextInputDecoration extends YgTextInputComponent {
  const YgTextInputDecoration({
    super.key,
    required this.child,
    required this.variant,
    required this.disabled,
    required this.hovered,
    required this.error,
    required super.controller,
    required super.focusNode,
  });

  final Widget child;
  final YgTextInputVariant variant;
  final bool disabled;
  final bool hovered;
  final bool error;

  @override
  State<YgTextInputDecoration> createState() => _YgTextInputDecorationState();
}

class _YgTextInputDecorationState extends YgTextInputComponentState<YgTextInputDecoration> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: switch (widget.variant) {
            YgTextInputVariant.outlined => AnimatedContainer(
                duration: duration,
                curve: curve,
                decoration: BoxDecoration(
                  color: _backgroundColor,
                  border: _border,
                  borderRadius: theme.borderRadius,
                ),
              ),
            YgTextInputVariant.standard => AnimatedContainer(
                duration: duration,
                curve: curve,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: _border.bottom,
                  ),
                ),
              ),
          },
        ),
        widget.child,
      ],
    );
  }

  Border get _border {
    if (widget.disabled) {
      return theme.borderDisabled;
    }

    if (widget.error) {
      return theme.borderError;
    }

    if (focused) {
      return theme.borderFocus;
    }

    if (widget.hovered) {
      return theme.borderHover;
    }

    return theme.borderDefault;
  }

  Color get _backgroundColor {
    if (widget.disabled) {
      return theme.backgroundDisabledColor;
    }
    if (widget.error) {
      return theme.backgroundErrorColor;
    }
    return theme.backgroundDefaultColor;
  }
}
