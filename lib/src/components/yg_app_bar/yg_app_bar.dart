import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// Customized version of the [AppBar] widget.
class YgAppBar extends StatelessWidget implements PreferredSizeWidget {
  const YgAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.centerTitle = false,
    this.hasDrawer = false,
    this.automaticallyImplyLeading = true,
  });

  final String title;
  final bool centerTitle;
  final bool hasDrawer;
  final bool automaticallyImplyLeading;
  final Widget? leading;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final YgAppBarTheme theme = context.appBarTheme;
    final ScaffoldState? scaffold = Scaffold.maybeOf(context);
    final ModalRoute<Object?>? parentRoute = ModalRoute.of(context);
    final bool canPop = parentRoute?.canPop ?? false;
    final bool hasEndDrawer = scaffold?.hasEndDrawer ?? false;
    final bool useCloseButton = parentRoute is PageRoute<Object?> && parentRoute.fullscreenDialog;

    return AppBar(
      toolbarHeight: theme.toolbarHeight,
      actions: actions,
      surfaceTintColor: Colors.transparent,
      backgroundColor: theme.backgroundColor,
      automaticallyImplyLeading: automaticallyImplyLeading,
      scrolledUnderElevation: 1.0,
      shadowColor: theme.borderColor,
      leading: _getLeadingWidget(
        theme: theme,
        hasEndDrawer: hasEndDrawer,
        canPop: canPop,
        parentRoute: parentRoute,
        context: context,
        useCloseButton: useCloseButton,
      ),
      centerTitle: centerTitle,
      titleSpacing: theme.titleSpacing,
      title: Text(
        title,
        style: theme.smallAppBarTheme.titleTextStyle,
      ),
    );
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
        return DrawerButton(
          style: IconButton.styleFrom(iconSize: theme.leadingIconSize),
        );
      } else if ((!hasEndDrawer && canPop) || (parentRoute?.impliesAppBarDismissal ?? false)) {
        return YgIconButton(
          onPressed: () => Navigator.maybePop(context),
          child: YgIcon(useCloseButton ? YgIcons.coverRemove : YgIcons.caretLeft),
        );
      }
    }

    if (leading != null) {
      return ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: theme.leadingIconSize),
        child: leading,
      );
    }

    return null;
  }

  // !--- IMPORTANT ---
  // If the size of the app bar changes, the size of the app bar must be updated in the
  // `preferredSize` getter below.
  @override
  Size get preferredSize => const Size.fromHeight(64.0);
}
