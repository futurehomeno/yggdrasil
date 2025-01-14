import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

class YgFieldCounter extends StatelessWidget {
  const YgFieldCounter({
    super.key,
    required this.controller,
    required this.maxLength,
  });

  final TextEditingController controller;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    final YgFieldTheme fieldTheme = context.fieldTheme;
    final YgFieldDecorationTheme theme = fieldTheme.decorationTheme;

    return ListenableBuilder(
      listenable: controller,
      builder: (BuildContext context, Widget? child) {
        final int count = controller.text.length;

        final TextStyle style;
        if (count > maxLength) {
          style = theme.errorTextStyle;
        } else {
          style = theme.counterTextStyle;
        }

        return AnimatedDefaultTextStyle(
          style: style,
          duration: fieldTheme.animationDuration,
          curve: fieldTheme.animationCurve,
          child: Text(
            '$count / $maxLength',
          ),
        );
      },
    );
  }
}
