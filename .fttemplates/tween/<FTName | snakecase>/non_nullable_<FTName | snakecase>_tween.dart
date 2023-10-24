import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

typedef Yg[FTName | pascalcase]Property<T extends Enum> = YgProperty<T, [FTName | pascalcase]>;
typedef YgMaterial[FTName | pascalcase]Property = YgMaterialProperty<[FTName | pascalcase]>;
typedef YgAnimated[FTName | pascalcase]Property = YgAnimatedProperty<[FTName | pascalcase]>;
typedef YgDriven[FTName | pascalcase]Property = YgDrivenProperty<[FTName | pascalcase]>;

class NonNullable[FTName | pascalcase]Tween extends Tween<[FTName | pascalcase]> {
  NonNullable[FTName | pascalcase]Tween({
    required super.begin,
    required super.end,
  });

  @override
  [FTName | pascalcase] lerp(double t) => [FTName | pascalcase].lerp(
        begin,
        end,
        t,
      )!;
}
