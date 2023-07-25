import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// A widget with methods shared between internal [YgTextInput] widget.
abstract class YgTextInputWidget extends StatefulWidget {
  const YgTextInputWidget({
    this.controller,
    this.focusNode,
    super.key,
    this.initialValue,
  });

  /// Controls the focus of the widget.
  final FocusNode? focusNode;

  /// Controls the text being edited.
  ///
  /// When defined will overwrite the [initialValue].
  final TextEditingController? controller;

  /// The initial value of the input.
  final String? initialValue;
}

abstract class YgTextInputWidgetState<T extends YgTextInputWidget> extends State<T> {
  late FocusNode _focusNode = widget.focusNode ?? FocusNode();
  FocusNode get focusNode => _focusNode;

  late TextEditingController _controller = widget.controller ?? _createController();
  TextEditingController get controller => _controller;

  late bool _focused = focusNode.hasFocus;
  bool get focused => _focused;

  late bool _isEmpty = _controller.text.isEmpty;
  bool get isEmpty => _isEmpty;

  YgTextInputTheme get theme => context.textInputTheme;
  Duration get duration => context.defaults.animationDuration;
  Curve get curve => context.defaults.animationCurve;

  TextEditingController _createController() => TextEditingController(
        text: widget.initialValue,
      );

  @mustCallSuper
  @override
  void initState() {
    focusNode.addListener(_focusChanged);
    _controller.addListener(_valueUpdated);
    super.initState();
  }

  @mustCallSuper
  @override
  void didUpdateWidget(covariant T oldWidget) {
    if (widget.controller != _controller) {
      _controller.removeListener(_valueUpdated);
      _controller = widget.controller ?? _createController();
      _controller.addListener(_valueUpdated);
    }
    if (widget.focusNode != _focusNode) {
      _focusNode.removeListener(_focusChanged);
      _focusNode = widget.focusNode ?? FocusNode();
      _focusNode.addListener(_focusChanged);
    }
    super.didUpdateWidget(oldWidget);
  }

  @mustCallSuper
  @override
  void dispose() {
    _controller.removeListener(_valueUpdated);
    _focusNode.removeListener(_focusChanged);
    super.dispose();
  }

  void _valueUpdated() {
    final bool isEmpty = _controller.text.isEmpty;

    if (isEmpty != _isEmpty) {
      _isEmpty = isEmpty;
      setState(() {});
    }
  }

  void _focusChanged() {
    final bool focused = _focusNode.hasFocus;
    if (focused != _focused) {
      _focused = focused;
      setState(() {});
    }
  }
}
