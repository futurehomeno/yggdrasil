import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

typedef Nullable[FTName | pascalcase] = [FTName | pascalcase]?;
typedef YgNullable[FTName | pascalcase]Property<T extends Enum> = YgProperty<T, [FTName | pascalcase]?>;
typedef YgMaterialNullable[FTName | pascalcase]Property = YgMaterialProperty<[FTName | pascalcase]?>;
typedef YgAnimatedNullable[FTName | pascalcase]Property = YgAnimatedProperty<[FTName | pascalcase]?>;
typedef YgDrivenNullable[FTName | pascalcase]Property = YgDrivenProperty<[FTName | pascalcase]?>;

class Nullable[FTName | pascalcase]Tween<T extends [FTName | pascalcase]> extends Tween<T?> {
  Nullable[FTName | pascalcase]Tween({
    super.begin,
    super.end,
  });

  @override
  T? lerp(double t) => [FTName | pascalcase].lerp(
        begin,
        end,
        t,
      ) as T?;
}

