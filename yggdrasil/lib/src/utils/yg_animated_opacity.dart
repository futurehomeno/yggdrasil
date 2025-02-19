import 'package:flutter/material.dart';

/// Animated the opacity of [child].
///
/// Is different from a normal [AnimatedOpacity] in that it prevents the child
/// widget from ticking, taking focus or reacting to touch when the opacity is
/// set to 0.
class YgAnimatedOpacity extends StatefulWidget {
  const YgAnimatedOpacity({
    super.key,
    required this.opacity,
    required this.child,
    required this.duration,
    this.curve = Curves.linear,
  });

  final double opacity;
  final Widget child;
  final Duration duration;
  final Curve curve;

  @override
  State<YgAnimatedOpacity> createState() => _YgAnimatedOpacityState();
}

class _YgAnimatedOpacityState extends State<YgAnimatedOpacity> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    value: widget.opacity,
  );

  late bool _isVisible = widget.opacity > 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_updateVisibility);
  }

  @override
  void didUpdateWidget(covariant YgAnimatedOpacity oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.opacity != widget.opacity) {
      _controller.animateTo(
        widget.opacity,
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

  void _updateVisibility() {
    final bool isVisible = _controller.value > 0;
    if (_isVisible != isVisible) {
      _isVisible = isVisible;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return TickerMode(
      enabled: _isVisible,
      child: IgnorePointer(
        ignoring: !_isVisible,
        child: ExcludeSemantics(
          excluding: !_isVisible,
          child: ExcludeFocus(
            excluding: !_isVisible,
            child: FadeTransition(
              opacity: _controller,
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
