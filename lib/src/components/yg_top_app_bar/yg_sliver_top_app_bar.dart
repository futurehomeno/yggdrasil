import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgSliverTopAppBar extends StatelessWidget {
  const YgSliverTopAppBar({
    super.key,
    required this.title,
    required this.variant,
    this.actions,
    this.leading,
    this.pinned = true,
    this.centerTitle = false,
    this.automaticallyImplyLeading = true,
  });

  final bool pinned;
  final String title;
  final bool centerTitle;
  final Widget? leading;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;
  final YgSliverTopAppBarVariant variant;

  @override
  Widget build(BuildContext context) {
    final YgTopAppBarTheme theme = context.topAppBarTheme;
    const double bottomBorderWidth = 1.0;
    const Color surfaceTintColor = Colors.transparent;

    switch (variant) {
      case YgSliverTopAppBarVariant.large:
        return SliverAppBar.large(
          actions: actions,
          pinned: pinned,
          shadowColor: theme.borderColor,
          backgroundColor: theme.backgroundColor,
          surfaceTintColor: surfaceTintColor,
          scrolledUnderElevation: bottomBorderWidth,
          automaticallyImplyLeading: automaticallyImplyLeading,
          leading: leading,
          centerTitle: centerTitle,
          title: Text(
            title,
            style: theme.largeTopAppBarTheme.titleTextStyle,
          ),
        );

      case YgSliverTopAppBarVariant.medium:
        return SliverAppBar.medium(
          actions: actions,
          pinned: pinned,
          shadowColor: theme.borderColor,
          surfaceTintColor: surfaceTintColor,
          backgroundColor: theme.backgroundColor,
          scrolledUnderElevation: bottomBorderWidth,
          automaticallyImplyLeading: automaticallyImplyLeading,
          leading: leading,
          centerTitle: centerTitle,
          title: Text(
            title,
            style: theme.mediumTopAppBarTheme.titleTextStyle,
          ),
        );

      case YgSliverTopAppBarVariant.small:
        return SliverAppBar(
          actions: actions,
          pinned: pinned,
          shadowColor: theme.borderColor,
          surfaceTintColor: surfaceTintColor,
          backgroundColor: theme.backgroundColor,
          scrolledUnderElevation: bottomBorderWidth,
          automaticallyImplyLeading: automaticallyImplyLeading,
          leading: leading,
          centerTitle: centerTitle,
          title: Text(
            title,
            style: theme.smallTopAppBarTheme.titleTextStyle,
          ),
        );

      default:
        return const SliverToBoxAdapter();
    }
  }
}
