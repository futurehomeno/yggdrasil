import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/fields/enums/field_state.dart';
import 'package:yggdrasil/src/theme/fields/extensions/field_content/field_content_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// The content of the [YgTextField].
///
/// Renders and animates the value text, label and placeholder.
class YgFieldTextContent extends StatefulWidget {
  const YgFieldTextContent({
    super.key,
    required this.value,
    required this.placeholder,
    required this.label,
    required this.states,
    required this.minLines,
  });

  final Widget value;
  final String? placeholder;
  final String label;
  final FieldStates states;
  final int? minLines;

  @override
  State<YgFieldTextContent> createState() => _YgFieldTextContentState();
}

class _YgFieldTextContentState extends State<YgFieldTextContent> {
  final UniqueKey _valueKey = UniqueKey();
  final UniqueKey _placeholderKey = UniqueKey();
  final UniqueKey _labelKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    final String? placeholder = widget.placeholder;
    final double labelFloatingHeight = _labelFloatingHeight;

    return Stack(
      children: <Widget>[
        if (placeholder != null && !widget.states.filled)
          Padding(
            key: _placeholderKey,
            padding: EdgeInsets.only(top: labelFloatingHeight),
            child: Text(
              placeholder,
              style: _placeholderTextStyle,
              maxLines: widget.minLines ?? 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        Padding(
          key: _valueKey,
          padding: EdgeInsets.only(top: labelFloatingHeight),
          child: DefaultTextStyle(
            style: _valueTextStyle,
            child: widget.value,
          ),
        ),
        AnimatedSlide(
          key: _labelKey,
          duration: duration,
          curve: curve,
          offset: _labelOffset,
          child: AnimatedDefaultTextStyle(
            duration: duration,
            curve: curve,
            style: _labelTextStyle,
            child: Text(
              widget.label,
            ),
          ),
        ),
      ],
    );
  }

  YgFieldContentTheme get theme => context.fieldTheme.contentTheme;
  Duration get duration => context.fieldTheme.animationDuration;
  Curve get curve => context.fieldTheme.animationCurve;

  double get _labelFloatingHeight => theme.labelFocusFilledTextStyle.computedHeight;

  bool get _floatLabel => widget.states.focused || widget.states.filled || widget.placeholder?.isNotEmpty == true;

  TextStyle get _valueTextStyle {
    final TextStyle baseStyle = theme.valueTextStyle;

    if (widget.states.disabled) {
      return baseStyle.copyWith(
        color: theme.valueDisabledColor,
      );
    }

    return baseStyle.copyWith(
      color: theme.valueDefaultColor,
    );
  }

  TextStyle get _placeholderTextStyle {
    if (widget.states.disabled) {
      return theme.placeholderTextStyle.copyWith(
        color: theme.placeholderDisabledColor,
      );
    }

    return theme.placeholderTextStyle.copyWith(
      color: theme.placeholderDefaultColor,
    );
  }

  TextStyle get _labelTextStyle {
    final TextStyle baseStyle = _floatLabel ? theme.labelFocusFilledTextStyle : theme.labelDefaultTextStyle;

    if (widget.states.disabled) {
      return baseStyle.copyWith(
        color: theme.labelDisabledColor,
      );
    }

    if (widget.states.focused || widget.states.filled || widget.states.opened) {
      return baseStyle.copyWith(
        color: theme.labelFocusFilledColor,
      );
    }

    return baseStyle.copyWith(
      color: theme.labelDefaultColor,
    );
  }

  Offset get _labelOffset {
    if (_floatLabel) {
      return Offset.zero;
    }

    final double labelFloatingHeight = _labelFloatingHeight;
    final double labelDefaultHeight = theme.labelDefaultTextStyle.computedHeight;
    final double valueDefaultHeight = theme.valueTextStyle.computedHeight;

    final double combinedHeight = labelFloatingHeight + valueDefaultHeight;

    return Offset(
      0.0,
      ((combinedHeight / labelDefaultHeight) - 1) / 2,
    );
  }
}
