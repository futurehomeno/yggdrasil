import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yggdrasil/src/components/fields/helpers/yg_validate_helper.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// A form field that contains a [YgTextField].
///
/// This is a convenience widget that wraps a [YgTextField] widget in a [FormField].
class YgTextFormField extends FormField<String> {
  YgTextFormField({
    this.controller,
    required TextFieldKey super.key,
    required String label,
    required TextInputType keyboardType,
    required TextInputAction textInputAction,
    required bool autocorrect,
    required TextCapitalization textCapitalization,
    String? error,
    String? placeholder,
    YgColorableIconData? suffix,
    String? initialValue,
    FocusNode? focusNode,
    List<FormFieldValidator<String>>? validators,
    VoidCallback? onEditingComplete,
    ValueChanged<bool>? onFocusChanged,
    List<TextInputFormatter>? inputFormatters,
    YgCompleteAction? completeAction,
    ValueChanged<String>? onChanged,
    int? maxLength,
    int? minLines,
    int? maxLines = 1,
    bool disabled = false,
    bool readOnly = false,
    bool obscureText = false,
    bool showObscureTextButton = true,
    YgFieldSize size = YgFieldSize.large,
    YgAutoValidate autoValidate = YgAutoValidate.disabled,
    YgFieldVariant variant = YgFieldVariant.standard,
    YgMaxLengthEnforcement maxLengthEnforcement = YgMaxLengthEnforcement.none,
  }) : super(
          initialValue: controller != null ? controller.text : (initialValue ?? ''),
          enabled: !disabled,
          autovalidateMode: YgValidateHelper.mapAutoValidate(autoValidate),
          validator: YgValidateHelper.combineValidators(validators),
          builder: (FormFieldState<String> field) {
            final _YgTextFormInputState state = field as _YgTextFormInputState;
            final YgValidateHelper<String> helper = YgValidateHelper<String>(
              key: key,
              autoValidate: autoValidate,
              onFocusChanged: onFocusChanged,
              completeAction: completeAction ?? YgValidateHelper.mapTextInputAction(textInputAction),
              onEditingComplete: onEditingComplete,
            );

            void onChangedHandler(String value) {
              field.didChange(value);
              onChanged?.call(value);
            }

            return UnmanagedRestorationScope(
              bucket: field.bucket,
              child: YgTextField(
                label: label,
                onEditingComplete: helper.onEditingComplete,
                onFocusChanged: helper.onFocusChanged,
                textInputAction: textInputAction,
                obscureText: obscureText,
                showObscureTextButton: showObscureTextButton,
                variant: variant,
                placeholder: placeholder,
                suffix: suffix,
                controller: state._effectiveController,
                disabled: disabled,
                size: size,
                autocorrect: autocorrect,
                textCapitalization: textCapitalization,
                readOnly: readOnly,
                maxLines: maxLines,
                inputFormatters: inputFormatters,
                onChanged: onChangedHandler,
                error: error ?? field.errorText,
                focusNode: focusNode,
                minLines: minLines,
                keyboardType: keyboardType,
                maxLength: maxLength,
                maxLengthEnforcement: maxLengthEnforcement,
              ),
            );
          },
        );

  /// Convenience method for creating an email field.
  YgTextFormField.email({
    TextEditingController? controller,
    required TextFieldKey key,
    required String label,
    required TextInputAction textInputAction,
    String? error,
    String? invalidEmailError,
    String? requiredError,
    String? placeholder,
    YgColorableIconData? suffix,
    String? initialValue,
    FocusNode? focusNode,
    List<FormFieldValidator<String>>? validators,
    VoidCallback? onEditingComplete,
    ValueChanged<bool>? onFocusChanged,
    ValueChanged<String>? onChanged,
    List<TextInputFormatter>? inputFormatters,
    int? maxLength,
    bool required = false,
    bool disabled = false,
    bool readOnly = false,
    YgFieldSize size = YgFieldSize.large,
    YgAutoValidate autoValidate = YgAutoValidate.disabled,
    YgFieldVariant variant = YgFieldVariant.standard,
    YgCompleteAction? completeAction,
    YgMaxLengthEnforcement maxLengthEnforcement = YgMaxLengthEnforcement.none,
  }) : this(
          key: key,
          label: label,
          completeAction: completeAction,
          controller: controller,
          error: error,
          placeholder: placeholder,
          suffix: suffix,
          initialValue: initialValue,
          focusNode: focusNode,
          validators: validators,
          keyboardType: TextInputType.emailAddress,
          onEditingComplete: onEditingComplete,
          textInputAction: textInputAction,
          inputFormatters: inputFormatters,
          disabled: disabled,
          readOnly: readOnly,
          autocorrect: false,
          size: size,
          variant: variant,
          textCapitalization: TextCapitalization.none,
          maxLength: maxLength,
          maxLengthEnforcement: maxLengthEnforcement,
          onChanged: onChanged,
        );

  /// Convenience method for creating a password fields.
  YgTextFormField.password({
    TextEditingController? controller,
    required TextFieldKey key,
    required String label,
    required TextInputAction textInputAction,
    TextFieldKey? otherPasswordFieldKey,
    String? error,
    String? passwordTooShortError,
    String? requiredError,
    String? placeholder,
    YgColorableIconData? suffix,
    String? initialValue,
    FocusNode? focusNode,
    List<FormFieldValidator<String>>? validators,
    VoidCallback? onEditingComplete,
    ValueChanged<bool>? onFocusChanged,
    ValueChanged<String>? onChanged,
    List<TextInputFormatter>? inputFormatters,
    int? maxLength,
    bool required = false,
    bool disabled = false,
    bool readOnly = false,
    bool showObscureTextButton = true,
    YgFieldSize size = YgFieldSize.large,
    YgAutoValidate autoValidate = YgAutoValidate.disabled,
    YgFieldVariant variant = YgFieldVariant.standard,
    YgCompleteAction? completeAction,
    YgMaxLengthEnforcement maxLengthEnforcement = YgMaxLengthEnforcement.none,
  }) : this(
          key: key,
          label: label,
          completeAction: completeAction,
          controller: controller,
          error: error,
          placeholder: placeholder,
          suffix: suffix,
          initialValue: initialValue,
          focusNode: focusNode,
          validators: validators,
          keyboardType: TextInputType.text,
          onEditingComplete: onEditingComplete,
          onFocusChanged: onFocusChanged,
          textInputAction: textInputAction,
          inputFormatters: inputFormatters,
          showObscureTextButton: showObscureTextButton,
          disabled: disabled,
          readOnly: readOnly,
          autocorrect: false,
          obscureText: true,
          size: size,
          variant: variant,
          textCapitalization: TextCapitalization.none,
          maxLength: maxLength,
          maxLengthEnforcement: maxLengthEnforcement,
          onChanged: onChanged,
        );

  /// Convenience method for creating a multiline text fields.
  YgTextFormField.multiline({
    TextEditingController? controller,
    required TextFieldKey key,
    required String label,
    TextFieldKey? otherPasswordFieldKey,
    String? error,
    String? passwordTooShortError,
    String? requiredError,
    String? placeholder,
    YgColorableIconData? suffix,
    String? initialValue,
    FocusNode? focusNode,
    List<FormFieldValidator<String>>? validators,
    VoidCallback? onEditingComplete,
    ValueChanged<bool>? onFocusChanged,
    ValueChanged<String>? onChanged,
    List<TextInputFormatter>? inputFormatters,
    int? maxLines,
    int? minLines,
    int? maxLength,
    bool required = false,
    bool disabled = false,
    bool readOnly = false,
    YgFieldSize size = YgFieldSize.large,
    YgAutoValidate autoValidate = YgAutoValidate.disabled,
    YgFieldVariant variant = YgFieldVariant.standard,
    TextCapitalization textCapitalization = TextCapitalization.sentences,
    YgCompleteAction? completeAction,
    YgMaxLengthEnforcement maxLengthEnforcement = YgMaxLengthEnforcement.none,
  }) : this(
          key: key,
          label: label,
          completeAction: completeAction,
          controller: controller,
          error: error,
          validators: validators,
          placeholder: placeholder,
          suffix: suffix,
          initialValue: initialValue,
          autoValidate: autoValidate,
          focusNode: focusNode,
          keyboardType: TextInputType.multiline,
          onEditingComplete: onEditingComplete,
          onFocusChanged: onFocusChanged,
          textInputAction: TextInputAction.newline,
          inputFormatters: inputFormatters,
          disabled: disabled,
          readOnly: readOnly,
          autocorrect: true,
          size: size,
          variant: variant,
          textCapitalization: textCapitalization,
          maxLines: maxLines,
          minLines: minLines,
          maxLength: maxLength,
          maxLengthEnforcement: maxLengthEnforcement,
          onChanged: onChanged,
        );

  /// Controls the text being edited.
  ///
  /// If null, this widget will create its own [TextEditingController] and
  /// initialize its [TextEditingController.text] with [initialValue].
  final TextEditingController? controller;

  @override
  FormFieldState<String> createState() => _YgTextFormInputState();
}

/// Copied from the material [TextFormField].
class _YgTextFormInputState extends FormFieldState<String> {
  RestorableTextEditingController? _controller;

  TextEditingController get _effectiveController => _formField.controller ?? _controller!.value;

  YgTextFormField get _formField => super.widget as YgTextFormField;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    super.restoreState(oldBucket, initialRestore);
    if (_controller != null) {
      _registerController();
    }
    // Make sure to update the internal [FormFieldState] value to sync up with
    // text editing controller value.
    setValue(_effectiveController.text);
  }

  void _registerController() {
    assert(_controller != null);
    registerForRestoration(_controller!, 'controller');
  }

  void _createLocalController([TextEditingValue? value]) {
    assert(_controller == null);
    _controller = value == null ? RestorableTextEditingController() : RestorableTextEditingController.fromValue(value);
    if (!restorePending) {
      _registerController();
    }
  }

  @override
  void initState() {
    super.initState();
    if (_formField.controller == null) {
      _createLocalController(widget.initialValue != null ? TextEditingValue(text: widget.initialValue!) : null);
    } else {
      _formField.controller!.addListener(_handleControllerChanged);
    }
  }

  @override
  void didUpdateWidget(YgTextFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_formField.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_handleControllerChanged);
      _formField.controller?.addListener(_handleControllerChanged);

      if (oldWidget.controller != null && _formField.controller == null) {
        _createLocalController(oldWidget.controller!.value);
      }

      if (_formField.controller != null) {
        setValue(_formField.controller!.text);
        if (oldWidget.controller == null) {
          unregisterFromRestoration(_controller!);
          _controller!.dispose();
          _controller = null;
        }
      }
    }
  }

  @override
  void dispose() {
    _formField.controller?.removeListener(_handleControllerChanged);
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didChange(String? value) {
    super.didChange(value);

    if (_effectiveController.text != value) {
      _effectiveController.text = value ?? '';
    }
  }

  @override
  void reset() {
    // setState will be called in the superclass, so even though state is being
    // manipulated, no setState call is needed here.
    _effectiveController.text = widget.initialValue ?? '';
    super.reset();
  }

  void _handleControllerChanged() {
    // Suppress changes that originated from within this class.
    //
    // In the case where a controller has been passed in to this widget, we
    // register this change listener. In these cases, we'll also receive change
    // notifications for changes originating from within this class -- for
    // example, the reset() method. In such cases, the FormField value will
    // already have been set.
    if (_effectiveController.text != value) {
      didChange(_effectiveController.text);
    }
  }
}
