import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yggdrasil/app/core/yg_route_builder.dart';
import 'package:yggdrasil/app/widgets/yg_screen.dart';
import 'package:yggdrasil/src/components/yg_button/enums/yg_button_variant.dart';
import 'package:yggdrasil/src/components/yg_button/yg_button.dart';

class TestSheetScreen extends StatefulWidget {
  const TestSheetScreen({super.key});

  static const String routeName = 'BottomSheetScreen';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const TestSheetScreen(),
    );
  }

  @override
  State<TestSheetScreen> createState() => _TestSheetScreenState();
}

class _TestSheetScreenState extends State<TestSheetScreen> {
  @override
  Widget build(BuildContext context) {
    return YgScreen(
      componentName: 'Bottom sheet',
      componentDesc: 'Bottom sheet',
      supernovaLink: 'Link',
      scrollable: false,
      child: Column(
        children: <Widget>[
          YgButton(
            variant: ButtonVariant.primary,
            onPressed: () {
              Navigator.of(context).push(YgModalBottomSheetRoute());
            },
            child: const Text('Open sheet'),
          ),
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
  late final AnimationController modalController = widget.controller;

  bool fullyExpanded = false;

  double offset = 0;
  double sheetSize = 100000;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: AnimatedBuilder(
          animation: modalController,
          builder: (BuildContext context, Widget? child) {
            return FractionalTranslation(
              translation: Offset(0, 1 - modalController.value),
              child: child,
            );
          },
          child: ChildSize(
            resizeCallback: (Size size) {
              sheetSize = size.height;
            },
            child: GestureDetector(
              onVerticalDragUpdate: (DragUpdateDetails details) {
                _handleSwipeUpdate(details.delta.dy);
              },
              onVerticalDragCancel: () => handleSwipeEnd(0),
              onVerticalDragEnd: (DragEndDetails details) => handleSwipeEnd(details.primaryVelocity ?? 0),
              child: Material(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.green,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        color: Colors.amber,
                        height: 60,
                        child: const Center(
                          child: Text('Title'),
                        ),
                      ),
                      Flexible(
                        child: SingleChildScrollView(
                          physics: BottomSheetScrollPhysics(
                            transformScroll: transformScroll,
                            handleScrollStop: handleScrollStop,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(
                              4,
                              (int index) => Container(
                                color: HSLColor.fromAHSL(1, index * 80 % 360, 0.70, 0.55).toColor(),
                                height: 100,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void handleSwipeEnd(double velocity) {
    if (!modalController.isAnimating && modalController.value != 1) {
      if (velocity.abs() > 2000) {
        if (velocity > 0) {
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

  void _handleSwipeUpdate(double movement) {
    modalController.value -= movement / sheetSize;
  }

  double transformScroll(double value, ScrollMetrics metrics) {
    final bool isSwipingUp = value < 0 && modalController.value != 1;
    final bool isSwipingDown = metrics.extentBefore == 0 && value > 0;
    if (isSwipingDown || isSwipingUp) {
      _handleSwipeUpdate(value);
      return 0;
    }
    return value;
  }

  bool handleScrollStop(double velocity, ScrollMetrics metrics) {
    handleSwipeEnd(-velocity);
    return modalController.value == 1;
  }
}

class BottomSheetScrollPhysics extends ScrollPhysics {
  /// Creates scroll physics that does not let the user scroll.
  const BottomSheetScrollPhysics({
    super.parent,
    required this.transformScroll,
    required this.handleScrollStop,
  });

  final double Function(double scrollAmount, ScrollMetrics metrics) transformScroll;
  final bool Function(double velocity, ScrollMetrics metrics) handleScrollStop;

  @override
  BottomSheetScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return BottomSheetScrollPhysics(
      parent: buildParent(ancestor),
      transformScroll: transformScroll,
      handleScrollStop: handleScrollStop,
    );
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    return transformScroll(
      super.applyPhysicsToUserOffset(position, offset),
      position,
    );
  }

  @override
  Simulation? createBallisticSimulation(ScrollMetrics position, double velocity) {
    if (!handleScrollStop(velocity, position)) {
      return super.createBallisticSimulation(position, 0);
    }

    return super.createBallisticSimulation(position, velocity);
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
