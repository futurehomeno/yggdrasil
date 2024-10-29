import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

/// A helper class to simplify using [YgStyle].
abstract class StateWithYgState<W extends StatefulWidget, S extends YgState> extends State<W>
    with TickerProviderStateMixin<W>, YgVsyncMixin<W>, YgStateBuilderMixin<W, S> {}
