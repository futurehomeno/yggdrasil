import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/yg_size_transition.dart';

/// Allows you to switch between dialogs using a predefined animation.
class YgDialogSwitcher extends StatefulWidget {
  const YgDialogSwitcher({
    super.key,
    required this.child,
  });

  /// The widget rendered under this widget in the widget tree.
  ///
  /// When this widget is replaced with a different widget, for example when
  /// supplying a dialog with a different key, the old widget will be faded out
  /// and the size of the widget will be animate to the size of the new dialog.
  final Widget child;

  @override
  State<YgDialogSwitcher> createState() => _YgDialogSwitcherState();
}

class _YgDialogSwitcherState extends State<YgDialogSwitcher> with TickerProviderStateMixin {
  late final AnimationController _sizeTransitionController = AnimationController(vsync: this);
  final List<_YgSwitcherEntry> _renderedEntries = <_YgSwitcherEntry>[];
  late _YgSwitcherEntry _currentEntry;

  @override
  void initState() {
    super.initState();
    _addCurrentEntry();
  }

  @override
  void dispose() {
    for (final _YgSwitcherEntry entry in _renderedEntries) {
      entry.controller.dispose();
    }
    _sizeTransitionController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant YgDialogSwitcher oldWidget) {
    // We can not use the theme outside of the build method, but we need the
    // animation here, this is dumb, but for now that means we need to hardcode
    // the animation values, until we have a replacement for tailor which does
    // let you use the theme outside of the build method.

    if (!Widget.canUpdate(oldWidget.child, widget.child)) {
      final _YgSwitcherEntry oldEntry = _currentEntry;
      oldEntry.controller
          .animateTo(
        0,
        curve: const Cubic(0.42, 0, 0.2, 1),
        duration: const Duration(milliseconds: 300),
      )
          .then(
        (_) {
          _renderedEntries.remove(oldEntry);
          oldEntry.controller.dispose();
          if (mounted) {
            setState(() {});
          }
        },
      );

      _addCurrentEntry();
      _sizeTransitionController.value = 0;
      _sizeTransitionController.animateTo(
        1,
        curve: const Cubic(0.42, 0, 0.2, 1),
        duration: const Duration(milliseconds: 300),
      );
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final YgDialogTheme theme = context.dialogTheme;

    return RepaintBoundary(
      child: ClipRRect(
        borderRadius: theme.outerBorderRadius,
        child: YgSizeTransition(
          animation: _sizeTransitionController,
          children: _renderedEntries
              .map(
                (_YgSwitcherEntry entry) => FadeTransition(
                  opacity: entry.controller,
                  key: entry.key,
                  child: entry.child,
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  void _addCurrentEntry() {
    _currentEntry = _YgSwitcherEntry(
      key: UniqueKey(),
      child: widget.child,
      controller: AnimationController(
        vsync: this,
        value: 1,
      ),
    );
    _renderedEntries.add(_currentEntry);
  }
}

class _YgSwitcherEntry {
  const _YgSwitcherEntry({
    required this.child,
    required this.controller,
    required this.key,
  });

  final Widget child;
  final AnimationController controller;
  final Key key;
}
