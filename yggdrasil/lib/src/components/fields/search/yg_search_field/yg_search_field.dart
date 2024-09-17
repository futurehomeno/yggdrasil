import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/fields/enums/_enums.dart';
import 'package:yggdrasil/src/components/fields/search/yg_search_controller.dart';
import 'package:yggdrasil/src/components/fields/yg_field_state.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import '../models/yg_search_result.dart';

class YgSearchField<T> extends StatefulWidget {
  const YgSearchField({
    super.key,
    required this.disabled,
    required this.results,
    required this.controller,
    required this.initialValue,
    required this.focusNode,
    required this.autocorrect,
    required this.completeAction,
    required this.error,
    required this.inputFormatters,
    required this.keyboardType,
    required this.label,
    required this.onEditingComplete,
    required this.onFocusChanged,
    required this.onSearchChanged,
    required this.placeholder,
    required this.readOnly,
    required this.size,
    required this.textCapitalization,
    required this.textInputAction,
    required this.valueChanged,
    required this.variant,
  });

  final List<YgSearchResult<T>>? results;
  final YgSearchController controller;

  /// Triggers whenever there's a change to the text field value.
  final ValueChanged<String>? onSearchChanged;

  final ValueChanged<T>? valueChanged;

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

  /// The type of action button to use for the keyboard.
  final TextInputAction textInputAction;

  /// The placeholder shown in the text field.
  ///
  /// Gets replaced with the value entered by the user if the value is not empty.
  final String? placeholder;

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

  /// The initial value of the text field.
  final String? initialValue;

  /// The action to perform when the user completes editing the field.
  ///
  /// By default based on the [textInputAction].
  final YgCompleteAction? completeAction;

  @override
  State<YgSearchField<T>> createState() => _YgSearchFieldState<T>();
}

class _YgSearchFieldState<T> extends StateWithYgState<YgSearchField<T>, YgFieldState> with YgControllerManagerMixin {
  /// Manages the controller of this widget.
  late final YgControllerManager<YgSearchController> _controllerManager = manageController(
    createController: () => YgSearchController(text: widget.initialValue),
    getUserController: () => widget.controller,
  );

  /// Manages the [FocusNode] of this widget.
  late final YgControllerManager<FocusNode> _focusNodeManager = manageController(
    createController: () => FocusNode(),
    getUserController: () => widget.focusNode,
  );

  @override
  YgFieldState createState() {
    return YgFieldState(
      filled: _controllerManager.value.text.isNotEmpty,
      placeholder: widget.placeholder != null,
      error: widget.error != null,
      disabled: widget.disabled,
      suffix: true,
      variant: widget.variant,
      size: widget.size,
    );
  }

  @override
  void updateState() {
    state.disabled.value = widget.disabled;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
