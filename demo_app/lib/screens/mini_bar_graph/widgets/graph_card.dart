import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yggdrasil/yggdrasil.dart';

class GraphCard extends StatelessWidget {
  const GraphCard({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: YgCard(
        variant: YgCardVariant.outlined,
        child: AspectRatio(
          aspectRatio: 1,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
