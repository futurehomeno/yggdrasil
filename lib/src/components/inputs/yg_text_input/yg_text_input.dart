import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

enum YgTextInputVariant {
  standard,
  outline,
}

class YgTextInput extends StatefulWidget {
  YgTextInput({
    required this.fieldKey,
    required this.label,
    this.obscureText = false,
    this.showPasswordButton = true,
    this.validators,
    this.variant = YgTextInputVariant.standard,
    this.placeholder,
    this.suffix,
    this.initialValue,
    this.controller,
  }) : super(
          key: ValueKey<TextFieldKey>(fieldKey),
        );

  /// Obscures the text in the input.
  ///
  /// If [showPasswordButton] is set to true (the default value) and the
  /// [suffix] is empty, there will be a suffix button added which will show
  /// the text in the input when pressed.
  final bool obscureText;

  /// Shows a button to toggle obscuring the text.
  ///
  /// Will only work when [obscureText] is set to true and [suffix] is set to
  /// null.
  final bool showPasswordButton;

  /// A list of [TextValidator]s which validate user input.
  ///
  /// Will validate the input in the order the validators were added to the
  /// list. Will only show the first error.
  final List<TextValidator>? validators;

  /// The variant of the input.
  final YgTextInputVariant variant;

  /// The label shown on top of the input.
  final String label;

  /// The placeholder shown in the input.
  ///
  /// Gets replaced with the value entered by the user if the value is not empty.
  final String? placeholder;

  /// The suffix shown in the input.
  final Widget? suffix;

  /// The initial value.
  final String? initialValue;

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
  /// Wether to hide the obscured text or not.
  bool _obscureTextToggled = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldKey,
      controller: widget.controller,
      obscureText: _obscureText,
      initialValue: widget.initialValue ?? (widget.controller == null ? '' : null),
      decoration: InputDecoration(
        label: Text(
          widget.label,
        ),
        suffix: _computedSuffix,
        floatingLabelStyle: const TextStyle(),
        labelStyle: const TextStyle(),
      ),
      validator: YgInputValidatorCombiner<String>(
        validators: widget.validators,
      ),
    );
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

  Widget? get _computedSuffix {
    if (widget.suffix != null) {
      return widget.suffix;
    }

    if (widget.obscureText && widget.showPasswordButton) {
      return IconButton(
        onPressed: () {
          _obscureTextToggled ^= true;
          setState(() {});
        },
        icon: _suffixIcon,
      );
    }
    return null;
  }

  Widget get _suffixIcon {
    if (_obscureTextToggled) {
      // TODO(Tim): Add the icon to hide the password.
      return const Icon(Icons.remove_red_eye);
    }

    // TODO(Tim): Add the icon to show the password.
    return const Icon(Icons.remove_red_eye_outlined);
  }
}
