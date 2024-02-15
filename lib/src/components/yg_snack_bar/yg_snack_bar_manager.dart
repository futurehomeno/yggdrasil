// ignore_for_file: prefer-widget-private-members

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

import 'yg_snack_bar.dart';
import 'yg_snackbar_close_notification.dart';

class YgSnackBarManager extends StatefulWidget {
  const YgSnackBarManager({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<YgSnackBarManager> createState() => YgSnackBarManagerState();

  static YgSnackBarManagerState of(BuildContext context) {
    return context.findAncestorStateOfType<YgSnackBarManagerState>()!;
  }
}

class YgSnackBarManagerState extends State<YgSnackBarManager> with TickerProviderStateMixin {
  final List<_SnackBarData> _snackBarQueue = <_SnackBarData>[];
  final List<_SnackBarData> _renderedSnackBars = <_SnackBarData>[];
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<YgSnackBarCloseNotification>(
      onNotification: _onCloseSnackBarNotification,
      child: Stack(
        children: <Widget>[
          widget.child,
          for (final _SnackBarData snackBarData in _renderedSnackBars)
            Positioned(
              key: snackBarData.key,
              bottom: 0,
              right: 0,
              left: 0,
              child: RepaintBoundary(
                child: AnimatedBuilder(
                  animation: snackBarData.animationController,
                  builder: (BuildContext context, Widget? child) {
                    return Align(
                      alignment: Alignment.topRight,
                      heightFactor: snackBarData.animationController.value,
                      child: child,
                    );
                  },
                  child: SafeArea(
                    child: Padding(
                      padding: _theme.margin,
                      child: snackBarData.snackBar,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  bool _onCloseSnackBarNotification(YgSnackBarCloseNotification notification) {
    hideCurrentSnackBar();

    return true;
  }

  Future<void> showSnackBar(YgSnackBar snackBar) {
    final Completer<void> completer = Completer<void>();

    _snackBarQueue.add(_SnackBarData(
      snackBar: snackBar,
      completer: completer,
      animationController: AnimationController(vsync: this),
      key: UniqueKey(),
    ));

    if (_timer == null) {
      _showNextSnackBar();
    }

    return completer.future;
  }

  void hideCurrentSnackBar() {
    _timer?.cancel();
    _timer = null;

    if (_snackBarQueue.isEmpty) {
      return;
    }

    final _SnackBarData snackBar = _snackBarQueue.removeAt(0);

    // Start animating the snack bar off screen.
    snackBar.animationController
        .animateTo(
      0,
      curve: _theme.animationCurve,
      duration: _theme.animationDuration,
    )
        .then(
      (_) {
        _renderedSnackBars.remove(snackBar);
        snackBar.animationController.dispose();
        setState(() {});
      },
    );

    snackBar.completer.complete();

    _showNextSnackBar();
  }

  void _showNextSnackBar() {
    if (_snackBarQueue.isEmpty) {
      return;
    }

    final _SnackBarData snackBar = _snackBarQueue.first;
    _renderedSnackBars.add(snackBar);

    snackBar.animationController.animateTo(
      1,
      duration: _theme.animationDuration,
      curve: _theme.animationCurve,
    );

    _timer = Timer(
      _theme.animationDuration + _theme.shownDuration,
      hideCurrentSnackBar,
    );

    setState(() {});
  }

  YgSnackBarTheme get _theme => context.snackBarTheme;
}

class _SnackBarData {
  const _SnackBarData({
    required this.snackBar,
    required this.completer,
    required this.animationController,
    required this.key,
  });

  final YgSnackBar snackBar;
  final Completer<void> completer;
  final AnimationController animationController;
  final Key key;
}
