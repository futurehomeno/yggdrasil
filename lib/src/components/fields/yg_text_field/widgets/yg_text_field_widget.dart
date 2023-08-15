import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// A widget with methods shared between internal [YgTextField] widgets.
abstract class YgTextFieldBaseWidget extends StatefulWidget {
  const YgTextFieldBaseWidget({
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

  /// The initial value of the text field.
  final String? initialValue;
}

abstract class YgTextFieldBaseWidgetState<T extends YgTextFieldBaseWidget> extends State<T> {
  late FocusNode _focusNode = widget.focusNode ?? FocusNode();
  FocusNode get focusNode => _focusNode;

  late TextEditingController _controller = widget.controller ?? _createController();
  TextEditingController get controller => _controller;

  late bool _focused = focusNode.hasFocus;
  bool get focused => _focused;

  late bool _isEmpty = _controller.text.isEmpty;
  bool get isEmpty => _isEmpty;

  YgTextFieldTheme get theme => context.textInputTheme;
  Duration get duration => theme.animationDuration;
  Curve get curve => theme.animationCurve;

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
    final TextEditingController? newController = widget.controller;
    final FocusNode? newFocusNode = widget.focusNode;

    if (newController == null) {
      if (oldWidget.controller != null) {
        _updateController(_createController());
      }
    } else if (newController != _controller) {
      _updateController(newController);
    }

    if (newFocusNode == null) {
      if (oldWidget.focusNode != null) {
        _updateFocusNode(FocusNode());
      }
    } else if (newFocusNode != _focusNode) {
      _updateFocusNode(newFocusNode);
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

  void _updateFocusNode(FocusNode focusNode) {
    _focusNode.removeListener(_focusChanged);
    _focusNode = focusNode;
    _focusNode.addListener(_focusChanged);
  }

  void _updateController(TextEditingController controller) {
    _controller.removeListener(_valueUpdated);
    _controller = controller;
    _controller.addListener(_valueUpdated);
  }

  TextEditingController _createController() => TextEditingController(
        text: widget.initialValue,
      );

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
