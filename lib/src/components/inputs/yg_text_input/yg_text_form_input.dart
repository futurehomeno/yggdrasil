import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// Form field variation of [YgTextInput].
class YgTextFormInput extends FormField<String> {
  YgTextFormInput({
    this.controller,
    required TextFieldKey super.key,
    required String label,
    String? error,
    String? placeholder,
    YgIconButton? suffix,
    String? initialValue,
    FocusNode? focusNode,
    TextInputType? keyboardType,
    List<YgTextValidator>? validators,
    VoidCallback? onEditingComplete,
    TextInputAction? textInputAction,
    List<TextInputFormatter>? inputFormatters,
    int? minLines,
    int? maxLines = 1,
    bool disabled = false,
    bool readOnly = false,
    bool autocorrect = true,
    bool obscureText = false,
    bool showObscureTextButton = true,
    YgTextInputSize size = YgTextInputSize.large,
    YgTextInputVariant variant = YgTextInputVariant.standard,
    TextCapitalization textCapitalization = TextCapitalization.none,
  }) : super(
          initialValue: controller != null ? controller.text : (initialValue ?? ''),
          enabled: !disabled,
          autovalidateMode: AutovalidateMode.disabled,
          validator: YgInputValidatorToFormFieldValidatorTransformer<String>(
            validators: validators,
            fieldKey: key,
          ),
          builder: (FormFieldState<String> field) {
            final _YgTextFormInputState state = field as _YgTextFormInputState;

            return UnmanagedRestorationScope(
              bucket: field.bucket,
              child: YgTextInput(
                label: label,
                onEditingComplete: onEditingComplete,
                textInputAction: textInputAction,
                obscureText: obscureText,
                showObscureTextButton: showObscureTextButton,
                variant: variant,
                placeholder: placeholder,
                suffix: suffix,
                controller: state._effectiveController,
                disabled: disabled,
                size: size,
                keyboardType: keyboardType,
                autocorrect: autocorrect,
                textCapitalization: textCapitalization,
                readOnly: readOnly,
                maxLines: maxLines,
                inputFormatters: inputFormatters,
                onChanged: field.didChange,
                error: error ?? field.errorText,
                focusNode: focusNode,
                minLines: minLines,
              ),
            );
          },
        );

  /// Convenience method for creating email fields.
  YgTextFormInput.email({
    TextEditingController? controller,
    required TextFieldKey key,
    required String label,
    String? error,
    String? invalidEmailError,
    String? requiredError,
    String? placeholder,
    YgIconButton? suffix,
    String? initialValue,
    FocusNode? focusNode,
    VoidCallback? onEditingComplete,
    TextInputAction? textInputAction,
    List<TextInputFormatter>? inputFormatters,
    bool required = false,
    bool disabled = false,
    bool readOnly = false,
    YgTextInputSize size = YgTextInputSize.large,
    YgTextInputVariant variant = YgTextInputVariant.standard,
  }) : this(
          key: key,
          label: label,
          controller: controller,
          error: error,
          validators: <YgTextValidator>[
            if (required)
              RequiredValidator(
                requiredError: requiredError,
              ),
            EmailValidator(
              invalidEmailError: invalidEmailError,
            )
          ],
          placeholder: placeholder,
          suffix: suffix,
          initialValue: initialValue,
          focusNode: focusNode,
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

  YgTextFormInput get _formField => super.widget as YgTextFormInput;

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
  void didUpdateWidget(YgTextFormInput oldWidget) {
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
