import 'package:flutter/material.dart';

class InspectWrapper extends StatefulWidget {
  const InspectWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<InspectWrapper> createState() => _InspectWrapperState();
}

class _InspectWrapperState extends State<InspectWrapper> {
  @override
  Widget build(BuildContext context) {
    final YgOutlineInheritedState? state = YgOutlineInheritedState.of(context);
    return Stack(
      children: <Widget>[
        FractionallySizedBox(
          widthFactor: 1,
          child: widget.child,
        ),
        Positioned.fill(
          child: IgnorePointer(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              decoration: BoxDecoration(
                border: state?.toggled == true
                    ? Border.all(
                        width: 1,
                        color: const Color(0xffff00ff),
                      )
                    : null,
              ),
            ),
          ),
        ),
      ],
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
