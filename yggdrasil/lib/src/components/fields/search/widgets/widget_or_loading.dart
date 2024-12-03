import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/fields/search/controller/yg_search_controller.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

/// Internal animated loading switcher.
///
/// Switches between a [child] and a loading indicator while maintaining the
/// size of the [child] or loading indicator, based on which is largest.
class WidgetOrLoading extends StatelessWidget {
  const WidgetOrLoading({
    required this.child,
    required this.controller,
    super.key,
  });

  final Widget child;
  final YgSearchControllerAny<Object?, Object?> controller;

  @override
  Widget build(BuildContext context) {
    final YgSearchFieldTheme theme = context.searchFieldTheme;

    return RepaintBoundary(
      child: YgOptimizedListenableBuilder<bool>(
        listenable: controller,
        getValue: () => controller.loading,
        builder: (BuildContext context, bool loading, Widget? spinner) {
          return YgConstantSizeAnimatedCrossFade(
            firstChild: child,
            secondChild: spinner!,
            crossFadeState: loading ? CrossFadeState.showSecond : CrossFadeState.showFirst,
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
