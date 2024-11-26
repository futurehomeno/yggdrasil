import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yggdrasil/src/components/fields/helpers/yg_validate_helper.dart';
import 'package:yggdrasil/yggdrasil.dart';

part 'string_search/yg_string_search_form_field.dart';
part 'value_search/yg_value_search_form_field.dart';

abstract class YgSearchFormField<T> extends StatefulWidget implements FormField<T> {
  factory YgSearchFormField({
    YgAutoValidate autoValidate,
    required bool autocorrect,
    YgCompleteAction completeAction,
    YgValueSearchController<T>? controller,
    bool disabled,
    String? error,
    FocusNode? focusNode,
    Widget? hint,
    T? initialValue,
    List<TextInputFormatter>? inputFormatters,
    required FormFieldKey<T> key,
    required TextInputType keyboardType,
    required String label,
    ValueChanged<T>? onChanged,
    VoidCallback? onEditingComplete,
    ValueChanged<bool>? onFocusChanged,
    VoidCallback? onPressed,
    String? placeholder,
    bool readOnly,
    YgSearchAction searchAction,
    required YgSearchProvider<T> searchProvider,
    YgFieldSize size,
    required TextCapitalization textCapitalization,
    List<FormFieldValidator<T>>? validators,
    YgFieldVariant variant,
  }) = _YgValueSearchFormField<T>;

  YgSearchFormField._({
    super.key,
    required this.autocorrect,
    required this.keyboardType,
    required this.label,
    required this.textCapitalization,
    this.focusNode,
    this.hint,
    this.inputFormatters,
    this.onChanged,
    this.onEditingComplete,
    this.onFocusChanged,
    this.onPressed,
    this.placeholder,
    this.initialValue,
    this.disabled = false,
    this.readOnly = false,
    this.variant = YgFieldVariant.standard,
    this.size = YgFieldSize.large,
    this.completeAction = YgCompleteAction.unfocus,
    this.searchAction = YgSearchAction.auto,
    this.autoValidate = YgAutoValidate.disabled,
    List<FormFieldValidator<T>>? validators,
    String? error,
  })  : restorationId = null,
        onSaved = null,
        forceErrorText = error,
        validator = YgValidateHelper.combineValidators<T>(validators),
        autovalidateMode = YgValidateHelper.mapAutoValidate(autoValidate);

  /// Hint widget shown in the top of the search results.
  final Widget? hint;

  /// The action that should be performed when the user presses the search field.
  ///
  /// By default checks the platform and will show a full screen search for
  /// mobile devices and a search menu for other devices.
  final YgSearchAction searchAction;

  /// Called when the user presses the search field.
  final VoidCallback? onPressed;

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

  /// Determines what's allowed to enter into the field.
  ///
  /// See [FhInputFormatters].
  final List<TextInputFormatter>? inputFormatters;

  /// Controls the focus of the widget.
  final FocusNode? focusNode;

  /// The action to perform when the user completes editing the field.
  ///
  /// By default based on the [textInputAction].
  final YgCompleteAction completeAction;

  final ValueChanged<T>? onChanged;

  @override
  bool get enabled => !disabled;

  /// The error to display under the text field.
  ///
  /// Will change the styling of the widget to reflect the presence of the error.
  /// Must be null when there is no error, an empty string is still seen as an
  /// valid error.
  @override
  final String? forceErrorText;

  @override
  final String? restorationId;

  @override
  final AutovalidateMode autovalidateMode;

  @override
  final FormFieldValidator<T>? validator;

  /// The auto validation mode used.
  ///
  /// For more info see [YgAutoValidate].
  final YgAutoValidate autoValidate;

  @override
  final FormFieldSetter<T>? onSaved;

  @override
  final T? initialValue;

  @override
  FormFieldState<T> createState() => FormFieldState<T>();
}
