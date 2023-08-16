import 'package:flutter/widgets.dart';

import '_yg_debug.dart';

/// Wraps built widget in YgDebugWidget.
mixin StatefulWidgetDebugMixin on StatefulWidget {
  @override
  StatefulElement createElement() => _YgDebugStatefulElement(this);
}

class _YgDebugStatefulElement extends StatefulElement {
  _YgDebugStatefulElement(super.widget);

  @override
  Widget build() {
    return YgDebug(
      child: super.build(),
    );
  }
}
