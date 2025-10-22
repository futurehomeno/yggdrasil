import 'package:yggdrasil/src/components/yg_snack_bar/_yg_snack_bar.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

class YgSnackBarState extends YgState {
  YgSnackBarState({
    required YgSnackBarVariant variant,
  }) : variant = YgStateValue<YgSnackBarVariant>(variant);

  final YgStateValue<YgSnackBarVariant> variant;

  @override
  List<YgStateValue<Object>> get props => <YgStateValue<Object>>[
    variant,
  ];
}
