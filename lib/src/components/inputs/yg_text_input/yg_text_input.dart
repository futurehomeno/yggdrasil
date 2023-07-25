import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yggdrasil/src/theme/extensions/_extensions.dart';
import 'package:yggdrasil/yggdrasil.dart';

enum YgTextInputSize {
  medium,
  large,
}

enum YgTextInputVariant {
  outlined,
  standard,
}

class YgTextInput extends StatefulWidget {
  const YgTextInput({
    super.key,
    required this.label,
    this.obscureText = false,
    this.showObscureTextButton = true,
    this.variant = YgTextInputVariant.standard,
    this.placeholder,
    this.trailingIcon,
    this.initialValue,
    this.controller,
    this.disabled = false,
    this.size = YgTextInputSize.large,
    this.keyboardType,
    this.autocorrect = true,
    this.textCapitalization = TextCapitalization.none,
    this.readOnly = false,
    this.maxLines = 1,
    this.inputFormatters,
    this.onChanged,
    this.error,
  });

  /// Obscures the text in the input.
  ///
  /// If [showObscureTextButton] is set to true (the default value) and the
  /// [trailingIcon] is empty, there will be a suffix button added which will show
  /// the text in the input when pressed.
  final bool obscureText;

  /// Shows a button to toggle obscuring the text.
  ///
  /// Will only work when [obscureText] is set to true and [trailingIcon] is set to
  /// null.
  final bool showObscureTextButton;

  final ValueChanged<String>? onChanged;

  /// The variant of the input.
  final YgTextInputVariant variant;

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

  /// Weather the input is disabled.
  ///
  /// Applies styling for the disabled text input. Also disabled all interaction.
  final bool disabled;

  /// The size of the input.
  ///
  /// Primarily affects the height of the input.
  final YgTextInputSize size;

  /// The type of keyboard to use for editing the text.
  ///
  /// Defaults to [TextInputType.text] if [maxLines] is one and
  /// [TextInputType.multiline] otherwise.
  final TextInputType? keyboardType;

  /// When true enables autocorrect.
  ///
  /// !--- IMPORTANT ---
  /// Remember to turn this off for things like email and similar where
  /// autocorrect gets in the way.
  final bool autocorrect;

  /// {@macro flutter.widgets.editableText.readOnly}
  final bool readOnly;

  /// {@macro flutter.widgets.editableText.textCapitalization}
  final TextCapitalization textCapitalization;

  /// {@macro flutter.widgets.editableText.maxLines}
  final int maxLines;

  /// The error to display under the input.
  ///
  /// Will change the styling of the widget to reflect the presence of the error.
  /// Must be null when there is no error, an empty string is still seen as an
  /// valid error.
  final String? error;

  /// Determines what's allowed to enter into the field.
  ///
  /// See [FhInputFormatters].
  final List<TextInputFormatter>? inputFormatters;

  /// Controls the text being edited.
  ///
  /// When defined will overwrite the [initialValue].
  final TextEditingController? controller;

  @override
  State<YgTextInput> createState() => _YgTextInputState();
}

class _YgTextInputState extends State<YgTextInput> {
  final UniqueKey _valueKey = UniqueKey();
  final UniqueKey _placeholderKey = UniqueKey();
  final UniqueKey _labelKey = UniqueKey();

  static const Duration _duration = Duration(milliseconds: 200);

  late final FocusNode _focusNode = FocusNode();

  late final TextEditingController _controller = TextEditingController(
    text: widget.initialValue,
  );

  /// Wether to hide the obscured text or not.
  bool _obscureTextToggled = true;

  bool _focused = false;

  bool get _containsError => widget.error != null;

  bool _hovered = false;

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
    final String? placeholder = widget.placeholder;
    final double labelFloatingHeight = _labelFloatingHeight;

    final Widget layout = RepaintBoundary(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Positioned.fill(
                child: switch (widget.variant) {
                  YgTextInputVariant.outlined => AnimatedContainer(
                      duration: _duration,
                      curve: Curves.easeOut,
                      decoration: BoxDecoration(
                        color: _backgroundColor,
                        border: _border,
                        borderRadius: _theme.borderRadius,
                      ),
                    ),
                  YgTextInputVariant.standard => AnimatedContainer(
                      duration: _duration,
                      curve: Curves.easeOut,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: _border.bottom,
                        ),
                      ),
                    )
                },
              ),
              Padding(
                padding: _labelValueContainerPadding,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Stack(
                        children: <Widget>[
                          if (placeholder != null && _isEmpty)
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
                            duration: _duration,
                            curve: Curves.easeOut,
                            offset: _labelOffset,
                            child: AnimatedDefaultTextStyle(
                              duration: _duration,
                              curve: Curves.easeOut,
                              style: _labelTextStyle,
                              child: Text(
                                widget.label,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    _computedSuffix
                  ],
                ),
              ),
            ],
          ),
          _errorMessageWidget,
        ],
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

  EdgeInsets get _labelValueContainerPadding {
    final double paddingSize = switch (widget.size) {
      YgTextInputSize.large => 12,
      YgTextInputSize.medium => 7,
    };

    return EdgeInsets.symmetric(
      vertical: paddingSize,
      horizontal: switch (widget.variant) {
        YgTextInputVariant.outlined => 12,
        YgTextInputVariant.standard => 0,
      },
    );
  }

  Widget get _errorMessageWidget {
    if (widget.disabled || !_containsError) {
      return const SizedBox(height: 20);
    }

    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        children: <Widget>[
          YgIcon(
            YgIcons.error,
            size: YgIconSize.small,
            color: _theme.errorIconColor,
          ),
          Text(
            'Error Message',
            style: _theme.errorTextStyle,
          )
        ].withHorizontalSpacing(4),
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
          maxLines: widget.maxLines,
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
      cursorOffset: _cursorOffset,
      selectionColor: _theme.cursorColor,
      cursorWidth: 1,
      keyboardType: widget.keyboardType,
      autocorrect: widget.autocorrect,
      textCapitalization: widget.textCapitalization,
      readOnly: widget.readOnly,
      maxLines: widget.maxLines,
      inputFormatters: widget.inputFormatters,
      onChanged: widget.onChanged,
    );
  }

  TextStyle get _placeholderTextStyle {
    if (widget.disabled) {
      return _theme.placeholderTextStyle.copyWith(
        color: _theme.placeholderDisabledColor,
      );
    }

    return _theme.placeholderTextStyle.copyWith(
      color: _theme.placeholderDefaultColor,
    );
  }

  Offset get _cursorOffset {
    final TextStyle style = _theme.valueTextStyle;

    return Offset(
      0,
      (style.computedHeight - style.fontSize!) / 2,
    );
  }

  YgTextInputTheme get _theme => context.textInputTheme;

  bool get _floatLabel => _focused || !_isEmpty || widget.placeholder?.isNotEmpty == true;

  double get _labelFloatingHeight => _theme.labelFocusFilledTextStyle.computedHeight;

  Offset get _labelOffset {
    if (_floatLabel) {
      return Offset.zero;
    }

    final double labelFloatingHeight = _labelFloatingHeight;
    final double labelDefaultHeight = _theme.labelDefaultTextStyle.computedHeight;
    final double valueDefaultHeight = _theme.valueTextStyle.computedHeight;

    final double combinedHeight = labelFloatingHeight + valueDefaultHeight;

    return Offset(
      0,
      ((combinedHeight / labelDefaultHeight) - 1) / 2,
    );
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

    if (!widget.showObscureTextButton) {
      return true;
    }

    return _obscureTextToggled;
  }

  Widget get _computedSuffix {
    Widget? suffix = widget.trailingIcon;

    if (suffix == null && widget.obscureText && widget.showObscureTextButton) {
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
