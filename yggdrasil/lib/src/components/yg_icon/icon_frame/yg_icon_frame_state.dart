import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_icon/enums/_enums.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

class YgIconFrameState extends YgState {
  YgIconFrameState({
    required Color? color,
    required YgIconSize? size,
  }) : color = YgStateValue<Color?>(color),
       size = YgStateValue<YgIconSize?>(size);

  final YgStateValue<Color?> color;
  final YgStateValue<YgIconSize?> size;

  @override
  List<YgStateValue<Object?>> get props => <YgStateValue<Object?>>[
    color,
    size,
  ];
}
