import 'package:flutter/material.dart';

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
