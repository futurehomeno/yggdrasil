import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class CenteredView extends StatelessWidget {
  const CenteredView({super.key});

  @override
  Widget build(BuildContext context) {
    return const YgLayoutBody(
      child: Center(
        child: DemoPlaceholder(),
      ),
    );
  }
}
