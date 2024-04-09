import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

/// A helper class to simplify using [YgStyle].
abstract class StateWithYgStyle<W extends StatefulWidget, S extends YgStyle<YgState>> extends State<W>
    with TickerProviderStateMixin<W>, YgVsyncMixin<W>, YgStyleBuilderMixin<W, S> {}
