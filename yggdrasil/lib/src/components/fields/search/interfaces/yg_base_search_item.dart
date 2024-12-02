import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_result.dart';
import 'package:yggdrasil/src/utils/yg_icon_data/yg_icon_data.dart';
import 'package:yggdrasil/src/utils/yg_match_text/yg_text_match.dart';

abstract class YgBaseSearchItem<Result extends YgBaseSearchResult> {
  const YgBaseSearchItem({
    required this.icon,
    required this.subtitle,
    required this.title,
  });

  final String title;
  final String? subtitle;
  final YgIconData? icon;

  Result createResult({
    List<YgTextMatch>? titleMatches,
    List<YgTextMatch>? subtitleMatches,
  });
}
