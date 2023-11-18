import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_section/expanding/yg_expansion_controller.dart';

class YgExpander extends StatefulWidget {
  const YgExpander({
    super.key,
    required this.child,
    required this.headerBuilder,
    this.controller,
    this.initiallyExpanded = false,
    this.alignment = Alignment.topCenter,
    this.axis = Axis.vertical,
  });

  final Widget Function(BuildContext context, YgExpansionController controller) headerBuilder;
  final YgExpansionController? controller;
  final bool initiallyExpanded;
  final Alignment alignment;
  final Axis axis;
  final Widget child;

  @override
  State<YgExpander> createState() => _YgExpanderState();
}

class _YgExpanderState extends State<YgExpander> {
  late YgExpansionController _controller = widget.controller ?? _createController();

  @override
  void didUpdateWidget(covariant YgExpander oldWidget) {
    final YgExpansionController? newController = widget.controller;

    if (newController == null) {
      if (oldWidget.controller != null) {
        _updateController(_createController());
      }
    } else if (newController != _controller) {
      _updateController(newController);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.removeListener(_rebuild);
    if (widget.controller == null) {
      _controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: widget.axis,
      children: <Widget>[
        widget.headerBuilder(context, _controller),
        AnimatedAlign(
          alignment: widget.alignment,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          heightFactor: _getFactorForAxis(Axis.horizontal),
          widthFactor: _getFactorForAxis(Axis.vertical),
          child: widget.child,
        ),
      ],
    );
  }

  double _getFactorForAxis(Axis axis) {
    if (widget.axis != axis || _controller.expanded) {
      return 1.0;
    }

    return 0.0;
  }

  void _updateController(YgExpansionController controller) {
    _controller.removeListener(_rebuild);
    _controller = controller;
    _controller.addListener(_rebuild);
  }

  void _rebuild() {
    setState(() {});
  }

  YgExpansionController _createController() {
    return YgExpansionController(
      initiallyExpanded: widget.initiallyExpanded,
    );
  }
}
