import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

abstract class StateWithYgStyle<W extends StatefulWidget, T extends YgState, S extends YgStyleBase<T>> extends State<W>
    with TickerProviderStateMixin<W>, YgStyleBuilderMixin<W, T, S> {}
