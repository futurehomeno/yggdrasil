import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

/// Internal widget which builds a gradient for a scroll shadow.
class YgScrollShadowGradient extends StatelessWidget {
  const YgScrollShadowGradient({
    super.key,
    required this.shown,
    required this.alignment,
  });

  /// Whether to show the gradient.
  final bool shown;

  /// The alignment of the gradient.
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    final YgScrollShadowThemes scrollShadowThemes = context.internalTheme.scrollShadow;

    return RepaintBoundary(
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
    );
  }
}
