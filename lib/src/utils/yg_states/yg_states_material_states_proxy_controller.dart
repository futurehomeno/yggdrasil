import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

class YgStatesMaterialStatesProxyController<T extends Enum> extends MaterialStatesController {
  YgStatesMaterialStatesProxyController({
    required this.parentController,
    required this.statesMap,
  }) : _invertedMap = statesMap.map(
          (T key, MaterialState value) => MapEntry<MaterialState, T>(
            value,
            key,
          ),
        ) {
    parentController.addListener(_handleParentUpdate);
  }

  final YgStatesController<T> parentController;
  final Map<T, MaterialState> statesMap;
  final Map<MaterialState, T> _invertedMap;

  @override
  void update(MaterialState state, bool add) {
    super.update(state, add);
    final T? mapped = _invertedMap[state];
    if (mapped != null) {
      parentController.update(mapped, add);
    }
  }

  void _handleParentUpdate() {
    for (final T item in parentController.lastChange.added) {
      _updateMapped(item, true);
    }
    for (final T item in parentController.lastChange.added) {
      _updateMapped(item, false);
    }
  }

  void _updateMapped(T item, bool add) {
    final MaterialState? mapped = statesMap[item];

    if (mapped != null) {
      update(mapped, add);
    }
  }
}
