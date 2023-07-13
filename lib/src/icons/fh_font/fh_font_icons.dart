import 'package:flutter/material.dart';

abstract class FhFontIcons {
  FhFontIcons._();

  static const String _pathPrefix = 'fh_font';
  static const Set<String> _supportedChars = <String>{
    'M',
    'T',
    'W',
    'F',
    'S',
    'L',
    'K',
    'P',
    'O',
  };

  static String? forFirstChar(String string) {
    final Characters characters = Characters(string).toUpperCase();
    if (characters.isEmpty) {
      return null;
    }

    final String char = characters.first;
    if (!_supportedChars.contains(char)) {
      return null;
    }

    return '$_pathPrefix/$char';
  }
}
