import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

typedef Yg[FTName | pascalcase]Property<T extends Enum> = YgProperty<T, [FTName | pascalcase]>;
typedef YgMaterial[FTName | pascalcase]Property = YgMaterialProperty<[FTName | pascalcase]>;
typedef YgAnimated[FTName | pascalcase]Property = YgAnimatedProperty<[FTName | pascalcase]>;
typedef YgDriven[FTName | pascalcase]Property = YgDrivenProperty<[FTName | pascalcase]>;

class NonNullable[FTName | pascalcase]Tween<T extends [FTName | pascalcase]> extends Tween<T> {
  NonNullable[FTName | pascalcase]Tween({
    required T super.begin,
    required T super.end,
  });

  @override
  T lerp(double t) => [FTName | pascalcase].lerp(
        begin,
        end,
        t,
      ) as T;
}

