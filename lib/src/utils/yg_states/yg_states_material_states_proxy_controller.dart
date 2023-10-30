import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

class YgStatesMaterialStatesProxyController<T extends Enum> extends MaterialStatesController {
  YgStatesMaterialStatesProxyController({
    required this.parentController,
    required this.statesMap,
  });

  final YgStatesController<T> parentController;
  final Map<MaterialState, T> statesMap;

  @override
  void update(MaterialState state, bool add) {
    super.update(state, add);

    final T? parentState = statesMap[state];

    if (parentState == null) {
      return;
    }

    parentController.update(parentState, add);
  }
}
