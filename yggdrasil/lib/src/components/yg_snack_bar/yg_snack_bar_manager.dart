// ignore_for_file: prefer-widget-private-members

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

import 'yg_snack_bar.dart';
import 'yg_snack_bar_close_notification.dart';

part 'yg_snack_bar_future.dart';

class YgSnackBarManager extends StatefulWidget {
  const YgSnackBarManager({
    super.key,
    required this.child,
  });

  /// The widget below this widget in the widget tree.
  ///
  /// Every widget bellow this widget in the widget tree will be able use this
  /// widget to show snack bars.
  final Widget child;

  @override
  State<YgSnackBarManager> createState() => YgSnackBarManagerState();

  static YgSnackBarManagerState of(BuildContext context) {
    return context.findAncestorStateOfType<YgSnackBarManagerState>()!;
  }
}

class YgSnackBarManagerState extends State<YgSnackBarManager> with TickerProviderStateMixin {
  final List<_SnackBarEntry> _snackBarQueue = <_SnackBarEntry>[];
  final List<_SnackBarEntry> _renderedSnackBars = <_SnackBarEntry>[];
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
          for (final _SnackBarEntry snackBarData in _renderedSnackBars)
            Positioned(
              key: snackBarData.key,
              bottom: MediaQuery.viewInsetsOf(context).bottom,
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

  YgSnackBarFuture showSnackBar(YgSnackBar snackBar) {
    final Completer<void> completer = Completer<void>();

    final _SnackBarEntry snackBarEntry = _SnackBarEntry(
      snackBar: snackBar,
      completer: completer,
      animationController: AnimationController(vsync: this),
      key: UniqueKey(),
    );

    _snackBarQueue.add(snackBarEntry);

    if (_timer == null) {
      _showNextSnackBar();
    }

    return YgSnackBarFuture._(
      hideCallback: () => _hideSpecificSnackBar(snackBarEntry),
      parent: completer.future,
    );
  }

  void _hideSpecificSnackBar(_SnackBarEntry entry) {
    final int index = _snackBarQueue.indexOf(entry);

    if (index == -1) {
      return;
    }

    if (index == 0) {
      return hideCurrentSnackBar();
    }

    final _SnackBarEntry snackBarEntry = _snackBarQueue.removeAt(index);
    snackBarEntry.animationController.dispose();
    snackBarEntry.completer.complete();
  }

  void hideCurrentSnackBar() {
    _timer?.cancel();
    _timer = null;

    if (_snackBarQueue.isEmpty) {
      return;
    }

    final _SnackBarEntry snackBarEntry = _snackBarQueue.removeAt(0);

    // Start animating the snack bar off screen.
    snackBarEntry.animationController
        .animateTo(
      0,
      curve: _theme.animationCurve,
      duration: _theme.animationDuration,
    )
        .then(
      (_) {
        _renderedSnackBars.remove(snackBarEntry);
        snackBarEntry.animationController.dispose();
        setState(() {});
      },
    );

    snackBarEntry.completer.complete();

    _showNextSnackBar();
  }

  void _showNextSnackBar() {
    if (_snackBarQueue.isEmpty) {
      return;
    }

    final _SnackBarEntry snackBarEntry = _snackBarQueue.first;
    _renderedSnackBars.add(snackBarEntry);

    snackBarEntry.animationController.animateTo(
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

class _SnackBarEntry {
  const _SnackBarEntry({
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
