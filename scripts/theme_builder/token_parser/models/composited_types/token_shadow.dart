import 'package:flutter/material.dart';

import '../primary_types/_values.dart';

final class TokenShadow extends TokenValue {
  const TokenShadow({
    super.description,
    required this.shadow,
  });

  factory TokenBorder.fromJson(Map<String, dynamic> json) {
    return const TokenBorder();
  }

  final Shadow shadow;
}
