import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

class WidgetOrLoading extends StatelessWidget {
  const WidgetOrLoading({
    required this.child,
    required this.loading,
    super.key,
  });

  final Widget child;
  final ValueNotifier<bool> loading;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: loading,
      builder: (BuildContext context, Widget? spinner) {
        return YgConstantSizeAnimatedCrossFade(
          firstChild: child,
          secondChild: spinner!,
          crossFadeState: loading.value ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 200),
        );
      },
      child: const SizedBox(
        height: 22.5,
        width: 22.5,
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
        ),
      ),
    );
  }
}
