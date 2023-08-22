import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// Section that adds left and right padding.
class YgSectionTile extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgSectionTile({
    super.key,
    required this.title,
    this.subtitle,
  });

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final String? subtitle = this.subtitle;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 15.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            title,
            style: context.sectionTheme.sectionTileTheme.titleTextStyle,
          ),
          if (subtitle != null)
            Text(
              subtitle,
              style: context.sectionTheme.sectionTileTheme.subtitleTextStyle,
            ),
        ].withVerticalSpacing(context.sectionTheme.sectionTileTheme.titleSubtitleSpacing),
      ),
    );
  }
}

class YgSectionTilePersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  const YgSectionTilePersistentHeaderDelegate({
    required this.title,
    this.subtitle,
  });

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: YgSectionTile(
        title: title,
        subtitle: subtitle,
      ),
    );
  }

  @override
  double get maxExtent => 80.0;

  @override
  double get minExtent => 80.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
