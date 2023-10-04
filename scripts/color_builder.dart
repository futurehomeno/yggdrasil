import 'dart:io';

void main() async {
  final File file = File('lib/src/tokens/consumer_light/colors.dart');
  final String content = await file.readAsString();
  final Iterable<RegExpMatch> matches = RegExp(r'static const Color (.*?) =', multiLine: true).allMatches(content);

  final File outputFile = File('lib/src/utils/yg_color_helper.dart');
  final IOSink sink = outputFile.openWrite();

  sink.writeln('import \'package:flutter/material.dart\';');
  sink.writeln('import \'package:yggdrasil/yggdrasil.dart\';');
  sink.writeln('');
  sink.writeln('class YgColorHelper {');
  sink.writeln('  static Color getColorFromString({');
  sink.writeln('    required BuildContext context,');
  sink.writeln('    required String colorName,');
  sink.writeln('  }) {');
  sink.writeln('    final Color? color = _getColor(');
  sink.writeln('      context: context,');
  sink.writeln('      colorName: colorName,');
  sink.writeln('    );');
  sink.writeln('    if (color == null) {');
  sink.writeln('      throw Exception(\'Color \$colorName not found\');');
  sink.writeln('    }');
  sink.writeln('');
  sink.writeln('    return color;');
  sink.writeln('  }');
  sink.writeln('');
  sink.writeln('  static Color? _getColor({');
  sink.writeln('    required String colorName,');
  sink.writeln('    required BuildContext context,');
  sink.writeln('  }) {');

  for (final RegExpMatch match in matches) {
    final String? colorName = match.group(1);
    if (colorName == null) {
      continue;
    }
    sink.writeln('    if (colorName == \'$colorName\') {');
    sink.writeln('      return context.ygTheme.tokens.colors.$colorName;');
    sink.writeln('    }');
  }
  sink.writeln('');
  sink.writeln('    return null;');
  sink.writeln('  }');
  sink.writeln('}');

  await sink.close();
}
