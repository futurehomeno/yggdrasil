import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_bottom_sheet/yg_bottom_sheet_scroll_physics_provider.dart';

import '_yg_bottom_sheet.dart';
import 'child_size.dart';
import 'yg_bottom_sheet_scroll_physics.dart';

class YgModalBottomSheet extends StatefulWidget {
  const YgModalBottomSheet({
    super.key,
    required this.modalController,
    required this.bottomSheet,
  });

  final AnimationController modalController;
  final YgBottomSheet bottomSheet;

  @override
  State<YgModalBottomSheet> createState() => _YgModalBottomSheetState();
}

class _YgModalBottomSheetState extends State<YgModalBottomSheet> {
  bool fullyExpanded = false;

  double offset = 0;
  double sheetSize = 100000;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: AnimatedBuilder(
          animation: widget.modalController,
          builder: (BuildContext context, Widget? child) {
            return FractionalTranslation(
              translation: Offset(0, 1 - widget.modalController.value),
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
              onVerticalDragCancel: () => _handleSwipeEnd(0),
              onVerticalDragEnd: (DragEndDetails details) => _handleSwipeEnd(details.primaryVelocity ?? 0),
              child: YgBottomSheetScrollPhysicsProvider(
                scrollPhysics: YgBottomSheetScrollPhysics(
                  handleScrollStop: _handleScrollStop,
                  transformScroll: _transformScroll,
                ),
                child: widget.bottomSheet,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleSwipeEnd(double velocity) {
    if (!widget.modalController.isAnimating && widget.modalController.value != 1) {
      if (velocity.abs() > 2000) {
        if (velocity > 0) {
          _animateToClosed();
        } else {
          _animatedToOpened();
        }
      } else {
        if (widget.modalController.value > 0.5) {
          _animatedToOpened();
        } else {
          _animateToClosed();
        }
      }
    }
  }

  void _animatedToOpened() {
    widget.modalController.animateTo(
      1,
      duration: const Duration(milliseconds: 225),
      curve: Curves.easeOut,
    );
  }

  void _animateToClosed() async {
    Navigator.of(context).pop();
  }

  void _handleSwipeUpdate(double movement) {
    widget.modalController.value -= movement / sheetSize;
  }

  double _transformScroll(double value, ScrollMetrics metrics) {
    final bool isSwipingUp = value < 0 && widget.modalController.value != 1;
    final bool isSwipingDown = metrics.extentBefore == 0 && value > 0;
    if (isSwipingDown || isSwipingUp) {
      _handleSwipeUpdate(value);
      return 0;
    }
    return value;
  }

  bool _handleScrollStop(double velocity, ScrollMetrics metrics) {
    _handleSwipeEnd(-velocity);
    return widget.modalController.value == 1;
  }
}
