import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

import '_widgets.dart';

class YgTextInputDecoration extends YgTextInputWidget {
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

class _YgTextInputDecorationState extends YgTextInputWidgetState<YgTextInputDecoration> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: AnimatedContainer(
            duration: duration,
            curve: curve,
            decoration: BoxDecoration(
              border: _border,
              borderRadius: _borderRadius,
              color: _backgroundColor,
            ),
          ),
        ),
        Padding(
          padding: _childPadding,
          child: widget.child,
        ),
      ],
    );
  }

  EdgeInsets get _childPadding {
    return switch (widget.variant) {
      YgTextInputVariant.outlined => const EdgeInsets.all(2),
      YgTextInputVariant.standard => const EdgeInsets.only(bottom: 2),
    };
  }

  BorderRadius? get _borderRadius {
    return switch (widget.variant) {
      YgTextInputVariant.outlined => theme.borderRadius,
      YgTextInputVariant.standard => null,
    };
  }

  Border get _border {
    Border base = theme.borderDefault;

    if (widget.disabled) {
      base = theme.borderDisabled;
    } else if (widget.error) {
      base = theme.borderError;
    } else if (focused) {
      base = theme.borderFocus;
    } else if (widget.hovered) {
      base = theme.borderHover;
    }

    if (widget.variant == YgTextInputVariant.outlined) {
      return base;
    }

    return Border(
      bottom: base.bottom,
    );
  }

  Color get _backgroundColor {
    if (widget.variant == YgTextInputVariant.standard) {
      return Colors.transparent;
    }

    if (widget.disabled) {
      return theme.backgroundDisabledColor;
    }
    if (widget.error) {
      return theme.backgroundErrorColor;
    }
    return theme.backgroundDefaultColor;
  }
}
