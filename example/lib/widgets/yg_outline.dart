import 'package:flutter/material.dart';

extension InspectWrapperWidgetExtension on Widget {
  Widget get inspectable {
    return InspectWrapper(
      child: this,
    );
  }
}

class InspectWrapper extends StatelessWidget {
  const InspectWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final YgOutlineInheritedState? state = YgOutlineInheritedState.of(context);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: state?.toggled == true ? const Color(0xffff00ff) : Colors.transparent,
        ),
      ),
      child: child,
    );
  }
}

class YgOutlineInheritedState extends InheritedWidget {
  const YgOutlineInheritedState({
    super.key,
    required this.toggled,
    required super.child,
  });

  final bool toggled;

  static YgOutlineInheritedState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<YgOutlineInheritedState>();
  }

  @override
  bool updateShouldNotify(YgOutlineInheritedState oldWidget) {
    return toggled != oldWidget.toggled;
  }
}
