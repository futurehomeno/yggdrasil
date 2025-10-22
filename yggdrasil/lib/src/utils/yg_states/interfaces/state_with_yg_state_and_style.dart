import 'package:flutter/material.dart' as m;
import 'package:yggdrasil/src/utils/_utils.dart';

/// A helper class to simplify using [YgStyle].
abstract class StateWithYgStateAndStyle<
  Widget extends m.StatefulWidget,
  State extends YgState,
  Style extends YgStyle<State>
>
    extends m.State<Widget>
    with
        m.TickerProviderStateMixin<Widget>,
        YgVsyncMixin<Widget>,
        YgStyleBuilderMixin<Widget, Style>,
        YgStateBuilderMixin<Widget, State> {}
