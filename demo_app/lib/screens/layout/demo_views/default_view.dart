import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class DefaultView extends StatelessWidget {
  const DefaultView({super.key});

  @override
  Widget build(BuildContext context) {
    return const YgLayoutBody(
      child: YgSection(
        child: DemoPlaceholder(),
      ),
    );
  }
}
