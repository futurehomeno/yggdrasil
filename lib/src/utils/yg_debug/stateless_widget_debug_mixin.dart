import 'package:flutter/widgets.dart';

import '_yg_debug.dart';

/// Wraps built widget in YgDebugWidget.
mixin StatelessWidgetDebugMixin on StatelessWidget {
  @override
  StatelessElement createElement() => _YgDebugStatelessElement(this, () => debugType);

  YgDebugType get debugType => YgDebugType.other;
}

class _YgDebugStatelessElement extends StatelessElement {
  _YgDebugStatelessElement(super.widget, this._getType);

  final YgDebugType Function() _getType;

  @override
  Widget build() {
    return YgDebug(
      type: _getType(),
      child: super.build(),
    );
  }
}
