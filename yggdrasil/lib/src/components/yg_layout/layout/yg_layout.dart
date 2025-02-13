import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_layout/enums/_enums.dart';
import 'package:yggdrasil/src/components/yg_layout/models/yg_layout_tab.dart';
import 'package:yggdrasil/src/components/yg_tab/yg_tab.dart';
import 'package:yggdrasil/src/components/yg_tab/yg_tab_bar.dart';
import 'package:yggdrasil/src/utils/yg_debug/_yg_debug.dart';

import 'controller/yg_layout_header_controller.dart';
import 'widgets/yg_layout_header_controller_provider.dart';
import 'widgets/yg_layout_internal/yg_layout_internal.dart';

part 'yg_layout_regular.dart';
part 'yg_layout_tabbed.dart';

/// A top level layout component.
///
/// Places the [appBar] and [trailing] in the header, and places any content
/// below the header. Also animated the header on or off screen based on the
/// scroll input from the child [YgLayoutBody].
abstract class YgLayout extends StatefulWidget with StatefulWidgetDebugMixin {
  /// Creates a layout with a single child.
  const factory YgLayout({
    Widget? appBar,
    required Widget child,
    YgHeaderBehavior headerBehavior,
    Key? key,
    Widget? bottom,
  }) = YgLayoutRegular;

  /// Creates a layout with tabs.
  ///
  /// Internally manages the tab controller and tab bar view. Automatically
  /// selects the current tab as the scroll shadow and header animation provider.
  ///
  /// Automatically resets the header location if the selected tab changes.
  const factory YgLayout.tabbed({
    Widget? appBar,
    YgHeaderBehavior headerBehavior,
    int initialTab,
    Key? key,
    required List<YgLayoutTab> tabs,
    Widget? bottom,
  }) = YgLayoutTabbed;

  const YgLayout._({
    super.key,
    this.appBar,
    this.bottom,
    this.headerBehavior = YgHeaderBehavior.fixed,
  });

  /// The AppBar shown in the header on the top of the view.
  ///
  /// This widget will get hidden when the user scroll if [headerBehavior] is
  /// set to hideAppBar or hideEverything.
  final Widget? appBar;

  /// The widget shown bellow the [appBar].
  ///
  /// This widget will get hidden when the user scrolls if [headerBehavior] is
  /// set to hideEverything.
  final Widget? bottom;

  /// The scrolling related header behavior.
  ///
  /// Defines whether the header should stay fixed, hide the [appBar], or hide
  /// completely when the user scrolls.
  final YgHeaderBehavior headerBehavior;

  @override
  State<YgLayout> createState();

  @override
  YgDebugType get debugType => YgDebugType.layout;
}

abstract class _YgLayoutState<T extends YgLayout> extends State<T> with TickerProviderStateMixin {
  late final YgLayoutHeaderController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YgLayoutHeaderController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
