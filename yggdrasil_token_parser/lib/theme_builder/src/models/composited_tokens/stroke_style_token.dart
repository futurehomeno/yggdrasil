import 'package:flutter/material.dart';

import '../primary_tokens/_values.dart';

final class TokenStrokeStyle extends TokenValue {
  const TokenStrokeStyle({
    super.description,
    required this.style,
  });

  factory TokenBorder.fromJson(Map<String, dynamic> json) {
    return const TokenBorder();
  }

  final BorderStyle style;
}
