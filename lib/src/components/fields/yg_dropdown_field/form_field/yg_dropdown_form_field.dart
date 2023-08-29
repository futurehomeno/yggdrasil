import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/fields/_fields.dart';
import 'package:yggdrasil/src/components/fields/helpers/_helpers.dart';

part 'yg_dropdown_form_field_multi_select.dart';
part 'yg_dropdown_form_field_single_select.dart';

abstract class YgDropdownFormField<T extends Object> extends StatefulWidget {
  const YgDropdownFormField._({
    super.key,
  });

  factory YgDropdownFormField({
    bool allowDeselect,
    YgAutoValidate autoValidate,
    bool disabled,
    YgDropdownAction dropdownAction,
    required List<YgDropdownEntry<T>> entries,
    String? error,
    FocusNode? focusNode,
    T? initialValue,
    required FormFieldKey<T> key,
    required String label,
    int maxLines,
    int? minLines,
    void Function(T?)? onChange,
    String? placeholder,
    YgDropdownFieldSize size,
    List<String? Function(T?)>? validators,
    YgDropdownFieldVariant variant,
  }) = YgDropdownFormFieldSingleSelect<T>;

  factory YgDropdownFormField.multiSelect({
    bool allowDeselect,
    YgAutoValidate autoValidate,
    bool disabled,
    YgDropdownAction dropdownAction,
    required List<YgDropdownEntry<T>> entries,
    String? error,
    FocusNode? focusNode,
    Set<T>? initialValue,
    required FormFieldKey<T> key,
    required String label,
    int maxLines,
    int? minLines,
    void Function(Set<T>)? onChange,
    String? placeholder,
    YgDropdownFieldSize size,
    List<String? Function(Set<T>?)>? validators,
    YgDropdownFieldVariant variant,
  }) = YgDropdownFormFieldMultiSelect<T>;
}
