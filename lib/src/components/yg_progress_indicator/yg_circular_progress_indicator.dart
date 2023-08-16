import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_debug/stateless_widget_debug_mixin.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/theme/progress_indicator/extensions/_extensions.dart';

/// Shows progress along a circle.
class YgCircularProgressIndicator extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgCircularProgressIndicator({
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
    final CircularProgressIndicatorTheme circularProgressIndicatorTheme =
        context.progressIndicatorTheme.circularProgressIndicatorTheme;

    return SizedBox.square(
      dimension: circularProgressIndicatorTheme.containerSize,
      child: Center(
        child: SizedBox.square(
          dimension: circularProgressIndicatorTheme.size,
          child: CircularProgressIndicator(
            value: value,
            color: circularProgressIndicatorTheme.color,
            strokeWidth: circularProgressIndicatorTheme.strokeWidth,
          ),
        ),
      ),
    );
  }
}
