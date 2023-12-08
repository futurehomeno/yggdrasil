part of 'yg_badge.dart';

final class YgIconBadge extends YgBadge {
  const YgIconBadge({
    super.key,
    required this.icon,
    required super.child,
    super.alignment,
    super.weight,
  }) : super._();

  /// The amount of items the badge should show.
  final YgIcon icon;

  @override
  Widget _buildBadgeContent(BuildContext context) {
    final YgBadgeTheme theme = context.badgeTheme;

    return Padding(
      padding: theme.iconPadding,
      child: IconTheme(
        data: IconTheme.of(context).copyWith(
          size: theme.iconSize,
          color: theme.strongIconColor,
        ),
        child: icon,
      ),
    );
  }

  @override
  Widget _buildChild(BuildContext context) {
    return Padding(
      padding: context.badgeTheme.iconVariantChildPadding,
      child: child,
    );
  }
}
