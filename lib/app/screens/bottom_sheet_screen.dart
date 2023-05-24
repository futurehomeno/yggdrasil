import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yggdrasil/app/core/_core.dart';
import 'package:yggdrasil/src/components/_components.dart';

import '../widgets/yg_screen.dart';

class BottomSheetScreen extends StatefulWidget {
  const BottomSheetScreen({super.key});

  static const String routeName = 'BottomSheetScreen';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const BottomSheetScreen(),
    );
  }

  @override
  State<BottomSheetScreen> createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen> with TickerProviderStateMixin {
  double offset = 0;

  @override
  Widget build(BuildContext context) {
    return YgScreen(
      componentName: 'Bottom sheet',
      componentDesc: 'Bottom sheet',
      supernovaLink: 'Link',
      scrollable: false,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          YgButton(
            variant: ButtonVariant.primary,
            onPressed: () {
              Navigator.of(context).push(YgModalBottomSheetRoute());
            },
            child: const Text('Show default bottom sheet'),
          ),
          YgButton(
            variant: ButtonVariant.primary,
            onPressed: () {
              showModalBottomSheet<Widget>(
                isScrollControlled: true,
                isDismissible: true,
                context: context,
                builder: (BuildContext context) {
                  return DraggableScrollableSheet(
                    initialChildSize: 0.4,
                    expand: false,
                    builder: (BuildContext context, ScrollController scrollController) {
                      return SingleChildScrollView(
                        controller: scrollController,
                        child: YgBottomSheet(
                          title: 'Sheet title',
                          content: SingleChildScrollView(
                            controller: scrollController,
                            child: AspectRatio(
                              aspectRatio: 0.1,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ),
                          footer: YgButton(
                            variant: ButtonVariant.primary,
                            onPressed: () {},
                            child: const Text('Button'),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
            child: const Text('Show material bottom sheet'),
          ),
          // const YgModalBottomSheet(),
        ],
      ),
    );
  }
}

class YgModalBottomSheetRoute extends PopupRoute<YgModalBottomSheet> {
  late AnimationController _controller;

  @override
  Color? get barrierColor => Colors.black.withAlpha(0x50);

  // This allows the popup to be dismissed by tapping the scrim or by pressing
  // the escape key on the keyboard.
  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => 'Dismissible Dialog';

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  Curve get barrierCurve => Curves.easeOut;

  @override
  AnimationController createAnimationController() {
    _controller = AnimationController(
      duration: transitionDuration,
      reverseDuration: transitionDuration,
      vsync: navigator!,
      value: 0,
    );
    return _controller;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return YgModalBottomSheet(
      controller: _controller,
    );
  }
}

class YgModalBottomSheet extends StatefulWidget {
  const YgModalBottomSheet({
    super.key,
    required this.controller,
  });

  final AnimationController controller;

  @override
  State<YgModalBottomSheet> createState() => _YgModalBottomSheetState();
}

class _YgModalBottomSheetState extends State<YgModalBottomSheet> {
  double bottomSheetHeight = 1000000;

  double dragStartPosition = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onTap: () {},
            onVerticalDragStart: (DragStartDetails details) {
              dragStartPosition = details.localPosition.dy;
            },
            onVerticalDragUpdate: (DragUpdateDetails details) {
              widget.controller.value -= details.delta.dy / bottomSheetHeight;
            },
            onVerticalDragCancel: _handleSwipeEnd,
            onVerticalDragEnd: _handleSwipeEnd,
            child: FractionallySizedBox(
              widthFactor: 1,
              child: AnimatedBuilder(
                animation: widget.controller,
                builder: _buildTranslate,
                child: ChildSize(
                  resizeCallback: _bottomSheetResized,
                  child: YgBottomSheet(
                    title: 'Sheet title',
                    content: SingleChildScrollView(
                      child: AspectRatio(
                        aspectRatio: 0.5,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    footer: YgButton(
                      variant: ButtonVariant.primary,
                      onPressed: () {},
                      child: const Text('Button'),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _handleSwipeEnd([DragEndDetails? details]) {
    if (details?.primaryVelocity != null && details!.primaryVelocity!.abs() > 250) {
      if (details.primaryVelocity! > 0) {
        _animateToClosed();
      } else {
        _animatedToOpened();
      }
    } else {
      if (widget.controller.value > 0.5) {
        _animatedToOpened();
      } else {
        _animateToClosed();
      }
    }
  }

  void _animatedToOpened() {
    widget.controller.animateTo(
      1,
      duration: const Duration(milliseconds: 225),
      curve: Curves.easeOut,
    );
  }

  void _animateToClosed() async {
    Navigator.of(context).pop();
  }

  void _bottomSheetResized(Size size) {
    bottomSheetHeight = size.height;
  }

  Widget _buildTranslate(BuildContext context, Widget? child) {
    return Transform.translate(
      offset: Offset(
        0,
        bottomSheetHeight * (1 - widget.controller.value),
      ),
      child: child,
    );
  }
}

typedef ResizeCallback = void Function(Size size);

class ChildSize extends SingleChildRenderObjectWidget {
  const ChildSize({
    super.key,
    required super.child,
    required this.resizeCallback,
  });

  final ResizeCallback resizeCallback;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderChildSize(
      resizeCallback: resizeCallback,
    );
  }

  @override
  void updateRenderObject(BuildContext context, RenderChildSize renderObject) {
    renderObject.resizeCallback = resizeCallback;
  }
}

class RenderChildSize extends RenderBox with RenderObjectWithChildMixin<RenderBox> {
  RenderChildSize({
    required ResizeCallback resizeCallback,
  }) : _resizeCallback = resizeCallback;

  Size _lastSize = Size.zero;

  ResizeCallback _resizeCallback;

  ResizeCallback get resizeCallback {
    return _resizeCallback;
  }

  set resizeCallback(ResizeCallback value) {
    _resizeCallback = value;
    _resizeCallback(_lastSize);
  }

  @override
  void performLayout() {
    final RenderBox? child = this.child;
    if (child != null) {
      child.layout(constraints, parentUsesSize: true);
      size = child.size;

      if (_lastSize != size) {
        _lastSize = size;
        _resizeCallback(_lastSize);
      }
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final RenderBox? child = this.child;
    if (child != null) {
      child.paint(context, offset);
    }
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    final RenderBox? child = this.child;
    if (child != null) {
      return child.hitTest(
        result,
        position: position,
      );
    }
    return false;
  }
}
