import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// Customized version of the [AppBar] widget.
class YgAppBar extends StatelessWidget with StatelessWidgetDebugMixin implements PreferredSizeWidget {
  const YgAppBar({
    super.key,
    required this.title,
    this.actions = const <Widget>[],
    this.leading,
    this.centerTitle = false,
    this.hasDrawer = false,
    this.automaticallyImplyLeading = true,
  }) : assert(
          centerTitle && actions.length <= 1 || !centerTitle && actions.length <= 3,
          'When the title is in the center, app bar can only have 1 action.',
        );

  final String title;
  final bool centerTitle;
  final bool hasDrawer;
  final bool automaticallyImplyLeading;
  final Widget? leading;
  final List<Widget> actions;

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

    return AppBar(
      toolbarHeight: theme.toolbarHeight,
      actions: <Widget>[
        ...actions,
        SizedBox(width: theme.actionEdgeSpacing),
      ],
      surfaceTintColor: surfaceTintColor,
      backgroundColor: theme.backgroundColor,
      automaticallyImplyLeading: automaticallyImplyLeading,
      scrolledUnderElevation: 1.0,
      shadowColor: theme.borderColor,
      leading: leading,
      leadingWidth: theme.leadingWidth,
      centerTitle: _evaluateCenterTitle(leading),
      titleSpacing: theme.titleSpacing,
      title: Text(title, style: theme.titleTextStyle),
    );
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

  // !--- IMPORTANT ---
  // If the size of the app bar changes, the size of the app bar must be updated in the
  // `preferredSize` getter below.
  @override
  Size get preferredSize => const Size.fromHeight(64.0);
}
