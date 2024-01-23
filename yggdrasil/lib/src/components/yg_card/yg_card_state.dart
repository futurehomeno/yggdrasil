import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgCardState extends YgState {
  YgCardState({
    YgCardVariant variant = YgCardVariant.filled,
  }) : variant = YgStateValue<YgCardVariant>(variant);

  final YgStateValue<YgCardVariant> variant;

  @override
  List<YgStateValue<Object>> get props => <YgStateValue<Object>>[
        variant,
      ];
}
