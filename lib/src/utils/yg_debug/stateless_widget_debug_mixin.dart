import 'package:flutter/widgets.dart';

import '_yg_debug.dart';

/// Wraps built widget in YgDebugWidget.
mixin StatelessWidgetDebugMixin on StatelessWidget {
  @override
  StatelessElement createElement() => _YgDebugStatelessElement(this);
}

class _YgDebugStatelessElement extends StatelessElement {
  _YgDebugStatelessElement(super.widget);

  @override
  Widget build() {
    return YgDebug(
      child: super.build(),
    );
  }
}
