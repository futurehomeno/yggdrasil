import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

/// A helper class to simplify using [YgStyle].
abstract class StateWithYgStateAndStyle<Widget extends StatefulWidget, State extends YgState,
        Style extends YgStyle<State>> extends StateWithYgStyle<Widget, Style>
    with YgStateAndStyleBuilderMixin<Widget, State, Style> {}
