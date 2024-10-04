import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yggdrasil/src/components/yg_list_tile/widgets/yg_list_tile_body.dart';
import 'package:yggdrasil/src/utils/yg_debug/_yg_debug.dart';

final class SearchResultListTile extends StatelessWidget with StatelessWidgetDebugMixin {
  const SearchResultListTile({super.key});

  final 

  @override
  Widget build(BuildContext context) {
    return YgListTileBody(
      title: ,
      subtitle: subtitle.asText(),
      subtitleIcon: subtitleIcon,
      disabled: onTap == null,
      onTap: onTap,
      density: density,
      infoButton: YgListTileHelpers.buildInfoButton(onInfoTap),
      leading: YgListTileHelpers.buildLeading(theme, leadingWidgets),
      trailing: YgListTileHelpers.buildTrailing(theme, trailingWidgets),
      supporting: YgListTileHelpers.buildSupporting(theme, supportingWidgets),
      builder: null,
    );
  }
}


