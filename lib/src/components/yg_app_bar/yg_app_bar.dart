import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgAppBar extends StatefulWidget implements PreferredSizeWidget {
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
  State<YgAppBar> createState() => _YgAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _YgAppBarState extends State<YgAppBar> {
  Widget? _leading;

  @override
  Widget build(BuildContext context) {
    final YgAppBarTheme theme = context.appBarTheme;

    final ScaffoldState? scaffold = Scaffold.maybeOf(context);
    final ModalRoute<Object?>? parentRoute = ModalRoute.of(context);
    final bool canPop = parentRoute?.canPop ?? false;
    final bool hasEndDrawer = scaffold?.hasEndDrawer ?? false;
    final bool useCloseButton = parentRoute is PageRoute<Object?> && parentRoute.fullscreenDialog;

    _leading = _getLeadingWidget(
      theme: theme,
      hasEndDrawer: hasEndDrawer,
      canPop: canPop,
      parentRoute: parentRoute,
      context: context,
      useCloseButton: useCloseButton,
    );

    return AppBar(
      actions: widget.actions,
      surfaceTintColor: Colors.transparent,
      backgroundColor: theme.backgroundColor,
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
      leading: _leading,
      centerTitle: widget.centerTitle,
      title: Text(
        widget.title,
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
    if (widget.automaticallyImplyLeading) {
      if (widget.hasDrawer) {
        // TODO(DEV-1928): Turn this into an YgIcon whenever we introduce drawers in apps.
        return DrawerButton(
          style: IconButton.styleFrom(iconSize: theme.leadingSize),
        );
      } else if ((!hasEndDrawer && canPop) || (parentRoute?.impliesAppBarDismissal ?? false)) {
        return YgIconButton(
          onPressed: () => Navigator.maybePop(context),
          child: YgIcon(useCloseButton ? YgIcons.coverRemove : YgIcons.caretLeft),
        );
      }
    }

    if (widget.leading != null) {
      return ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: theme.leadingSize),
        child: widget.leading,
      );
    }

    return null;
  }
}
