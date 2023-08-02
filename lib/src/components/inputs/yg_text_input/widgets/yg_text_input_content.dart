import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yggdrasil/yggdrasil.dart';

import '_widgets.dart';

class YgTextInputContent extends YgTextInputWidget {
  const YgTextInputContent({
    super.key,
    required super.controller,
    required super.focusNode,
    required this.placeholder,
    required this.label,
    required this.disabled,
    required this.obscureText,
    required this.maxLines,
    required this.minLines,
    required this.autocorrect,
    required this.inputFormatters,
    required this.keyboardType,
    required this.onChanged,
    required this.readOnly,
    required this.textCapitalization,
    required this.textInputAction,
    required this.onEditingComplete,
  });

  final String? placeholder;
  final String label;
  final bool disabled;
  final bool obscureText;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;
  final bool autocorrect;
  final TextCapitalization textCapitalization;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final TextInputAction? textInputAction;

  @override
  State<YgTextInputContent> createState() => _YgTextInputContentState();
}

class _YgTextInputContentState extends YgTextInputWidgetState<YgTextInputContent> {
  final UniqueKey _valueKey = UniqueKey();
  final UniqueKey _placeholderKey = UniqueKey();
  final UniqueKey _labelKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    final String? placeholder = widget.placeholder;
    final double labelFloatingHeight = _labelFloatingHeight;

    return Stack(
      children: <Widget>[
        if (placeholder != null && isEmpty)
          Padding(
            key: _placeholderKey,
            padding: EdgeInsets.only(top: labelFloatingHeight),
            child: Text(
              placeholder,
              style: _placeholderTextStyle,
            ),
          ),
        Padding(
          key: _valueKey,
          padding: EdgeInsets.only(top: labelFloatingHeight),
          child: _getValueText(),
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
        )
      ],
    );
  }

  double get _labelFloatingHeight => theme.labelFocusFilledTextStyle.computedHeight;

  Widget _getValueText() {
    final TextStyle baseStyle = theme.valueTextStyle;

    if (widget.disabled) {
      // TODO(Tim): Look in to some way to replicate minLines.
      return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          controller.text,
          style: baseStyle.copyWith(
            color: theme.valueDisabledColor,
          ),
          maxLines: widget.maxLines,
        ),
      );
    }

    return EditableText(
      focusNode: focusNode,
      backgroundCursorColor: theme.cursorColor,
      controller: controller,
      cursorColor: theme.cursorColor,
      style: baseStyle.copyWith(
        color: theme.valueDefaultColor,
      ),
      obscureText: widget.obscureText,
      cursorHeight: baseStyle.fontSize,
      cursorOffset: _cursorOffset,
      selectionColor: theme.cursorColor,
      cursorWidth: 1,
      keyboardType: widget.keyboardType,
      autocorrect: widget.autocorrect,
      textCapitalization: widget.textCapitalization,
      readOnly: widget.readOnly,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      inputFormatters: widget.inputFormatters,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      textInputAction: widget.textInputAction,
    );
  }

  bool get _floatLabel => focused || !isEmpty || widget.placeholder?.isNotEmpty == true;

  Offset get _cursorOffset {
    final TextStyle style = theme.valueTextStyle;

    return Offset(
      0,
      (style.computedHeight - style.fontSize!) / 2,
    );
  }

  TextStyle get _placeholderTextStyle {
    if (widget.disabled) {
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

    if (widget.disabled) {
      return baseStyle.copyWith(
        color: theme.labelDisabledColor,
      );
    }

    if (focused || !isEmpty) {
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
      0,
      ((combinedHeight / labelDefaultHeight) - 1) / 2,
    );
  }
}
