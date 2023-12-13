import 'package:yggdrasil/src/components/buttons/widgets/yg_button_base_state.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgTagState extends YgButtonBaseState {
  YgTagState({
    super.disabled,
    super.focused,
    super.hovered,
    super.pressed,
    YgTagWeight weight = YgTagWeight.weak,
    YgTagVariant variant = YgTagVariant.neutral,
    YgTagSize size = YgTagSize.medium,
  })  : weight = YgStateValue<YgTagWeight>(weight),
        variant = YgStateValue<YgTagVariant>(variant),
        size = YgStateValue<YgTagSize>(size);

  final YgStateValue<YgTagWeight> weight;
  final YgStateValue<YgTagVariant> variant;
  final YgStateValue<YgTagSize> size;

  @override
  List<YgStateValue<Object>> get props => <YgStateValue<Object>>[
        ...super.props,
        weight,
        variant,
        size,
      ];
}
