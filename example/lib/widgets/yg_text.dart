import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

// DO NOT USE! This is a temporary widget to make the demo work.
class YgText extends StatelessWidget {
  const YgText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.tokens.textStyles.paragraph3Regular.copyWith(
        color: context.tokens.colors.textWeak,
      ),
    );
  }
}
