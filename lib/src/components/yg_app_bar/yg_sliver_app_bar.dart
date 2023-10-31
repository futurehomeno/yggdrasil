import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_app_bar/widgets/_widgets.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// App bar that can be placed in a [CustomScrollView].
class YgSliverAppBar extends StatelessWidget {
  const YgSliverAppBar({
    super.key,
    required this.title,
    required this.variant,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.actions = const <Widget>[],
  });

  // region Values

  final String title;
  final YgSliverAppBarVariant variant;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final List<Widget> actions;

  // endregion

  @override
  Widget build(BuildContext context) {
    final YgAppBarTheme theme = context.appBarTheme;

    final double topPadding = MediaQuery.paddingOf(context).top;
    final double collapsedHeight = theme.toolbarHeight + topPadding;

    return switch (variant) {
      YgSliverAppBarVariant.small => MediaQuery.removePadding(
          context: context,
          removeBottom: true,
          child: SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              leading: leading,
              automaticallyImplyLeading: automaticallyImplyLeading,
              title: title,
              actions: actions,
              topPadding: topPadding,
              collapsedHeight: collapsedHeight,
              expandedHeight: collapsedHeight,
            ),
          ),
        ),
      YgSliverAppBarVariant.medium => MediaQuery.removePadding(
          context: context,
          removeBottom: true,
          child: SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              leading: leading,
              automaticallyImplyLeading: automaticallyImplyLeading,
              actions: actions,
              topPadding: topPadding,
              collapsedHeight: collapsedHeight,
              expandedHeight: theme.mediumAppBarTheme.expandedHeight,
              flexibleSpace: YgFlexibleSpaceBar(
                expandedTitleScale: theme.mediumAppBarTheme.expandedTitleScale,
                topTitlePadding: theme.mediumAppBarTheme.topTitlePadding,
                bottomTitlePadding: theme.mediumAppBarTheme.bottomTitlePadding,
                actionsCount: actions.length,
                hasLeading: leading != null || automaticallyImplyLeading,
                title: Text(
                  title,
                  style: theme.titleTextStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ),
      YgSliverAppBarVariant.large => MediaQuery.removePadding(
          context: context,
          removeBottom: true,
          child: SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              leading: leading,
              automaticallyImplyLeading: automaticallyImplyLeading,
              actions: actions,
              topPadding: topPadding,
              collapsedHeight: collapsedHeight,
              expandedHeight: theme.largeAppBarTheme.expandedHeight,
              flexibleSpace: YgFlexibleSpaceBar(
                expandedTitleScale: theme.largeAppBarTheme.expandedTitleScale,
                topTitlePadding: theme.largeAppBarTheme.topTitlePadding,
                bottomTitlePadding: theme.largeAppBarTheme.bottomTitlePadding,
                actionsCount: actions.length,
                hasLeading: leading != null || automaticallyImplyLeading,
                title: Text(
                  title,
                  style: theme.titleTextStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ),
    };
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    this.title,
    required this.leading,
    required this.automaticallyImplyLeading,
    required this.actions,
    required this.topPadding,
    required this.collapsedHeight,
    required this.expandedHeight,
    this.flexibleSpace,
  });

  final String? title;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final List<Widget> actions;
  final double topPadding;

  /// Size of the app bar when collapsed.
  final double collapsedHeight;

  /// Size of the app bar when expanded.
  final double expandedHeight;
  final Widget? flexibleSpace;

  @override
  double get minExtent => collapsedHeight;

  @override
  double get maxExtent => math.max((expandedHeight + topPadding), minExtent);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final bool isScrolledUnder = overlapsContent || shrinkOffset > maxExtent - minExtent;

    return FlexibleSpaceBar.createSettings(
      minExtent: minExtent,
      maxExtent: maxExtent,
      currentExtent: math.max(minExtent, maxExtent - shrinkOffset),
      toolbarOpacity: 1.0,
      isScrolledUnder: isScrolledUnder,
      child: YgAppBar(
        leading: leading,
        automaticallyImplyLeading: automaticallyImplyLeading,
        title: title,
        actions: actions,
        flexibleSpace: (title == null && flexibleSpace != null)
            ? Semantics(
                header: true,
                child: flexibleSpace,
              )
            : flexibleSpace,
        toolbarHeight: context.appBarTheme.toolbarHeight,
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}
