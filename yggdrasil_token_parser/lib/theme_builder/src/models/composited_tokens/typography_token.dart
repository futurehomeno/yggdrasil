import 'dart:ui';

import '../primary_tokens/_values.dart';

final class TokenTypography extends TokenValue {
  const TokenTypography({
    super.description,
    required this.style,
  });

  factory TokenTypography.fromJson(Map<String, dynamic> json) {
    return const TokenTypography();
  }

  final TextStyle style;
}
