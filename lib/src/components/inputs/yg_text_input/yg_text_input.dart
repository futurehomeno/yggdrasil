import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgTextInput extends StatefulWidget {
  const YgTextInput({
    super.key,
    required this.fieldKey,
    required this.label,
    this.obscureText = false,
    this.showPasswordButton = true,
    this.validators,
    this.outlined = false,
    this.placeholder,
    this.trailingIcon,
    this.initialValue,
    this.controller,
    this.disabled = false,
  });

  /// Obscures the text in the input.
  ///
  /// If [showPasswordButton] is set to true (the default value) and the
  /// [trailingIcon] is empty, there will be a suffix button added which will show
  /// the text in the input when pressed.
  final bool obscureText;

  /// Shows a button to toggle obscuring the text.
  ///
  /// Will only work when [obscureText] is set to true and [trailingIcon] is set to
  /// null.
  final bool showPasswordButton;

  /// A list of [TextValidator]s which validate user input.
  ///
  /// Will validate the input in the order the validators were added to the
  /// list. Will only show the first error.
  final List<TextValidator>? validators;

  /// The variant of the input.
  final bool outlined;

  /// The label shown on top of the input.
  final String label;

  /// The placeholder shown in the input.
  ///
  /// Gets replaced with the value entered by the user if the value is not empty.
  final String? placeholder;

  /// The suffix shown in the input.
  final YgIcon? trailingIcon;

  /// The initial value.
  final String? initialValue;

  final bool disabled;

  /// Controls the text being edited.
  ///
  /// When defined will overwrite the [initialValue].
  final TextEditingController? controller;

  /// The key used to get the value of the field.
  final TextFieldKey fieldKey;

  @override
  State<YgTextInput> createState() => _YgTextInputState();
}

class _YgTextInputState extends State<YgTextInput> {
  static const Duration _duration = Duration(milliseconds: 200);

  late final FocusNode _focusNode = FocusNode();

  late final TextEditingController _controller = TextEditingController(
    text: widget.initialValue,
  );

  /// Wether to hide the obscured text or not.
  bool _obscureTextToggled = true;

  bool _focused = false;

  final bool _containsError = false;

  bool _hovered = false;

  // late bool _disabled = widget.disabled;

  bool _isEmpty = true;

  @override
  void initState() {
    _focusNode.addListener(_focusChanged);
    _controller.addListener(_valueUpdated);
    _valueUpdated();
    super.initState();
  }

  void _valueUpdated() {
    final bool isEmpty = _controller.text.isEmpty;

    if (isEmpty != _isEmpty) {
      _isEmpty = isEmpty;
      setState(() {});
    }
  }

  void _focusChanged() {
    final bool focused = _focusNode.hasFocus;
    if (focused != _focused) {
      _focused = focused;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final Widget layout = RepaintBoundary(
      child: SizedBox(
        height: 60,
        child: Stack(
          children: <Widget>[
            if (widget.outlined)
              AnimatedContainer(
                duration: _duration,
                decoration: BoxDecoration(
                  color: _backgroundColor,
                  border: _border,
                  borderRadius: _theme.borderRadius,
                ),
              ),
            if (!widget.outlined)
              AnimatedContainer(
                duration: _duration,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: _border.bottom,
                  ),
                ),
              ),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              height: _valueTextStyle.height! * _valueTextStyle.fontSize!,
                              child: _getValueText(),
                            ),
                          ),
                          AnimatedAlign(
                            duration: _duration,
                            alignment: _labelAlignment,
                            child: AnimatedDefaultTextStyle(
                              duration: _duration,
                              style: _labelTextStyle,
                              child: Text(
                                widget.label,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    _computedSuffix
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

    if (widget.disabled) {
      return layout;
    }

    return MouseRegion(
      onEnter: (_) {
        if (!_hovered) {
          _hovered = true;
          setState(() {});
        }
      },
      onExit: (_) {
        if (_hovered) {
          _hovered = false;
          setState(() {});
        }
      },
      cursor: SystemMouseCursors.text,
      child: GestureDetector(
        onTap: _handleTap,
        child: layout,
      ),
    );
  }

  Border get _border {
    if (widget.disabled) {
      return _theme.borderDisabled;
    }

    if (_containsError) {
      return _theme.borderError;
    }

    if (_focused) {
      return _theme.borderFocus;
    }

    if (_hovered) {
      return _theme.borderHover;
    }

    return _theme.borderDefault;
  }

  Widget _getValueText() {
    if (widget.disabled) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          _controller.text,
          style: _valueTextStyle,
        ),
      );
    }

    return EditableText(
      focusNode: _focusNode,
      backgroundCursorColor: _theme.cursorColor,
      controller: _controller,
      cursorColor: _theme.cursorColor,
      style: _valueTextStyle,
      obscureText: _obscureText,
      cursorHeight: _valueTextStyle.fontSize,
      cursorOffset: Offset(
        0,
        _valueTextStyle.fontSize! * 0.375,
      ),
      selectionColor: _theme.cursorColor,
      cursorWidth: 1,
    );
  }

  YgTextInputTheme get _theme => context.textInputTheme;

  bool get _floatLabel => _focused || !_isEmpty || widget.placeholder?.isNotEmpty == true;

  Alignment get _labelAlignment {
    if (_floatLabel) {
      return Alignment.topLeft;
    }

    return Alignment.centerLeft;
  }

  Color get _backgroundColor {
    if (widget.disabled) {
      return _theme.backgroundDisabledColor;
    }
    if (_containsError) {
      return _theme.backgroundErrorColor;
    }
    return _theme.backgroundDefaultColor;
  }

  TextStyle get _labelTextStyle {
    final TextStyle baseStyle = _floatLabel ? _theme.labelFocusFilledTextStyle : _theme.labelDefaultTextStyle;

    if (widget.disabled) {
      return baseStyle.copyWith(
        color: _theme.labelDisabledColor,
      );
    }

    if (_focused || !_isEmpty) {
      return baseStyle.copyWith(
        color: _theme.labelFocusFilledColor,
      );
    }

    return baseStyle.copyWith(
      color: _theme.labelDefaultColor,
    );
  }

  TextStyle get _valueTextStyle {
    final TextStyle baseStyle = _theme.valueTextStyle;

    if (widget.disabled) {
      return baseStyle.copyWith(
        color: _theme.valueDisabledColor,
      );
    }

    return baseStyle.copyWith(
      color: _theme.valueDefaultColor,
    );
  }

  void _handleTap() {
    if (!_focusNode.hasFocus) {
      _focusNode.requestFocus();
    }
  }

  bool get _obscureText {
    if (!widget.obscureText) {
      return false;
    }

    if (!widget.showPasswordButton) {
      return true;
    }

    return _obscureTextToggled;
  }

  Widget get _computedSuffix {
    Widget? suffix = widget.trailingIcon;

    if (suffix == null && widget.obscureText && widget.showPasswordButton) {
      suffix = YgIcon(
        _suffixIcon,
        onTap: () {
          _obscureTextToggled ^= true;
          setState(() {});
        },
      );
    }

    if (suffix != null) {
      return YgDefaultIconStyle(
        tapSize: YgIconTapSize.larger,
        color: _suffixIconColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: suffix,
        ),
      );
    }

    return const SizedBox();
  }

  Color get _suffixIconColor {
    if (widget.disabled) {
      return _theme.iconDisabledColor;
    }

    return _theme.iconDefaultColor;
  }

  String get _suffixIcon {
    if (_obscureTextToggled) {
      return YgIcons.eyeOpen;
    }

    return YgIcons.eyeClosed;
  }
}
