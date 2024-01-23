part of 'yg_bottom_sheet_modal_route.dart';

class _YgBottomSheetModal extends StatefulWidget {
  const _YgBottomSheetModal({
    required this.modalController,
    required this.bottomSheet,
  });

  final AnimationController modalController;
  final Widget bottomSheet;

  @override
  State<_YgBottomSheetModal> createState() => _YgBottomSheetModalState();
}

class _YgBottomSheetModalState extends State<_YgBottomSheetModal> {
  /// Set to true when the content of the [YgBottomSheet] is being scrolled.
  bool _isScrolling = false;

  /// The size of the [YgBottomSheet], can be null because the size is only known
  /// after the first build / layout.
  double? _sheetSize;

  /// The current curve applied to the movement of the [YgBottomSheet].
  late ParametricCurve<double> _curve = context.bottomSheetTheme.movementAnimationCurve;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: AnimatedBuilder(
          animation: widget.modalController,
          builder: (BuildContext context, Widget? child) {
            return FractionalTranslation(
              translation: Offset(
                0,
                1 - _curve.transform(widget.modalController.value),
              ),
              child: child,
            );
          },
          child: YgChildSizeObserver(
            resizeCallback: _resizeCallback,
            child: GestureDetector(
              onVerticalDragUpdate: _onVerticalDragUpdate,
              onVerticalDragCancel: _onVerticalDragCancel,
              onVerticalDragEnd: _onVerticalDragEnd,
              child: YgBottomSheetScrollPhysicsProvider(
                scrollPhysics: YgBottomSheetScrollPhysics(
                  handleScrollSwipeEnd: _handleScrollStop,
                  handleScrollSwipeUpdate: _handleScrollSwipeUpdate,
                ),
                child: widget.bottomSheet,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _resizeCallback(Size size) {
    _sheetSize = size.height;
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    _handleSwipeUpdate(details.delta.dy);
  }

  void _onVerticalDragEnd(DragEndDetails details) {
    _handleSwipeEnd(details.primaryVelocity ?? 0);
  }

  void _onVerticalDragCancel() {
    _handleSwipeEnd(0);
  }

  void _animatedToOpened() {
    widget.modalController.animateTo(
      1,
      duration: context.bottomSheetTheme.movementAnimationDuration,
    );
  }

  void _animateToClosed() {
    // We don't actually need to animate it as this will already be done by the
    // modal route.
    Navigator.of(context).maybePop();
  }

  void _handleSwipeEnd(double velocity) {
    _curve = YgSuspendedCurve(
      widget.modalController.value,
      curve: context.bottomSheetTheme.movementAnimationCurve,
    );

    if (widget.modalController.isAnimating || widget.modalController.value == 1) {
      return;
    }

    // If velocity if above fling velocity, animate to the fling direction, else
    // animate to the nearest point.
    final bool swipeToOpened;
    if (velocity.abs() > context.bottomSheetTheme.flingVelocity) {
      swipeToOpened = velocity < 0;
    } else {
      swipeToOpened = widget.modalController.value > 0.5;
    }

    if (swipeToOpened) {
      _animatedToOpened();
    } else {
      _animateToClosed();
    }
  }

  void _handleSwipeUpdate(double movement) {
    _curve = Curves.linear;

    if (_sheetSize != null) {
      widget.modalController.value -= movement / _sheetSize!;
    }
  }

  bool _handleScrollSwipeUpdate(ScrollMetrics metrics, double value) {
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
