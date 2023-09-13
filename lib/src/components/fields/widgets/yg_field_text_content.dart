import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/fields/enums/field_state.dart';
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

  /// The value.
  ///
  /// This is simply a widget with a [DefaultTextStyle] provided to it, any
  /// interaction logic of the value (if required) will be implemented elsewhere.
  final Widget value;

  /// The placeholder.
  ///
  /// Only shown if [states] does not contain the [FieldState.filled].
  final String? placeholder;

  /// The label.
  ///
  /// Will be in place of the value if there is no [placeholder] and when
  /// [states] does not contain [FieldState.filled], [FieldState.focused] or
  /// [FieldState.opened].
  final String label;

  /// The current states of the field.
  final FieldStates states;

  /// The minium height of the value in an amount of lines.
  ///
  /// Only effects the height of the widget.
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
          duration: _duration,
          curve: _curve,
          offset: _labelOffset,
          child: AnimatedDefaultTextStyle(
            duration: _duration,
            curve: _curve,
            style: _labelTextStyle,
            child: Text(
              widget.label,
            ),
          ),
        ),
      ],
    );
  }

  YgFieldContentTheme get _theme => context.fieldTheme.contentTheme;
  Duration get _duration => context.fieldTheme.animationDuration;
  Curve get _curve => context.fieldTheme.animationCurve;

  double get _labelFloatingHeight => _theme.labelFocusFilledTextStyle.computedHeight;

  bool get _floatLabel => widget.states.focused || widget.states.filled || widget.placeholder?.isNotEmpty == true;

  TextStyle get _valueTextStyle {
    final TextStyle baseStyle = _theme.valueTextStyle;

    if (widget.states.disabled) {
      return baseStyle.copyWith(
        color: _theme.valueDisabledColor,
      );
    }

    return baseStyle.copyWith(
      color: _theme.valueDefaultColor,
    );
  }

  TextStyle get _placeholderTextStyle {
    if (widget.states.disabled) {
      return _theme.placeholderTextStyle.copyWith(
        color: _theme.placeholderDisabledColor,
      );
    }

    return _theme.placeholderTextStyle.copyWith(
      color: _theme.placeholderDefaultColor,
    );
  }

  TextStyle get _labelTextStyle {
    final TextStyle baseStyle = _floatLabel ? _theme.labelFocusFilledTextStyle : _theme.labelDefaultTextStyle;

    if (widget.states.disabled) {
      return baseStyle.copyWith(
        color: _theme.labelDisabledColor,
      );
    }

    if (widget.states.focused || widget.states.filled || widget.states.opened) {
      return baseStyle.copyWith(
        color: _theme.labelFocusFilledColor,
      );
    }

    return baseStyle.copyWith(
      color: _theme.labelDefaultColor,
    );
  }

  Offset get _labelOffset {
    if (_floatLabel) {
      return Offset.zero;
    }

    final double labelFloatingHeight = _labelFloatingHeight;
    final double labelDefaultHeight = _theme.labelDefaultTextStyle.computedHeight;
    final double valueDefaultHeight = _theme.valueTextStyle.computedHeight;

    final double combinedHeight = labelFloatingHeight + valueDefaultHeight;

    return Offset(
      0.0,
      ((combinedHeight / labelDefaultHeight) - 1) / 2,
    );
  }
}
