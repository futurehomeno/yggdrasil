import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yggdrasil/src/components/fields/helpers/yg_validate_helper.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_restorable_search_controller.dart';

/// The [FormField] variant of the [YgSearchField].
class YgSearchFormField<T> extends FormField<T> {
  YgSearchFormField({
    this.controller,
    required SearchFieldKey<T> super.key,
    required String label,
    required YgSearchResultTextBuilder<T> resultTextBuilder,
    required YgSearchResultsBuilder<T> resultsBuilder,
    required TextInputType keyboardType,
    required bool autocorrect,
    required TextCapitalization textCapitalization,
    FocusNode? focusNode,
    String? error,
    String? placeholder,
    ValueChanged<bool>? onFocusChanged,
    VoidCallback? onPressed,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onChanged,
    Widget? hint,
    List<FormFieldValidator<TabBar>>? validators,
    List<TextInputFormatter>? inputFormatters,
    String? initialValue,
    bool disabled = false,
    bool readOnly = false,
    YgFieldVariant variant = YgFieldVariant.standard,
    YgFieldSize size = YgFieldSize.large,
    YgCompleteAction completeAction = YgCompleteAction.unfocus,
    YgSearchAction searchAction = YgSearchAction.auto,
    YgAutoValidate autoValidate = YgAutoValidate.disabled,
  }) : super(
          initialValue: controller != null ? controller.text : (initialValue ?? ''),
          enabled: !disabled,
          autovalidateMode: YgValidateHelper.mapAutoValidate(autoValidate),
          validator: YgValidateHelper.combineValidators(validators),
          builder: (FormFieldState<T> field) {
            final YgSearchFormFieldState<T> state = field as YgSearchFormFieldState<T>;
            final YgValidateHelper<T> helper = YgValidateHelper<T>(
              key: key,
              autoValidate: autoValidate,
              onFocusChanged: onFocusChanged,
              completeAction: completeAction,
              onEditingComplete: onEditingComplete,
            );

            return UnmanagedRestorationScope(
              bucket: field.bucket,
              child: YgSearchField<T>(
                label: label,
                onEditingComplete: helper.onEditingComplete,
                onFocusChanged: helper.onFocusChanged,
                variant: variant,
                placeholder: placeholder,
                controller: state._effectiveController,
                disabled: disabled,
                size: size,
                autocorrect: autocorrect,
                textCapitalization: textCapitalization,
                readOnly: readOnly,
                inputFormatters: inputFormatters,
                onChanged: field.didChange,
                error: error ?? field.errorText,
                focusNode: focusNode,
                keyboardType: keyboardType,
                resultTextBuilder: resultTextBuilder,
                resultsBuilder: resultsBuilder,
                completeAction: completeAction,
                hint: hint,
                onPressed: onPressed,
                searchAction: searchAction,
              ),
            );
          },
        );

  /// Controls the text being edited.
  ///
  /// If null, this widget will create its own [TextEditingController] and
  /// initialize its [TextEditingController.text] with [initialValue].
  final YgSearchController<T>? controller;

  @override
  FormFieldState<T> createState() => YgSearchFormFieldState<T>();
}

class YgSearchFormFieldState<T> extends FormFieldState<T> {
  YgRestorableSearchController<T>? _controller;

  YgSearchController<T> get _effectiveController => _formField.controller ?? _controller!.value;

  YgSearchFormField<T> get _formField => super.widget as YgSearchFormField<T>;

  // ignore: prefer-widget-private-members
  String get text => _effectiveController.text;

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
    _controller =
        value == null ? YgRestorableSearchController<T>() : YgRestorableSearchController<T>.fromValue(value: value);
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
  void didUpdateWidget(YgSearchFormField<T> oldWidget) {
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
