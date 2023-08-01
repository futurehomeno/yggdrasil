import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/theme.dart';

/// Handle used in the [YgSwitch].
class YgSwitchHandle extends StatelessWidget {
  const YgSwitchHandle({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.switchTheme.handleSize,
      width: context.switchTheme.handleSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
