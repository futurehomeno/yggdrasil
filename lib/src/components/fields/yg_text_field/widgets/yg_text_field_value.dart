import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import '../../yg_field_state.dart';

class YgTextFieldValue extends StatelessWidget {
  const YgTextFieldValue({
    super.key,
    required this.editableTextKey,
    required this.state,
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
    required this.onSelectionChanged,
    required this.onSelectionHandleTapped,
    required this.contextMenuBuilder,
    required this.showSelectionHandles,
  });

  final GlobalKey<EditableTextState> editableTextKey;
  final FocusNode focusNode;
  final TextEditingController controller;
  final YgFieldState state;
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
  final SelectionChangedCallback onSelectionChanged;
  final VoidCallback onSelectionHandleTapped;
  final EditableTextContextMenuBuilder contextMenuBuilder;
  final bool showSelectionHandles;

  @override
  Widget build(BuildContext context) {
    return YgAnimatedBuilder(
      properties: <Listenable?>{
        state.disabled,
        state.focused,
      },
      builder: (BuildContext context, Widget? child) {
        final YgFieldContentTheme theme = context.fieldTheme.contentTheme;

        // We inherit the TextStyle from YgFieldDecoration.
        final TextStyle baseStyle = DefaultTextStyle.of(context).style;

        if (state.disabled.value) {
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

        final Offset cursorOffset = Offset(
          0.0,
          (baseStyle.computedHeight - baseStyle.fontSize!) / 2,
        );

        return EditableText(
          key: editableTextKey,
          focusNode: focusNode,
          enableInteractiveSelection: true,
          backgroundCursorColor: theme.cursorColor,
          controller: controller,
          cursorColor: theme.cursorColor,
          style: baseStyle.copyWith(
            color: theme.valueDefaultColor,
          ),
          obscureText: obscureText,
          cursorHeight: baseStyle.fontSize,
          cursorOffset: cursorOffset,
          selectionColor: state.focused.value ? theme.cursorColor.withOpacity(0.4) : null,
          cursorWidth: 1.0,
          keyboardType: keyboardType,
          autocorrect: autocorrect,
          textCapitalization: textCapitalization,
          readOnly: readOnly || state.disabled.value,
          maxLines: maxLines,
          minLines: minLines,
          inputFormatters: inputFormatters,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          textInputAction: textInputAction,
          showCursor: true,
          mouseCursor: MouseCursor.defer, // TextField will handle the cursor
          selectionControls: materialTextSelectionHandleControls,
          restorationId: 'editable',
          rendererIgnoresPointer: true,
          onSelectionChanged: onSelectionChanged,
          onSelectionHandleTapped: onSelectionHandleTapped,
          contextMenuBuilder: contextMenuBuilder,
          showSelectionHandles: showSelectionHandles,
        );
      },
    );
  }
}
