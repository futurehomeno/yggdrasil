import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

class YgEditableText extends StatelessWidget {
  const YgEditableText({
    super.key,
    required this.editableTextKey,
    required this.disabled,
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
    required this.cursorColor,
  });

  final GlobalKey<EditableTextState> editableTextKey;
  final FocusNode focusNode;
  final TextEditingController controller;
  final bool obscureText;
  final int? maxLines;
  final int? minLines;
  final TextInputType keyboardType;
  final bool autocorrect;
  final TextCapitalization textCapitalization;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final TextInputAction textInputAction;
  final SelectionChangedCallback onSelectionChanged;
  final VoidCallback onSelectionHandleTapped;
  final EditableTextContextMenuBuilder contextMenuBuilder;
  final bool showSelectionHandles;
  final bool disabled;
  final Color cursorColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: focusNode,
      builder: (BuildContext context, Widget? child) {
        // We inherit the TextStyle from YgFieldDecoration.
        final TextStyle baseStyle = DefaultTextStyle.of(context).style;

        if (disabled) {
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

        // Calculate the offset of the cursor so it is centered on the height of
        // the text.
        final Offset cursorOffset = Offset(
          0.0,
          (baseStyle.computedHeight - baseStyle.fontSize!) / 2,
        );

        return EditableText(
          key: editableTextKey,
          focusNode: focusNode,
          enableInteractiveSelection: true,
          backgroundCursorColor: cursorColor,
          controller: controller,
          cursorColor: cursorColor,
          style: baseStyle,
          obscureText: obscureText,
          cursorHeight: baseStyle.fontSize,
          cursorOffset: cursorOffset,
          selectionColor: focusNode.hasFocus ? cursorColor.withOpacity(0.4) : null,
          cursorWidth: 1.0,
          keyboardType: keyboardType,
          autocorrect: autocorrect,
          textCapitalization: textCapitalization,
          readOnly: readOnly || disabled,
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
