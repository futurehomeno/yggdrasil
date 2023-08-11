import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/theme/progress_indicator/extensions/_extensions.dart';

/// Indicates progress in a circular line.
class YgCircularProgressIndicator extends StatelessWidget {
  const YgCircularProgressIndicator({
    this.value,
    super.key,
  });

  /// Used for specifying the current progress.
  /// Value must be in range of 0.0 to 1.0.
  final double? value;

  @override
  Widget build(BuildContext context) {
    final YgProgressIndicatorTheme indicatorTheme = context.progressIndicatorTheme;
    final CircularProgressIndicatorTheme theme = indicatorTheme.circularProgressIndicatorTheme;

    return SizedBox.square(
      dimension: theme.indicatorContainerSize,
      child: Center(
        child: SizedBox.square(
          dimension: theme.indicatorSize,
          child: CircularProgressIndicator(
            value: value,
            color: theme.color,
            strokeWidth: theme.strokeWidth,
          ),
        ),
      ),
    );
  }
}
