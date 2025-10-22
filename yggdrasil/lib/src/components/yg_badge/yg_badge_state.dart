import 'package:yggdrasil/src/components/yg_badge/enums/yg_badge_variant.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgBadgeState extends YgState {
  YgBadgeState({
    YgBadgeWeight weight = YgBadgeWeight.weak,
    YgBadgeVariant variant = YgBadgeVariant.number,
  }) : weight = YgStateValue<YgBadgeWeight>(weight),
       variant = YgStateValue<YgBadgeVariant>(variant);

  final YgStateValue<YgBadgeWeight> weight;
  final YgStateValue<YgBadgeVariant> variant;

  @override
  List<YgStateValue<Object>> get props => <YgStateValue<Object>>[
    weight,
    variant,
  ];
}
