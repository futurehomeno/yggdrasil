import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_icon/yg_icon.dart';
import 'package:yggdrasil/src/components/yg_list_tile/enums/_enums.dart';
import 'package:yggdrasil/src/components/yg_list_tile/widgets/yg_list_tile_body.dart';
import 'package:yggdrasil/src/extensions/safe_build_extension.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

final class SearchResultListTile extends StatelessWidget with StatelessWidgetDebugMixin {
  const SearchResultListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  final YgFormattedText title;
  final YgFormattedText? subtitle;
  final YgIconData? icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final YgSearchModalTheme theme = context.searchModalTheme;

    return YgListTileBody(
      title: YgMatchText(
        text: title,
        style: theme.resultTitleStyle,
        matchedStyle: theme.resultTitleHighlightedStyle,
      ),
      subtitle: subtitle.safeBuild(
        (YgFormattedText subtitle) => YgMatchText(
          text: subtitle,
          style: theme.resultSubtitleStyle,
          matchedStyle: theme.resultSubtitleHighlightedStyle,
        ),
      ),
      leading: icon.safeBuild(
        (YgIconData icon) => YgIcon(icon),
      ),
      density: YgListTileDensity.standard,
      disabled: false,
      onTap: onTap,
      subtitleIcon: null,
      infoButton: null,
      trailing: null,
      supporting: null,
      builder: null,
    );
  }
}
