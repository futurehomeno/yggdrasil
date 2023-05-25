import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import '../_yg_bottom_sheet.dart';

class YgBottomSheetModal extends StatefulWidget {
  const YgBottomSheetModal({
    super.key,
    required this.modalController,
    required this.bottomSheet,
  });

  final AnimationController modalController;
  final YgBottomSheet bottomSheet;

  @override
  State<YgBottomSheetModal> createState() => _YgBottomSheetModalState();
}

class _YgBottomSheetModalState extends State<YgBottomSheetModal> {
  bool _isScrolling = false;
  double? _sheetSize;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: AnimatedBuilder(
          animation: widget.modalController,
          builder: (BuildContext context, Widget? child) {
            return FractionalTranslation(
              translation: Offset(
                0,
                1 - widget.modalController.value,
              ),
              child: child,
            );
          },
          child: YgChildSizeObserver(
            resizeCallback: (Size size) {
              _sheetSize = size.height;
            },
            child: GestureDetector(
              onVerticalDragUpdate: (DragUpdateDetails details) {
                _handleSwipeUpdate(details.delta.dy);
              },
              onVerticalDragCancel: () {
                _handleSwipeEnd(0);
              },
              onVerticalDragEnd: (DragEndDetails details) {
                _handleSwipeEnd(details.primaryVelocity ?? 0);
              },
              child: YgBottomSheetScrollPhysicsProvider(
                scrollPhysics: YgBottomSheetScrollPhysics(
                  handleScrollSwipeEnd: _handleScrollStop,
                  handleScrollSwipeUpdate: _transformScroll,
                ),
                child: widget.bottomSheet,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _animatedToOpened() {
    widget.modalController.animateTo(
      1,
      duration: const Duration(milliseconds: 225),
      curve: Curves.easeOut,
    );
  }

  void _animateToClosed() async {
    // We don't actually need to animate it as this will already be done by the
    // modal route.
    Navigator.of(context).pop();
  }

  void _handleSwipeEnd(double velocity) {
    if (widget.modalController.isAnimating || widget.modalController.value == 1) {
      return;
    }

    // If velocity if above fling velocity, animate to the fling direction, else
    // animate to the nearest point.
    final bool swipeToOpened = velocity.abs() > 2000 ? velocity < 0 : widget.modalController.value > 0.5;

    if (swipeToOpened) {
      _animatedToOpened();
    } else {
      _animateToClosed();
    }
  }

  void _handleSwipeUpdate(double movement) {
    if (_sheetSize != null) {
      widget.modalController.value -= movement / _sheetSize!;
    }
  }

  bool _transformScroll(ScrollMetrics metrics, double value) {
    // Check if the modal is being scrolled or swiped away, when it is being
    // scrolled don't animate the modal, if the modal is being swiped away don't
    // scroll it's content.
    final bool isSwipingUp = value < 0 && widget.modalController.value != 1;
    final bool isSwipingDown = metrics.extentBefore == 0 && value > 0 && !_isScrolling;
    if (isSwipingDown || isSwipingUp) {
      _handleSwipeUpdate(value);
      return false;
    }

    // Only set this to true if we are not swiping the modal.
    _isScrolling = true;

    return true;
  }

  bool _handleScrollStop(ScrollMetrics metrics, double velocity) {
    _handleSwipeEnd(-velocity);
    _isScrolling = false;

    // If the modal is not completely opened we should not apply a fling to the
    // content of the modal, as the swiping was controlling the modal, not the
    // scroll of its content.
    return widget.modalController.value == 1;
  }
}
