import 'package:flutter/material.dart';

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
