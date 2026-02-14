import 'package:flutter/animation.dart';
import 'package:yggdrasil/src/components/yg_chart/models/range.dart';

class RangeTween<N extends num> extends Tween<Range<N>> {
  RangeTween({
    super.begin,
    super.end,
  });

  @override
  Range<N> lerp(double t) => Range.lerp(begin, end, t)!;
}
