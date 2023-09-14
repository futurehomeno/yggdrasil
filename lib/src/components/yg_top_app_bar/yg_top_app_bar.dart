import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgTopAppBar extends StatefulWidget implements PreferredSizeWidget {
  const YgTopAppBar({
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
  State<YgTopAppBar> createState() => _YgTopAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _YgTopAppBarState extends State<YgTopAppBar> {
  Widget? _leading;

  @override
  Widget build(BuildContext context) {
    final YgTopAppBarTheme theme = context.topAppBarTheme;

    final ScaffoldState? scaffold = Scaffold.maybeOf(context);
    final ModalRoute<Object?>? parentRoute = ModalRoute.of(context);
    final bool canPop = parentRoute?.canPop ?? false;
    final bool hasEndDrawer = scaffold?.hasEndDrawer ?? false;
    final bool useCloseButton = parentRoute is PageRoute<Object?> && parentRoute.fullscreenDialog;

    if (widget.leading == null && widget.automaticallyImplyLeading) {
      if (widget.hasDrawer) {
        // TODO(DEV-1928): Turn this into an YgIcon whenever we introduce drawers in apps.
        _leading = DrawerButton(
          style: IconButton.styleFrom(iconSize: theme.leadingSize),
        );
      } else if ((!hasEndDrawer && canPop) || (parentRoute?.impliesAppBarDismissal ?? false)) {
        _leading = YgIconButton(
          onPressed: () => Navigator.maybePop(context),
          child: YgIcon(useCloseButton ? YgIcons.coverRemove : YgIcons.caretLeft),
        );
      }
    }

    if (widget.leading != null) {
      _leading = ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: theme.leadingSize),
        child: widget.leading,
      );
    }

    return AppBar(
      actions: widget.actions,
      surfaceTintColor: Colors.transparent,
      backgroundColor: theme.backgroundColor,
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
      leading: _leading,
      centerTitle: widget.centerTitle,
      title: Text(
        widget.title,
        style: theme.smallTopAppBarTheme.titleTextStyle,
      ),
    );
  }
}
