import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'widgets/_widgets.dart';

/// Customized version of the [SliverAppBar] widget.
class YgSliverAppBar extends StatelessWidget {
  const YgSliverAppBar({
    super.key,
    required this.title,
    required this.variant,
    this.actions = const <Widget>[],
    this.leading,
    this.pinned = true,
    this.centerTitle = false,
    this.hasDrawer = false,
    this.automaticallyImplyLeading = true,
  }) : assert(
          centerTitle && actions.length <= 1 || !centerTitle && actions.length <= 3,
          'When the title is in the center, app bar can only have 1 action.',
        );

  final String title;
  final bool pinned;
  final bool centerTitle;
  final bool hasDrawer;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final List<Widget> actions;
  final YgSliverAppBarVariant variant;

  @override
  Widget build(BuildContext context) {
    final YgAppBarTheme theme = context.appBarTheme;
    const Color surfaceTintColor = Colors.transparent;
    final ScaffoldState? scaffold = Scaffold.maybeOf(context);
    final ModalRoute<Object?>? parentRoute = ModalRoute.of(context);
    final bool canPop = parentRoute?.canPop ?? false;
    final bool hasEndDrawer = scaffold?.hasEndDrawer ?? false;
    final bool useCloseButton = parentRoute is PageRoute<Object?> && parentRoute.fullscreenDialog;

    final Widget? leading = _getLeadingWidget(
      theme: theme,
      hasEndDrawer: hasEndDrawer,
      canPop: canPop,
      parentRoute: parentRoute,
      context: context,
      useCloseButton: useCloseButton,
    );

    return switch (variant) {
      YgSliverAppBarVariant.small => SliverAppBar(
          toolbarHeight: theme.toolbarHeight,
          actions: <Widget>[
            ...actions,
            SizedBox(width: theme.actionEdgeSpacing),
          ],
          pinned: pinned,
          shadowColor: theme.borderColor,
          surfaceTintColor: surfaceTintColor,
          backgroundColor: theme.backgroundColor,
          scrolledUnderElevation: 1.0,
          automaticallyImplyLeading: automaticallyImplyLeading,
          centerTitle: _evaluateCenterTitle(leading),
          titleSpacing: theme.titleSpacing,
          leading: leading,
          leadingWidth: theme.leadingWidth,
          title: Text(
            title,
            style: theme.titleTextStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      YgSliverAppBarVariant.medium => SliverAppBar(
          toolbarHeight: theme.toolbarHeight,
          collapsedHeight: theme.collapsedHeight,
          expandedHeight: theme.mediumAppBarTheme.expandedHeight,
          actions: <Widget>[
            ...actions,
            SizedBox(width: theme.actionEdgeSpacing),
          ],
          pinned: pinned,
          shadowColor: theme.borderColor,
          surfaceTintColor: surfaceTintColor,
          backgroundColor: theme.backgroundColor,
          scrolledUnderElevation: 1.0,
          automaticallyImplyLeading: automaticallyImplyLeading,
          leading: leading,
          leadingWidth: theme.leadingWidth,
          flexibleSpace: YgFlexibleSpaceBar(
            expandedTitleScale: theme.mediumAppBarTheme.expandedTitleScale,
            centerTitle: centerTitle,
            topTitlePadding: theme.mediumAppBarTheme.topTitlePadding,
            bottomTitlePadding: theme.mediumAppBarTheme.bottomTitlePadding,
            title: Text(
              title,
              style: theme.titleTextStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      YgSliverAppBarVariant.large => SliverAppBar(
          toolbarHeight: theme.toolbarHeight,
          collapsedHeight: theme.collapsedHeight,
          expandedHeight: theme.largeAppBarTheme.expandedHeight,
          actions: <Widget>[
            ...actions,
            SizedBox(width: theme.actionEdgeSpacing),
          ],
          pinned: pinned,
          shadowColor: theme.borderColor,
          backgroundColor: theme.backgroundColor,
          surfaceTintColor: surfaceTintColor,
          scrolledUnderElevation: 1.0,
          automaticallyImplyLeading: automaticallyImplyLeading,
          leading: leading,
          leadingWidth: theme.leadingWidth,
          flexibleSpace: YgFlexibleSpaceBar(
            expandedTitleScale: theme.largeAppBarTheme.expandedTitleScale,
            centerTitle: centerTitle,
            topTitlePadding: theme.largeAppBarTheme.topTitlePadding,
            bottomTitlePadding: theme.largeAppBarTheme.bottomTitlePadding,
            actionsCount: actions.length,
            title: Text(
              title,
              style: theme.titleTextStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
    };
  }

  /// Enforces center title if we have no leading.
  bool _evaluateCenterTitle(Widget? leading) {
    return leading == null ? true : centerTitle;
  }

  Widget? _getLeadingWidget({
    required YgAppBarTheme theme,
    required bool hasEndDrawer,
    required bool canPop,
    required ModalRoute<Object?>? parentRoute,
    required BuildContext context,
    required bool useCloseButton,
  }) {
    if (automaticallyImplyLeading) {
      if (hasDrawer) {
        // TODO(DEV-1928): Turn this into an YgIcon whenever we introduce drawers in apps.
        return Center(
          child: DrawerButton(
            style: IconButton.styleFrom(iconSize: theme.leadingIconSize),
          ),
        );
      } else if ((!hasEndDrawer && canPop) || (parentRoute?.impliesAppBarDismissal ?? false)) {
        return Center(
          child: YgIconButton(
            onPressed: () => Navigator.maybePop(context),
            child: YgIcon(useCloseButton ? YgIcons.coverRemove : YgIcons.caretLeft),
          ),
        );
      }
    }

    if (leading != null) {
      return Center(
        child: leading,
      );
    }

    return null;
  }
}
