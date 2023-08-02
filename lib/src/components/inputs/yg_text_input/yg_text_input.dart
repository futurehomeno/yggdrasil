import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'widgets/_widgets.dart';

enum YgTextInputStates {
  error,
  hovered,
  focused,
  disabled,
  suffix,
  large,
}

class YgTextInput extends YgTextInputWidget with StatefulWidgetDebugMixin {
  const YgTextInput({
    super.key,
    super.controller,
    super.focusNode,
    required this.label,
    this.error,
    this.onChanged,
    this.placeholder,
    this.trailingIcon,
    this.keyboardType,
    this.inputFormatters,
    this.maxLines = 1,
    this.disabled = false,
    this.readOnly = false,
    this.autocorrect = true,
    this.obscureText = false,
    this.showObscureTextButton = true,
    this.size = YgTextInputSize.large,
    this.variant = YgTextInputVariant.standard,
    this.textCapitalization = TextCapitalization.none,
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

  @override
  State<YgTextInput> createState() => _YgTextInputState();
}

class _YgTextInputState extends YgTextInputWidgetState<YgTextInput> {
  /// Wether to hide the obscured text or not.
  bool _obscureTextToggled = true;

  /// wether the input is being hovered over.
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final Widget? suffix = _buildSuffix();

    final Widget layout = RepaintBoundary(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          YgTextInputDecoration(
            variant: widget.variant,
            controller: widget.controller,
            disabled: widget.disabled,
            error: widget.error != null,
            focusNode: focusNode,
            hovered: _hovered,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: _getContentPadding(suffix != null),
                    child: YgTextInputContent(
                      controller: widget.controller,
                      disabled: widget.disabled,
                      focusNode: focusNode,
                      label: widget.label,
                      obscureText: _obscureText,
                      placeholder: widget.placeholder,
                      maxLines: widget.maxLines,
                      autocorrect: widget.autocorrect,
                      inputFormatters: widget.inputFormatters,
                      keyboardType: widget.keyboardType,
                      onChanged: widget.onChanged,
                      readOnly: widget.readOnly,
                      textCapitalization: widget.textCapitalization,
                    ),
                  ),
                ),
                if (suffix != null) suffix,
              ],
            ),
          ),
          _buildErrorMessage(),
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

  Widget _buildErrorMessage() {
    final String? error = widget.error;

    if (widget.disabled || error == null) {
      return const SizedBox(height: 20);
    }

    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        children: <Widget>[
          YgIcon(
            YgIcons.error,
            size: YgIconSize.small,
            color: theme.errorIconColor,
          ),
          Text(
            error,
            style: theme.errorTextStyle,
          )
        ].withHorizontalSpacing(4),
      ),
    );
  }

  EdgeInsets _getContentPadding(bool suffix) {
    final EdgeInsets padding = EdgeInsets.symmetric(
      vertical: switch (widget.size) {
        YgTextInputSize.large => 12,
        YgTextInputSize.medium => 7,
      },
      horizontal: switch (widget.variant) {
        YgTextInputVariant.outlined => 12,
        YgTextInputVariant.standard => 0,
      },
    );

    if (!suffix) {
      return padding;
    }

    return padding.copyWith(
      right: 0,
    );
  }

  void _handleTap() {
    if (!focusNode.hasFocus) {
      focusNode.requestFocus();
    }
  }

  Widget? _buildSuffix() {
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
        tapSize: YgIconTapSize.largest,
        color: _suffixIconColor,
        child: suffix,
      );
    }

    return null;
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

  Color get _suffixIconColor {
    if (widget.disabled) {
      return theme.iconDisabledColor;
    }

    return theme.iconDefaultColor;
  }

  String get _suffixIcon {
    if (_obscureTextToggled) {
      return YgIcons.eyeOpen;
    }

    return YgIcons.eyeClosed;
  }
}
