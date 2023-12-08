import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgBadgeState extends YgState {
  YgBadgeState({
    YgBadgeWeight weight = YgBadgeWeight.weak,
  }) : weight = YgStateValue<YgBadgeWeight>(weight);

  final YgStateValue<YgBadgeWeight> weight;

  @override
  List<YgStateValue<Object>> get props => <YgStateValue<Object>>[
        weight,
      ];
}
