part of 'yg_badge.dart';

final class YgNumberBadge extends YgBadge {
  const YgNumberBadge({
    super.key,
    required this.amount,
    required super.child,
    super.alignment,
    super.weight,
  }) : super._();

  /// The amount of items the badge should show.
  final int amount;

  static const int _maxBadgeCount = 9;

  @override
  Widget _buildBadgeContent(BuildContext context) {
    final YgBadgeTheme theme = context.badgeTheme;

    return Padding(
      padding: theme.textPadding,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: theme.textMinWidth,
        ),
        child: Text(
          amount > _maxBadgeCount ? '$_maxBadgeCount+' : amount.toString(),
          style: YgBadgeMapper.getTextStyle(
            theme: theme,
            weight: weight,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
