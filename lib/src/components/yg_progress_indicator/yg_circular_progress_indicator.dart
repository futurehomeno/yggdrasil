import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

class YgCircularProgressIndicator extends StatelessWidget {
  const YgCircularProgressIndicator({
    required this.value,
    super.key,
  });

  final double value;

  @override
  Widget build(BuildContext context) {
    final YgProgressIndicatorTheme theme = context.progressIndicatorTheme;

    return SizedBox(
      height: 30.0, //theme.circularProgressIndicatorTheme.indicatorContainerSize,
      width: 30.0, //theme.circularProgressIndicatorTheme.indicatorContainerSize,
      child: SizedBox(
        height: 10.0, // theme.circularProgressIndicatorTheme.activeIndicatorSize,
        width: 10.0, //theme.circularProgressIndicatorTheme.activeIndicatorSize,
        child: CircularProgressIndicator(
          value: value,
          color: theme.circularProgressIndicatorTheme.activeColor,
        ),
      ),
    );
  }
}
