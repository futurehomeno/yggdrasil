import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

class YgScrollShadowOverlay extends StatelessWidget {
  const YgScrollShadowOverlay({
    super.key,
    required this.child,
    this.bottom,
    this.top,
  });

  final Widget child;
  final bool? bottom;
  final bool? top;

  @override
  Widget build(BuildContext context) {
    final bool? bottom = this.bottom;
    final bool? top = this.top;

    return Stack(
      children: <Widget>[
        child,
        if (bottom != null)
          _buildShadow(
            context,
            alignment: Alignment.bottomCenter,
            shown: bottom,
          ),
        if (top != null)
          _buildShadow(
            context,
            alignment: Alignment.topCenter,
            shown: top,
          ),
      ],
    );
  }

  Widget _buildShadow(
    BuildContext context, {
    required bool shown,
    required Alignment alignment,
  }) {
    final YgScrollShadowThemes scrollShadowThemes = context.internalTheme.scrollShadow;

    return Positioned(
      bottom: alignment.y > 0 ? 0 : null,
      top: alignment.y < 0 ? 0 : null,
      left: 0,
      right: 0,
      child: IgnorePointer(
        child: RepaintBoundary(
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
                    scrollShadowThemes.shadowColor.withOpacity(0),
                  ],
                  end: -alignment,
                  begin: alignment,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
