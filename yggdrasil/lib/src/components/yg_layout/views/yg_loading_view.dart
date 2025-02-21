import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgLoadingView extends StatelessWidget {
  const YgLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const YgLayoutBody(
      child: Center(
        child: YgCircularProgressIndicator(),
      ),
    );
  }
}
