import '../_resolved.dart';

class GradientToken extends Token {
  const GradientToken({
    required super.unresolved,
    required this.stops,
    super.description,
  });

  final List<GradientTokenStop> stops;
}

class GradientTokenStop {
  const GradientTokenStop({
    required this.color,
    required this.position,
  });

  final int color;
  final double position;
}
