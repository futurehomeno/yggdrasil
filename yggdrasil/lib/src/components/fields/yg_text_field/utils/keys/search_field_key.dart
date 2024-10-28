import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/fields/search/yg_search_field/yg_search_form_field.dart';

import 'form_field_key.dart';

/// A convenience method for a GlobalKey with a FormFieldState<String>.
class SearchFieldKey<T> extends FormFieldKey<T> {
  String? get text {
    final FormFieldState<T>? state = currentState;
    if (state is! YgSearchFormFieldState<T>) {
      return null;
    }

    // Sometimes dart is a little dumb.
    return (state as YgSearchFormFieldState<T>).text;
  }
}
