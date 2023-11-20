import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yggdrasil/src/components/fields/helpers/yg_validate_helper.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

import '../widgets/_widgets.dart';
import '../yg_field_state.dart';
import 'widgets/_widgets.dart';

class YgTextField extends StatefulWidget with StatefulWidgetDebugMixin {
  const YgTextField({
    super.key,
    required this.label,
    required this.keyboardType,
    required this.textInputAction,
    required this.autocorrect,
    required this.textCapitalization,
    this.controller,
    this.focusNode,
    this.error,
    this.onChanged,
    this.placeholder,
    this.suffix,
    this.inputFormatters,
    this.onSuffixPressed,
    this.onEditingComplete,
    this.onFocusChanged,
    this.maxLines = 1,
    this.minLines,
    this.disabled = false,
    this.readOnly = false,
    this.obscureText = false,
    this.showObscureTextButton = true,
    this.size = YgFieldSize.large,
    this.variant = YgFieldVariant.standard,
    this.initialValue,
    this.completeAction,
  })  : assert(
          maxLines == null || minLines == null || maxLines >= minLines,
          'When both minLines and maxLines are set, maxLines should be equal or higher than minLines',
        ),
        assert(
          suffix == null || showObscureTextButton == false || obscureText == false,
          'Can not add a suffix if showObscureTextButton and obscureText are set to true',
        ),
        assert(
          (suffix == null) == (onSuffixPressed == null),
          'Suffix and onSuffixPressed should either be both null or both defined',
        );

  const YgTextField.email({
    super.key,
    required this.label,
    required this.textInputAction,
    this.controller,
    this.focusNode,
    this.error,
    this.onChanged,
    this.placeholder,
    this.suffix,
    this.inputFormatters,
    this.onSuffixPressed,
    this.onEditingComplete,
    this.onFocusChanged,
    this.disabled = false,
    this.readOnly = false,
    this.size = YgFieldSize.large,
    this.variant = YgFieldVariant.standard,
    this.initialValue,
    this.completeAction,
  })  : maxLines = 1,
        minLines = null,
        obscureText = false,
        showObscureTextButton = false,
        autocorrect = false,
        textCapitalization = TextCapitalization.none,
        keyboardType = TextInputType.emailAddress,
        assert(
          (suffix == null) == (onSuffixPressed == null),
          'Suffix and onSuffixPressed should either be both null or both defined',
        );

  const YgTextField.password({
    super.key,
    required this.label,
    required this.textInputAction,
    this.controller,
    this.focusNode,
    this.error,
    this.onChanged,
    this.placeholder,
    this.suffix,
    this.inputFormatters,
    this.onSuffixPressed,
    this.onEditingComplete,
    this.onFocusChanged,
    this.disabled = false,
    this.readOnly = false,
    this.showObscureTextButton = true,
    this.size = YgFieldSize.large,
    this.variant = YgFieldVariant.standard,
    this.initialValue,
    this.completeAction,
  })  : maxLines = 1,
        minLines = null,
        obscureText = true,
        autocorrect = false,
        textCapitalization = TextCapitalization.none,
        keyboardType = TextInputType.text,
        assert(
          suffix == null || showObscureTextButton == false,
          'Can not add a suffix if showObscureTextButton is set to true',
        ),
        assert(
          (suffix == null) == (onSuffixPressed == null),
          'Suffix and onSuffixPressed should either be both null or both defined',
        );

  const YgTextField.multiline({
    super.key,
    required this.label,
    this.controller,
    this.focusNode,
    this.error,
    this.onChanged,
    this.placeholder,
    this.suffix,
    this.inputFormatters,
    this.onSuffixPressed,
    this.onEditingComplete,
    this.onFocusChanged,
    this.minLines,
    this.maxLines,
    this.disabled = false,
    this.readOnly = false,
    this.size = YgFieldSize.large,
    this.variant = YgFieldVariant.standard,
    this.initialValue,
    this.completeAction,
  })  : obscureText = false,
        autocorrect = true,
        textCapitalization = TextCapitalization.sentences,
        keyboardType = TextInputType.text,
        showObscureTextButton = false,
        textInputAction = TextInputAction.newline,
        assert(
          maxLines == null || maxLines > 1,
          'maxLines should be null or higher than 1, for a single line text field use a different constructor.',
        ),
        assert(
          maxLines == null || minLines == null || maxLines >= minLines,
          'When both minLines and maxLines are set, maxLines should be equal or higher than minLines',
        ),
        assert(
          (suffix == null) == (onSuffixPressed == null),
          'Suffix and onSuffixPressed should either be both null or both defined',
        );

  /// Obscures the text in the text field.
  ///
  /// If [showObscureTextButton] is set to true (the default value) and the
  /// [suffix] is empty, there will be a suffix button added which will show
  /// the text in the text field when pressed.
  final bool obscureText;

  /// Shows a button to toggle obscuring the text.
  ///
  /// Will only work when [obscureText] is set to true and [suffix] is set to
  /// null.
  ///
  /// Has to be set to false if [obscureText] is set to true and a suffix is
  /// provided.
  final bool showObscureTextButton;

  /// Triggers whenever there's a change to the text field value.
  final ValueChanged<String>? onChanged;

  /// The variant of the text field.
  final YgFieldVariant variant;

  /// The label shown on top of the text field.
  final String label;

  /// Called when the user submits editable content (e.g., user presses the "done"
  /// button on the keyboard).
  ///
  /// The default implementation of [onEditingComplete] executes 2 different
  /// behaviors based on the situation:
  ///
  ///  - When a completion action is pressed, such as "done", "go", "send", or
  ///    "search", the user's content is submitted to the [controller] and then
  ///    focus is given up.
  ///
  ///  - When a non-completion action is pressed, such as "next" or "previous",
  ///    the user's content is submitted to the [controller], but focus is not
  ///    given up because developers may want to immediately move focus to
  ///    another text field widget within [onSubmitted].
  ///
  /// Providing [onEditingComplete] prevents the aforementioned default behavior.
  final VoidCallback? onEditingComplete;

  /// Called when the widget gains or loses focus.
  final ValueChanged<bool>? onFocusChanged;

  /// Called when the user presses the [suffix].
  ///
  /// !--- IMPORTANT ---
  /// If [onSuffixPressed] is defined [suffix] also has to be defined.
  final VoidCallback? onSuffixPressed;

  /// The type of action button to use for the keyboard.
  final TextInputAction textInputAction;

  /// The placeholder shown in the text field.
  ///
  /// Gets replaced with the value entered by the user if the value is not empty.
  final String? placeholder;

  /// The suffix shown in the text field.
  ///
  /// !--- IMPORTANT ---
  /// You can not add a suffix if [showObscureTextButton] and [obscureText] are
  /// set to true!
  ///
  /// !--- IMPORTANT ---
  /// If [suffix] is defined [onSuffixPressed] also has to be defined.
  final YgIcon? suffix;

  /// Whether the text field is disabled.
  ///
  /// Applies styling for the disabled text text field. Also disables all interaction.
  final bool disabled;

  /// The size of the text field.
  ///
  /// Primarily affects the height of the text field.
  final YgFieldSize size;

  /// The type of keyboard to use for editing the text.
  final TextInputType keyboardType;

  /// When true enables autocorrect.
  final bool autocorrect;

  /// Whether the text can be changed.
  ///
  /// When this is set to true, the text cannot be modified
  /// by any shortcut or keyboard operation. The text is still selectable.
  ///
  /// Defaults to false. Must not be null.
  final bool readOnly;

  /// Configures how the platform keyboard will select an uppercase or
  /// lowercase keyboard.
  ///
  /// Only supports text keyboards, other keyboard types will ignore this
  /// configuration. Capitalization is locale-aware.
  ///
  /// Defaults to [TextCapitalization.none]. Must not be null.
  ///
  /// See also:
  ///
  ///  * [TextCapitalization], for a description of each capitalization behavior.
  final TextCapitalization textCapitalization;

  /// The maximum number of lines to show at one time, wrapping if necessary.
  ///
  /// This affects the height of the field itself and does not limit the number
  /// of lines that can be entered into the field.
  ///
  /// If this is 1 (the default), the text will not wrap, but will scroll
  /// horizontally instead.
  ///
  /// If this is null, there is no limit to the number of lines, and the text
  /// container will start with enough vertical space for one line and
  /// automatically grow to accommodate additional lines as they are entered, up
  /// to the height of its constraints.
  ///
  /// If this is not null, the value must be greater than zero, and it will lock
  /// the text field to the given number of lines and take up enough horizontal space
  /// to accommodate that number of lines. Setting [minLines] as well allows the
  /// text field to grow and shrink between the indicated range.
  final int? maxLines;

  /// The minimum number of lines to occupy when the content spans fewer lines.
  ///
  /// This affects the height of the field itself and does not limit the number
  /// of lines that can be entered into the field.
  ///
  /// If this is null (default), text container starts with enough vertical space
  /// for one line and grows to accommodate additional lines as they are entered.
  ///
  /// This can be used in combination with [maxLines] for a varying set of behaviors.
  ///
  /// If the value is set, it must be greater than zero. If the value is greater
  /// than 1, [maxLines] should also be set to either null or greater than
  /// this value.
  ///
  /// When [maxLines] is set as well, the height will grow between the indicated
  /// range of lines. When [maxLines] is null, it will grow as high as needed,
  /// starting from [minLines].
  final int? minLines;

  /// The error to display under the text field.
  ///
  /// Will change the styling of the widget to reflect the presence of the error.
  /// Must be null when there is no error, an empty string is still seen as an
  /// valid error.
  final String? error;

  /// Determines what's allowed to enter into the field.
  ///
  /// See [FhInputFormatters].
  final List<TextInputFormatter>? inputFormatters;

  /// Controls the focus of the widget.
  final FocusNode? focusNode;

  /// Controls the text being edited.
  ///
  /// When defined will overwrite the [initialValue].
  final TextEditingController? controller;

  /// The initial value of the text field.
  final String? initialValue;

  /// The action to perform when the user completes editing the field.
  ///
  /// By default based on the [textInputAction].
  final YgCompleteAction? completeAction;

  @override
  State<YgTextField> createState() => _YgTextFieldState();

  @override
  YgDebugType get debugType {
    if (disabled) {
      return YgDebugType.other;
    }

    return YgDebugType.intractable;
  }
}

class _YgTextFieldState extends State<YgTextField> {
  /// The state of the field.
  late final YgFieldState _state = YgFieldState(
    filled: _controller.text.isNotEmpty == true,
    placeholder: widget.placeholder != null,
    error: widget.error != null,
    disabled: widget.disabled,
    suffix: _hasSuffix,
  );

  /// Whether to hide the obscured text or not.
  bool _obscureTextToggled = true;

  /// The current [FocusNode].
  late FocusNode _focusNode = widget.focusNode ?? FocusNode();

  /// The current [TextEditingController].
  late TextEditingController _controller = widget.controller ?? _createController();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_focusChanged);
    _controller.addListener(_valueUpdated);
  }

  @override
  void didUpdateWidget(covariant YgTextField oldWidget) {
    final TextEditingController? newController = widget.controller;
    final FocusNode? newFocusNode = widget.focusNode;

    if (newController == null) {
      if (oldWidget.controller != null) {
        _updateController(_createController());
      }
    } else if (newController != _controller) {
      _updateController(newController);
    }

    if (newFocusNode == null) {
      if (oldWidget.focusNode != null) {
        _updateFocusNode(FocusNode());
      }
    } else if (newFocusNode != _focusNode) {
      _updateFocusNode(newFocusNode);
    }

    _state.placeholder.value = widget.placeholder != null;
    _state.error.value = widget.error != null;
    _state.disabled.value = widget.disabled;
    _state.suffix.value = _hasSuffix;
    _state.size.value = widget.size;
    _state.variant.value = widget.variant;

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _state.dispose();
    _controller.removeListener(_valueUpdated);
    if (widget.controller == null) {
      _controller.dispose();
    }
    _focusNode.removeListener(_focusChanged);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Widget layout = RepaintBoundary(
      child: YgFieldDecoration(
        variant: widget.variant,
        size: widget.size,
        error: widget.error,
        state: _state,
        suffix: _buildSuffix(),
        content: YgFieldContent(
          value: YgTextFieldValue(
            autocorrect: widget.autocorrect,
            controller: _controller,
            focusNode: _focusNode,
            inputFormatters: widget.inputFormatters,
            keyboardType: widget.keyboardType,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            obscureText: _obscureText,
            onChanged: widget.onChanged,
            onEditingComplete: _onEditingComplete,
            readOnly: widget.readOnly,
            state: _state,
            textCapitalization: widget.textCapitalization,
            textInputAction: widget.textInputAction,
          ),
          state: _state,
          label: widget.label,
          minLines: widget.minLines,
          placeholder: widget.placeholder,
          floatLabelOnFocus: true,
        ),
      ),
    );

    if (widget.disabled) {
      return layout;
    }

    return MouseRegion(
      onEnter: (_) => _state.hovered.value = true,
      onExit: (_) => _state.hovered.value = false,
      cursor: SystemMouseCursors.text,
      child: GestureDetector(
        onTap: _handleTap,
        child: layout,
      ),
    );
  }

  // TODO(DEV-1916): This should be moved somewhere else to make it reusable.
  void _onEditingComplete() {
    final VoidCallback? onEditingComplete = widget.onEditingComplete;

    if (onEditingComplete != null) {
      onEditingComplete();

      return;
    }

    final YgCompleteAction completeAction =
        widget.completeAction ?? YgValidateHelper.mapTextInputAction(widget.textInputAction);

    switch (completeAction) {
      case YgCompleteAction.focusNext:
        _focusNode.nextFocus();

        return;
      case YgCompleteAction.focusPrevious:
        _focusNode.previousFocus();

        return;
      case YgCompleteAction.unfocus:
        _focusNode.unfocus();

        return;
      case YgCompleteAction.none:
        return;
    }
  }

  Widget? _buildSuffix() {
    YgIcon? suffix = widget.suffix;

    final bool renderShowObscureTextIcon = suffix == null && widget.obscureText && widget.showObscureTextButton;

    if (renderShowObscureTextIcon) {
      suffix = YgIcon(
        _suffixIcon,
      );
    }

    if (suffix != null) {
      return YgIconButton(
        size: YgIconButtonSize.small,
        onPressed: widget.disabled
            ? null
            : () {
                if (renderShowObscureTextIcon) {
                  _obscureTextToggled ^= true;
                  setState(() {});
                } else {
                  widget.onSuffixPressed?.call();
                }
              },
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

  String get _suffixIcon {
    if (_obscureTextToggled) {
      return YgIcons.eyeOpen;
    }

    return YgIcons.eyeClosed;
  }

  bool get _hasSuffix {
    return widget.suffix != null || (widget.obscureText && widget.showObscureTextButton);
  }

  void _updateFocusNode(FocusNode focusNode) {
    _focusNode.removeListener(_focusChanged);
    _focusNode = focusNode;
    _focusNode.addListener(_focusChanged);
  }

  void _updateController(TextEditingController controller) {
    _controller.removeListener(_valueUpdated);
    _controller = controller;
    _controller.addListener(_valueUpdated);
  }

  TextEditingController _createController() => TextEditingController(
        text: widget.initialValue,
      );

  void _valueUpdated() {
    _state.filled.value = _controller.text.isNotEmpty;
  }

  void _focusChanged() {
    final bool focused = _focusNode.hasFocus;
    _state.focused.value = focused;
    widget.onFocusChanged?.call(focused);
  }

  void _handleTap() {
    if (!_focusNode.hasFocus) {
      _focusNode.requestFocus();
    }
  }
}
