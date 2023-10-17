import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class Yg[FTName | pascalcase]Property<T extends Enum> extends YgProperty<T, [FTName | pascalcase]?> {
  const Yg[FTName | pascalcase]Property();

  const factory Yg[FTName | pascalcase]Property.resolveWith(
    YgStatesResolver<T, [FTName | pascalcase]?> resolver,
  ) = _Yg[FTName | pascalcase]PropertyResolveWith<T>;

  const factory Yg[FTName | pascalcase]Property.all(
    YgStatesAllResolver<[FTName | pascalcase]?> resolver,
  ) = _Yg[FTName | pascalcase]PropertyAll<T>;

  @override
  [FTName | pascalcase]Tween createTween([FTName | pascalcase]? initialValue) {
    return [FTName | pascalcase]Tween(
      begin: initialValue,
      end: initialValue,
    );
  }
}

class _Yg[FTName | pascalcase]PropertyResolveWith<T extends Enum> extends Yg[FTName | pascalcase]Property<T> with YgPropertyResolveWithMixin<T, [FTName | pascalcase]?> {
  const _Yg[FTName | pascalcase]PropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, [FTName | pascalcase]?> resolver;
}

class _Yg[FTName | pascalcase]PropertyAll<T extends Enum> extends Yg[FTName | pascalcase]Property<T> with YgPropertyResolveAllMixin<T, [FTName | pascalcase]?> {
  const _Yg[FTName | pascalcase]PropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<[FTName | pascalcase]?> resolver;
}
