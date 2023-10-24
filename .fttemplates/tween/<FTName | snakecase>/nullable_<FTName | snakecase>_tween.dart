import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

typedef Nullable[FTName | pascalcase] = [FTName | pascalcase]?;
typedef YgNullable[FTName | pascalcase]Property<T extends Enum> = YgProperty<T, [FTName | pascalcase]?>;
typedef YgMaterialNullable[FTName | pascalcase]Property = YgMaterialProperty<[FTName | pascalcase]?>;
typedef YgAnimatedNullable[FTName | pascalcase]Property = YgAnimatedProperty<[FTName | pascalcase]?>;
typedef YgDrivenNullable[FTName | pascalcase]Property = YgDrivenProperty<[FTName | pascalcase]?>;

class Nullable[FTName | pascalcase]Tween extends Tween<[FTName | pascalcase]?> {
  Nullable[FTName | pascalcase]Tween({
    super.begin,
    super.end,
  });

  @override
  [FTName | pascalcase]? lerp(double t) => [FTName | pascalcase].lerp(
        begin,
        end,
        t,
      );
}
