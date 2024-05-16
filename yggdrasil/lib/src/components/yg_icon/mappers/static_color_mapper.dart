import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StaticColorMapper extends ColorMapper {
  const StaticColorMapper({
    required this.color,
  });

  final Color color;

  @override
  Color substitute(String? id, String elementName, String attributeName, Color color) {
    return this.color;
  }
}
