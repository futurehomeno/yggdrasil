import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgCalloutState extends YgState {
  YgCalloutState({
    YgCalloutVariant variant = YgCalloutVariant.success,
  }) : variant = YgStateValue<YgCalloutVariant>(variant);

  final YgStateValue<YgCalloutVariant> variant;

  @override
  List<YgStateValue<Object>> get props => <YgStateValue<Object>>[
        variant,
      ];
}
