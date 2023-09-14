import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgSliverTopAppBar extends StatefulWidget {
  const YgSliverTopAppBar({
    super.key,
    required this.title,
    required this.variant,
    this.actions,
    this.leading,
    this.pinned = true,
    this.centerTitle = false,
    this.hasDrawer = false,
    this.automaticallyImplyLeading = true,
  });

  // TODO(DEV-1946): Fix the title of the sliver just vanishing when you scroll to a certain point.
  final String title;
  final bool pinned;
  final bool centerTitle;
  final bool hasDrawer;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final List<Widget>? actions;
  final YgSliverTopAppBarVariant variant;

  @override
  State<YgSliverTopAppBar> createState() => _YgSliverTopAppBarState();
}

class _YgSliverTopAppBarState extends State<YgSliverTopAppBar> {
  Widget? leading;

  @override
  Widget build(BuildContext context) {
    final YgTopAppBarTheme theme = context.topAppBarTheme;
    const double bottomBorderWidth = 1.0;
    const Color surfaceTintColor = Colors.transparent;

    final ScaffoldState? scaffold = Scaffold.maybeOf(context);
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final bool canPop = parentRoute?.canPop ?? false;
    final bool hasEndDrawer = scaffold?.hasEndDrawer ?? false;
    final bool useCloseButton = parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;

    if (widget.leading == null && widget.automaticallyImplyLeading) {
      if (widget.hasDrawer) {
        // TODO(DEV-1928): Turn this into an YgIcon whenever we introduce drawers in apps.
        leading = DrawerButton(
          style: IconButton.styleFrom(iconSize: theme.leadingSize),
        );
      } else if ((!hasEndDrawer && canPop) || (parentRoute?.impliesAppBarDismissal ?? false)) {
        leading = YgIconButton(
          onPressed: () => Navigator.maybePop(context),
          child: YgIcon(useCloseButton ? YgIcons.coverRemove : YgIcons.caretLeft),
        );
      }
    }

    if (widget.leading != null) {
      leading = ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: theme.leadingSize),
        child: widget.leading,
      );
    }

    return switch (widget.variant) {
      YgSliverTopAppBarVariant.large => SliverAppBar.large(
          actions: widget.actions,
          pinned: widget.pinned,
          shadowColor: theme.borderColor,
          backgroundColor: theme.backgroundColor,
          surfaceTintColor: surfaceTintColor,
          scrolledUnderElevation: bottomBorderWidth,
          automaticallyImplyLeading: widget.automaticallyImplyLeading,
          leading: leading,
          centerTitle: widget.centerTitle,
          title: Text(
            widget.title,
            style: YgSliverTopAppBarMapper.getTitleTextStyle(
              theme: theme,
              variant: YgSliverTopAppBarVariant.large,
            ),
          ),
        ),
      YgSliverTopAppBarVariant.medium => SliverAppBar.medium(
          actions: widget.actions,
          pinned: widget.pinned,
          shadowColor: theme.borderColor,
          surfaceTintColor: surfaceTintColor,
          backgroundColor: theme.backgroundColor,
          scrolledUnderElevation: bottomBorderWidth,
          automaticallyImplyLeading: widget.automaticallyImplyLeading,
          leading: leading,
          centerTitle: widget.centerTitle,
          title: Text(
            widget.title,
            style: YgSliverTopAppBarMapper.getTitleTextStyle(
              theme: theme,
              variant: YgSliverTopAppBarVariant.medium,
            ),
          ),
        ),
      YgSliverTopAppBarVariant.small => SliverAppBar(
          actions: widget.actions,
          pinned: widget.pinned,
          shadowColor: theme.borderColor,
          surfaceTintColor: surfaceTintColor,
          backgroundColor: theme.backgroundColor,
          scrolledUnderElevation: bottomBorderWidth,
          automaticallyImplyLeading: widget.automaticallyImplyLeading,
          leading: leading,
          centerTitle: widget.centerTitle,
          title: Text(
            widget.title,
            style: YgSliverTopAppBarMapper.getTitleTextStyle(
              theme: theme,
              variant: YgSliverTopAppBarVariant.small,
            ),
          ),
        ),
    };
  }
}
