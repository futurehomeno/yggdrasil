// ignore_for_file: prefer-static-class

import 'dart:io';

import 'script_helpers.dart';

void main() {
  const String inputPath = 'assets/icons';
  const String outputPath = 'lib/src/generated/icons';

  final List<String> svgFileNames = getSvgFileNamesFromDirectory(inputPath);
  generateIconFiles(
    svgFileNames: svgFileNames,
    inputPath: inputPath,
    outputPath: outputPath,
  );
}

List<String> getSvgFileNamesFromDirectory(String directoryPath) {
  final Directory directory = Directory(directoryPath);
  final List<String> svgFileNames = <String>[];

  for (final FileSystemEntity entity in directory.listSync(recursive: false, followLinks: false)) {
    if (entity is File && entity.path.endsWith('.svg')) {
      final String? fileName = entity.path.split(Platform.pathSeparator).lastOrNull;
      if (fileName != null) svgFileNames.add(fileName);
    }
  }

  svgFileNames.sort((String a, String b) => a.compareTo(b));

  return svgFileNames;
}

void generateIconFiles({
  required List<String> svgFileNames,
  required String inputPath,
  required String outputPath,
}) {
  final List<String> exports = <String>[];
  final List<String> iconClassMembers = <String>[];

  for (final String fileName in svgFileNames) {
    final String iconName = fileName.split('.').firstOrNull ?? '';
    final String titleCaseIconName = ScriptHelpers.toTitleCase(iconName);
    final bool colored = fileName.contains('_colorful');
    final String classType = colored ? 'YgColoredIcon' : 'YgIcon';
    final String import = colored
        ? 'import \'package:yggdrasil/src/utils/yg_icon/yg_colorful_icon.dart\';'
        : 'import \'package:yggdrasil/src/utils/yg_icon/yg_icon.dart\';';
    final String fileContent = '''
$import
    
class $titleCaseIconName extends $classType {
  $titleCaseIconName()
      : super(
          name: '$titleCaseIconName',
          path: '$inputPath/$fileName',
        );
}
''';

    final File outputFile = File('$outputPath/icon_classes/$iconName.dart');
    final String camelCaseIconName = ScriptHelpers.toCamelCase(iconName);
    outputFile
      ..createSync(recursive: true)
      ..writeAsStringSync(fileContent);

    exports.add("export '$iconName.dart';");
    iconClassMembers.add('static final $classType $camelCaseIconName = $titleCaseIconName();');
  }

  // Generate for exporting main icons list class.
  _generateExportBarrelFile(outputPath);

  // Generate barrel file for all the icon classes.
  _generateIconClassesBarrelFile(exports, outputPath);

  // Generate file containing a static reference to all icons.
  _generateIconsListFile(iconClassMembers, outputPath);
}

void _generateExportBarrelFile(String outputPath) {
  const String barrelContent = 'export \'yg_icons.dart\';';
  final File barrelFile = File('$outputPath/_icons.dart');
  barrelFile
    ..createSync(recursive: true)
    ..writeAsStringSync(barrelContent);
}

void _generateIconClassesBarrelFile(List<String> exports, String outputPath) {
  final String barrelContent = exports.join('\n');
  final File barrelFile = File('$outputPath/icon_classes/_icon_classes.dart');
  barrelFile
    ..createSync(recursive: true)
    ..writeAsStringSync(barrelContent);
}

void _generateIconsListFile(List<String> iconClassMembers, String outputPath) {
  final String iconsListContent = '''
import 'package:yggdrasil/src/utils/yg_icon/yg_colorful_icon.dart';
import 'package:yggdrasil/src/utils/yg_icon/yg_icon.dart';

import 'icon_classes/_icon_classes.dart';

class YgIcons {
  ${iconClassMembers.join('\n  ')}
  }
  ''';

  final File iconsListFile = File('$outputPath/yg_icons.dart');
  iconsListFile
    ..createSync(recursive: true)
    ..writeAsStringSync(iconsListContent);
}
