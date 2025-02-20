import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_app_bar/app_bar/yg_app_bar_child_widget.dart';
import 'package:yggdrasil/src/components/yg_app_bar/app_bar/yg_app_bar_render_widget.dart';
import 'package:yggdrasil/src/components/yg_app_bar/app_bar/yg_app_bar_slot.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// An AppBar with a title, leading widget and actions
class YgAppBar extends StatelessWidget with StatelessWidgetDebugMixin implements PreferredSizeWidget {
  const YgAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.centerTitle = false,
    this.automaticallyImplyLeading = true,
  });

  /// The primary text displayed in the app bar.
  ///
  /// Becomes the middle component of the [NavigationToolbar] built by this widget.
  final String? title;

  /// A widget to display before the toolbar's [title].
  ///
  /// Typically the [leading] widget is an [Icon] or an [IconButton].
  ///
  /// If set and [automaticallyImplyLeading] is true, then a [BackButton] will
  /// be shown instead of the [leading] widget when possible.
  final Widget? leading;

  /// Controls whether we should try to imply the leading widget if null.
  ///
  /// If true and even if [leading] is set, automatically try to deduce what the leading
  /// widget should be. If no leading widget can be automatically deduced, the
  /// [leading] will be shown.
  ///
  /// If false and [leading] is null, title will be centered.
  final bool automaticallyImplyLeading;

  /// A list of Widgets to display in a row after the [title] widget.
  ///
  /// These widgets are [YgIconButton]s representing common operations.
  final List<YgIconButton>? actions;

  /// Whether the title should be centered.
  final bool centerTitle;

  @override
  Widget build(BuildContext context) {
    final YgAppBarTheme theme = context.appBarTheme;
    final Widget? title = _getTitle(context);
    final Widget? leading = _getLeading(context);
    final Widget? actions = _getActions();

    return Material(
      color: theme.backgroundColor,
      child: SafeArea(
        bottom: false,
        left: false,
        right: false,
        child: YgAppBarRenderWidget(
          centerTitle: centerTitle || leading == null,
          gap: theme.appBarHorizontalPadding,
          height: theme.toolbarHeight,
          padding: EdgeInsets.symmetric(
            horizontal: theme.appBarHorizontalPadding,
          ),
          children: <Widget>[
            if (leading != null)
              YgAppBarChildWidget(
                slot: YgAppBarSlot.leading,
                child: leading,
              ),
            if (title != null)
              YgAppBarChildWidget(
                slot: YgAppBarSlot.title,
                child: title,
              ),
            if (actions != null)
              YgAppBarChildWidget(
                slot: YgAppBarSlot.trailing,
                child: actions,
              ),
          ],
        ),
      ),
    );
  }

  Widget? _getLeading(BuildContext context) {
    if (automaticallyImplyLeading) {
      // ignore: avoid-dynamic
      final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
      if (parentRoute?.canPop == true || parentRoute?.impliesAppBarDismissal == true) {
        return YgIconButton(
          onPressed: () => Navigator.maybePop(context),
          icon: YgIcons.caretLeft,
        );
      }
    }

    return leading;
  }

  Widget? _getTitle(BuildContext context) {
    final String? title = this.title;

    if (title != null) {
      return Semantics(
        namesRoute: true,
        header: true,
        child: Text(
          title,
          style: context.appBarTheme.titleTextStyle,
          overflow: TextOverflow.ellipsis,
        ),
      );
    }

    return null;
  }

  Widget? _getActions() {
    final List<YgIconButton>? actions = this.actions;

    if (actions != null && actions.isNotEmpty) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: actions,
      );
    }

    return null;
  }

  // Only here for legacy usecases, is not actually used in layout.
  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  YgDebugType get debugType => YgDebugType.other;
}
