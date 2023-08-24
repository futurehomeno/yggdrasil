import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

typedef WidgetWithScrollBuilder = Widget Function(BuildContext context, ScrollController controller);

/// Applies a shadow at the top or bottom of a scroll view.
abstract class YgScrollShadow extends StatefulWidget {
  const factory YgScrollShadow({
    required Widget child,
    required ScrollController controller,
  }) = _YgScrollShadowChild;

  const factory YgScrollShadow.builder({
    required WidgetWithScrollBuilder builder,
  }) = _YgScrollShadowBuilder;

  const YgScrollShadow._({
    super.key,
    this.controller,
  });

  Widget builder(BuildContext context, ScrollController controller);

  /// The [ScrollController] of the scrollable surface which the shadows should
  /// be added to.
  final ScrollController? controller;

  @override
  State<YgScrollShadow> createState() => _YgScrollShadowState();
}

class _YgScrollShadowChild extends YgScrollShadow {
  const _YgScrollShadowChild({
    Key? key,
    required this.child,
    required ScrollController controller,
  }) : super._(
          controller: controller,
          key: key,
        );

  final Widget child;

  @override
  Widget builder(BuildContext context, ScrollController controller) {
    return child;
  }
}

class _YgScrollShadowBuilder extends YgScrollShadow {
  const _YgScrollShadowBuilder({
    required WidgetWithScrollBuilder builder,
  })  : _builder = builder,
        super._();

  final WidgetWithScrollBuilder _builder;

  @override
  Widget builder(BuildContext context, ScrollController controller) {
    return _builder(context, controller);
  }
}

class _YgScrollShadowState extends State<YgScrollShadow> {
  bool _showBottomShadow = false;
  bool _showTopShadow = false;
  late ScrollController _controller = widget.controller ?? ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_updateShadows);
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateShadows());
  }

  void _updateShadows() {
    final ScrollPosition position = _controller.position;

    final bool newShowBottomShadow = position.extentAfter != 0;
    final bool newShowTopShadow = position.extentBefore != 0;

    if ((_showBottomShadow != newShowBottomShadow) || (_showTopShadow != newShowTopShadow)) {
      _showBottomShadow = newShowBottomShadow;
      _showTopShadow = newShowTopShadow;
      setState(() {});
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_updateShadows);
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant YgScrollShadow oldWidget) {
    final ScrollController? newController = widget.controller;

    if (newController == null) {
      if (oldWidget.controller != null) {
        _updateController(ScrollController());
      }
    } else if (newController != _controller) {
      _updateController(newController);
    }

    super.didUpdateWidget(oldWidget);
  }

  void _updateController(ScrollController controller) {
    _controller.removeListener(_updateShadows);
    _controller = controller;
    _controller.addListener(_updateShadows);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        widget.builder(
          context,
          _controller,
        ),
        _buildShadow(
          alignment: Alignment.bottomCenter,
          shown: _showBottomShadow,
        ),
        _buildShadow(
          alignment: Alignment.topCenter,
          shown: _showTopShadow,
        ),
      ],
    );
  }

  Widget _buildShadow({
    required Alignment alignment,
    required bool shown,
  }) {
    final YgScrollShadowThemes scrollShadowThemes = context.internalTheme.scrollShadow;

    return Positioned(
      bottom: alignment.y > 0 ? 0 : null,
      top: alignment.y < 0 ? 0 : null,
      left: 0,
      right: 0,
      child: IgnorePointer(
        child: AnimatedOpacity(
          duration: scrollShadowThemes.fadeDuration,
          curve: scrollShadowThemes.fadeCurve,
          opacity: shown ? 1 : 0,
          child: Container(
            height: scrollShadowThemes.shadowSize,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  scrollShadowThemes.shadowColor,
                  Colors.transparent,
                ],
                end: -alignment,
                begin: alignment,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
