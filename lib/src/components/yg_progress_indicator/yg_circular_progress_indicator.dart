import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/theme/progress_indicator/extensions/_extensions.dart';

class YgCircularProgressIndicator extends StatelessWidget {
  const YgCircularProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final YgProgressIndicatorTheme indicatorTheme = context.progressIndicatorTheme;
    final CircularProgressIndicatorTheme theme = indicatorTheme.circularProgressIndicatorTheme;

    return SizedBox(
      height: theme.indicatorContainerSize,
      width: theme.indicatorContainerSize,
      child: Center(
        child: SizedBox(
          height: theme.indicatorSize,
          width: theme.indicatorSize,
          child: CircularProgressIndicator(
            color: theme.color,
          ),
        ),
      ),
    );
  }
}
