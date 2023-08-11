import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/theme/progress_indicator/extensions/_extensions.dart';

/// Indicates progress in a linear horizontal line.
class YgLinearProgressIndicator extends StatelessWidget {
  const YgLinearProgressIndicator({
    this.value,
    super.key,
  });

  /// Used for specifying the current progress.
  /// Value must be in range of 0.0 to 1.0.
  final double? value;

  @override
  Widget build(BuildContext context) {
    final YgProgressIndicatorTheme indicatorTheme = context.progressIndicatorTheme;
    final LinearProgressIndicatorTheme theme = indicatorTheme.linearProgressIndicatorTheme;

    return ClipRRect(
      borderRadius: theme.borderRadius,
      child: SizedBox(
        height: theme.height,
        child: LinearProgressIndicator(
          value: value,
          color: theme.color,
          backgroundColor: theme.backgroundColor,
        ),
      ),
    );
  }
}
