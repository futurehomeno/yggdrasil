import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

part 'yg_scroll_shadow_builder.dart';
part 'yg_scroll_shadow_child.dart';

typedef WidgetWithScrollBuilder = Widget Function(BuildContext context, ScrollController controller);

/// Applies a shadow at the top or bottom of a scroll view.
abstract class YgScrollShadow extends StatefulWidget {
  /// Builds the widget using provided [ScrollController].
  const factory YgScrollShadow({
    required Widget child,
    required ScrollController controller,
  }) = _YgScrollShadowChild;

  /// Builds the child with a provided [ScrollController].
  ///
  /// Can be preferable to use when you don't have a scroll controller to
  /// provide or when the scroll controller might be null, in which cases the
  /// builder function will be provided with a internally created scroll
  /// controller to pass to the scroll widget instead.
  const factory YgScrollShadow.builder({
    required WidgetWithScrollBuilder builder,
    ScrollController? controller,
  }) = _YgScrollShadowBuilder;

  const YgScrollShadow._({
    super.key,
    this.controller,
  });

  /// Builds the child widget.
  ///
  /// Provides a [ScrollController] to the builder, this can either be the
  /// controller supplied by the user or an internally created one.
  Widget builder(BuildContext context, ScrollController controller);

  /// The [ScrollController] of the scrollable surface which the shadows should
  /// be added to.
  final ScrollController? controller;

  @override
  State<YgScrollShadow> createState() => _YgScrollShadowState();
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
    return NotificationListener<ScrollMetricsNotification>(
      onNotification: _handleScrollMetricsChange,
      child: Stack(
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
      ),
    );
  }

  bool _handleScrollMetricsChange(ScrollMetricsNotification notification) {
    _updateShadows();

    return false;
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
