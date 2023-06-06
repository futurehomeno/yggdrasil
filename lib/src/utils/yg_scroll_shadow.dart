import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

/// Applies a shadow at the top or bottom of a scroll view.
class YgScrollShadow extends StatefulWidget {
  const YgScrollShadow({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<YgScrollShadow> createState() => _YgScrollShadowState();
}

class _YgScrollShadowState extends State<YgScrollShadow> {
  ScrollController? _scrollController;
  bool _showBottomShadow = false;
  bool _showTopShadow = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateShadows());

    super.initState();
  }

  void _updateShadows() {
    final ScrollPosition position = _scrollController!.position;

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
    _scrollController?.removeListener(_updateShadows);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = PrimaryScrollController.of(context);

    if (_scrollController != scrollController) {
      _scrollController?.removeListener(_updateShadows);
      _scrollController = scrollController;
      _scrollController?.addListener(_updateShadows);
    }

    return Stack(
      children: <Widget>[
        widget.child,
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
    final YgScrollShadowThemes theme = context.internalTheme.scrollShadow;

    return Positioned(
      bottom: alignment.y > 0 ? 0 : null,
      top: alignment.y < 0 ? 0 : null,
      left: 0,
      right: 0,
      child: IgnorePointer(
        child: AnimatedOpacity(
          duration: theme.fadeDuration,
          curve: theme.fadeCurve,
          opacity: shown ? 1 : 0,
          child: Container(
            height: theme.shadowSize,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  theme.shadowColor,
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
