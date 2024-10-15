import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
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
    final YgSearchFieldTheme theme = context.searchFieldTheme;

    return RepaintBoundary(
      child: ListenableBuilder(
        listenable: loading,
        builder: (BuildContext context, Widget? spinner) {
          print('IN WIDGET: ${loading.value}');

          return YgConstantSizeAnimatedCrossFade(
            firstChild: child,
            secondChild: spinner!,
            crossFadeState: loading.value ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: theme.animationDuration,
            curve: theme.animationCurve,
          );
        },
        child: SizedBox.fromSize(
          size: theme.progressIndicatorSize,
          child: CircularProgressIndicator(
            strokeWidth: 2.5,
            color: theme.progressIndicatorColor,
          ),
        ),
      ),
    );
  }
}
