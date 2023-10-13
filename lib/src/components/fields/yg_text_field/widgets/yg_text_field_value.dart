import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yggdrasil/src/components/fields/enums/yg_field_state.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgTextFieldValue extends StatelessWidget {
  const YgTextFieldValue({
    super.key,
    required this.statesController,
    required this.obscureText,
    required this.maxLines,
    required this.minLines,
    required this.keyboardType,
    required this.autocorrect,
    required this.textCapitalization,
    required this.readOnly,
    required this.inputFormatters,
    required this.onChanged,
    required this.onEditingComplete,
    required this.textInputAction,
    required this.focusNode,
    required this.controller,
  });

  final FocusNode focusNode;
  final TextEditingController controller;
  final YgStatesController<YgFieldState> statesController;
  final bool obscureText;
  final int? maxLines;
  final int? minLines;
  final TextInputType keyboardType;
  final bool autocorrect;
  final TextCapitalization textCapitalization;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final VoidCallback onEditingComplete;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return YgStatesBuilder<YgFieldState>(
      controller: statesController,
      filter: const <YgFieldState>{
        YgFieldState.disabled,
      },
      builder: (BuildContext context, Set<YgFieldState> states) {
        final YgFieldContentTheme theme = context.fieldTheme.contentTheme;

        final TextStyle baseStyle = DefaultTextStyle.of(context).style;

        if (states.contains(YgFieldState.disabled)) {
          final int? minLines = this.minLines;

          Widget text = Text(
            controller.text,
            maxLines: maxLines,
          );

          if (minLines != null && minLines > 1) {
            text = ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: baseStyle.computedHeight * minLines,
              ),
              child: text,
            );
          }

          return Align(
            alignment: Alignment.centerLeft,
            child: text,
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
          obscureText: obscureText,
          cursorHeight: baseStyle.fontSize,
          cursorOffset: _getCursorOffset(theme),
          selectionColor: theme.cursorColor,
          cursorWidth: 1.0,
          keyboardType: keyboardType,
          autocorrect: autocorrect,
          textCapitalization: textCapitalization,
          readOnly: readOnly,
          maxLines: maxLines,
          minLines: minLines,
          inputFormatters: inputFormatters,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          textInputAction: textInputAction,
        );
      },
    );
  }

  Offset _getCursorOffset(YgFieldContentTheme theme) {
    final TextStyle style = theme.valueTextStyle;

    return Offset(
      0.0,
      (style.computedHeight - style.fontSize!) / 2,
    );
  }
}
