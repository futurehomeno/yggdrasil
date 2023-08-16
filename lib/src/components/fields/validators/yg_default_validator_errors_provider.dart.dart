import 'package:flutter/material.dart';

import '_validators.dart';

/// Provides [YgDefaultValidatorErrors] to implementations of [YgInputValidator].
///
/// Should be added on top level of the app and be rebuild when translations
/// have changed.
class YgDefaultValidatorErrorsProvider extends InheritedWidget {
  const YgDefaultValidatorErrorsProvider({
    super.key,
    required super.child,
    required this.defaultErrors,
  });

  final YgDefaultValidatorErrors defaultErrors;

  static YgDefaultValidatorErrorsProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<YgDefaultValidatorErrorsProvider>()!;
  }

  @override
  bool updateShouldNotify(YgDefaultValidatorErrorsProvider oldWidget) {
    return true;
  }
}
