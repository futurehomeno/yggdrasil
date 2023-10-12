import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// Shows progress along a line.
class YgLinearProgressIndicator extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgLinearProgressIndicator({
    super.key,
    this.value,
  });

  /// Used for specifying the current progress.
  ///
  /// Value must be in range of 0.0 to 1.0.
  /// Pass `null` to turn into an indeterminate progress indicator.
  final double? value;

  @override
  Widget build(BuildContext context) {
    final LinearProgressIndicatorTheme linearProgressIndicatorTheme =
        context.progressIndicatorTheme.linearProgressIndicatorTheme;

    return ClipRRect(
      borderRadius: linearProgressIndicatorTheme.borderRadius,
      child: SizedBox(
        height: linearProgressIndicatorTheme.height,
        child: LinearProgressIndicator(
          value: value,
          color: linearProgressIndicatorTheme.color,
          backgroundColor: linearProgressIndicatorTheme.backgroundColor,
        ),
      ),
    );
  }
}
