import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

part 'yg_constant_size_cross_fade_render_widget.dart';

class YgConstantSizeAnimatedCrossFade extends StatefulWidget {
  const YgConstantSizeAnimatedCrossFade({
    super.key,
    required this.crossFadeState,
    required this.firstChild,
    required this.secondChild,
    required this.duration,
    this.curve = Curves.linear,
    this.firstChildAlignment = Alignment.center,
    this.secondChildAlignment = Alignment.center,
  });

  final CrossFadeState crossFadeState;
  final Widget firstChild;
  final Alignment firstChildAlignment;
  final Widget secondChild;
  final Alignment secondChildAlignment;
  final Duration duration;
  final Curve curve;

  @override
  State<YgConstantSizeAnimatedCrossFade> createState() => _YgConstantSizeAnimatedCrossFadeState();
}

class _YgConstantSizeAnimatedCrossFadeState extends State<YgConstantSizeAnimatedCrossFade>
    with TickerProviderStateMixin {
  late bool _showFirstChild = widget.crossFadeState == CrossFadeState.showFirst;
  late bool _showSecondChild = widget.crossFadeState == CrossFadeState.showSecond;
  late final AnimationController _controller = AnimationController(
    vsync: this,
    value: _animationTarget,
  );

  double get _animationTarget => switch (widget.crossFadeState) {
        CrossFadeState.showFirst => 0,
        CrossFadeState.showSecond => 1,
      };

  @override
  void initState() {
    super.initState();
    _controller.addListener(_valueChanged);
  }

  void _valueChanged() {
    final bool showFirstChild = _controller.value < 1;
    final bool showSecondChild = _controller.value > 0;
    if (showFirstChild != _showFirstChild || showSecondChild != _showSecondChild) {
      _showFirstChild = showFirstChild;
      _showSecondChild = showSecondChild;
      setState(() {});
    }
  }

  @override
  void didUpdateWidget(covariant YgConstantSizeAnimatedCrossFade oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.crossFadeState != widget.crossFadeState) {
      _controller.animateTo(
        _animationTarget,
        curve: widget.curve,
        duration: widget.duration,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _YgConstantSizeCrossFadeRenderWidget(
      animation: _controller,
      firstChild: TickerMode(
        enabled: _showFirstChild,
        child: widget.firstChild,
      ),
      secondChild: TickerMode(
        enabled: _showSecondChild,
        child: widget.secondChild,
      ),
      firstChildAlignment: widget.firstChildAlignment,
      secondChildAlignment: widget.secondChildAlignment,
    );
  }
}
