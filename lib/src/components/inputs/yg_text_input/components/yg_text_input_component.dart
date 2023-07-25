import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/text_input/text_input_theme.dart';
import 'package:yggdrasil/src/theme/theme.dart';

abstract class YgTextInputComponent extends StatefulWidget {
  const YgTextInputComponent({
    this.controller,
    this.focusNode,
    super.key,
    this.initialValue,
  });

  final FocusNode? focusNode;
  final TextEditingController? controller;
  final String? initialValue;
}

abstract class YgTextInputComponentState<T extends YgTextInputComponent> extends State<T> {
  late FocusNode _focusNode = widget.focusNode ?? FocusNode();
  FocusNode get focusNode => _focusNode;

  late TextEditingController _controller = widget.controller ?? _createController();
  TextEditingController get controller => _controller;

  late bool _focused = focusNode.hasFocus;
  bool get focused => _focused;

  late bool _isEmpty = controller.text.isEmpty;
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
    controller.addListener(_valueUpdated);
    super.initState();
  }

  @mustCallSuper
  @override
  void didUpdateWidget(covariant T oldWidget) {
    if (widget.controller != controller) {
      controller.removeListener(_valueUpdated);
      _controller = widget.controller ?? _createController();
      controller.addListener(_valueUpdated);
    }
    if (widget.focusNode != focusNode) {
      focusNode.removeListener(_focusChanged);
      _focusNode = widget.focusNode ?? FocusNode();
      focusNode.addListener(_focusChanged);
    }
    super.didUpdateWidget(oldWidget);
  }

  @mustCallSuper
  @override
  void dispose() {
    controller.removeListener(_valueUpdated);
    focusNode.removeListener(_focusChanged);
    super.dispose();
  }

  void _valueUpdated() {
    final bool isEmpty = controller.text.isEmpty;

    if (isEmpty != _isEmpty) {
      _isEmpty = isEmpty;
      setState(() {});
    }
  }

  void _focusChanged() {
    final bool focused = focusNode.hasFocus;
    if (focused != _focused) {
      _focused = focused;
      setState(() {});
    }
  }
}
