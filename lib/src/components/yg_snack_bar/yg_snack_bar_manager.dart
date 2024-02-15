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
  final List<SnackBarCompleterCombo> _snackBars = <SnackBarCompleterCombo>[];
  final List<SnackBarCompleterCombo> _renderedSnackBars = <SnackBarCompleterCombo>[];
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
          for (final SnackBarCompleterCombo snackBar in _renderedSnackBars)
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: RepaintBoundary(
                child: AnimatedBuilder(
                  animation: snackBar.animationController,
                  builder: (BuildContext context, Widget? child) {
                    return Align(
                      alignment: Alignment.topRight,
                      heightFactor: snackBar.animationController.value,
                      child: SafeArea(
                        child: Padding(
                          padding: _theme.margin,
                          child: child!,
                        ),
                      ),
                    );
                  },
                  child: snackBar.snackBar,
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

    _snackBars.add(SnackBarCompleterCombo(
      snackBar: snackBar,
      completer: completer,
      animationController: AnimationController(vsync: this),
    ));

    if (_timer == null) {
      _showNextSnackBar();
    }

    return completer.future;
  }

  void hideCurrentSnackBar() {
    _timer?.cancel();
    _timer = null;

    if (_snackBars.isEmpty) {
      return;
    }

    final SnackBarCompleterCombo snackBar = _snackBars.removeAt(0);

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
        setState(() {});
      },
    );

    snackBar.completer.complete();

    _showNextSnackBar();
  }

  void _showNextSnackBar() {
    if (_snackBars.isEmpty) {
      return;
    }

    final SnackBarCompleterCombo snackBar = _snackBars.first;
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

class SnackBarCompleterCombo {
  const SnackBarCompleterCombo({
    required this.snackBar,
    required this.completer,
    required this.animationController,
  });

  final YgSnackBar snackBar;
  final Completer<void> completer;
  final AnimationController animationController;
}
