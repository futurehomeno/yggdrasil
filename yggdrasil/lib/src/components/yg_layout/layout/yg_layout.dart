import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_layout/enums/_enums.dart';
import 'package:yggdrasil/src/components/yg_layout/models/yg_layout_tab.dart';
import 'package:yggdrasil/src/components/yg_tab/yg_tab.dart';
import 'package:yggdrasil/src/components/yg_tab/yg_tab_bar.dart';

import 'controller/yg_layout_header_controller.dart';
import 'widgets/yg_layout_header_controller_provider.dart';
import 'widgets/yg_layout_internal/yg_layout_internal.dart';

part 'yg_layout_regular.dart';
part 'yg_layout_tabbed.dart';

abstract class YgLayout extends StatefulWidget {
  const factory YgLayout({
    Widget? appBar,
    required Widget child,
    YgHeaderBehavior headerBehavior,
    Key? key,
    Widget? trailing,
  }) = YgLayoutRegular;

  const factory YgLayout.tabbed({
    Widget? appBar,
    YgHeaderBehavior headerBehavior,
    int initialTab,
    Key? key,
    bool loading,
    required List<YgLayoutTab> tabs,
    Widget? trailing,
  }) = YgLayoutTabbed;

  const YgLayout._({
    super.key,
    this.appBar,
    this.trailing,
    this.headerBehavior = YgHeaderBehavior.fixed,
  });

  final Widget? appBar;
  final YgHeaderBehavior headerBehavior;
  final Widget? trailing;

  @override
  State<YgLayout> createState();
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
