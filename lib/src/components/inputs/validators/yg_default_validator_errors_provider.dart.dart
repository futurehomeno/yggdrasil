import 'package:flutter/material.dart';

import '_validators.dart';

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
