// ignore_for_file: prefer-static-class

import 'dart:io';

import 'script_helpers.dart';

void main() {
  const String inputPath = 'assets/icons';
  const String outputPath = 'lib/src/generated/icons';

  final List<String> svgFileNames = _getSvgFileNamesFromDirectory(inputPath);
  _generateIconFiles(
    svgFileNames: svgFileNames,
    inputPath: inputPath,
    outputPath: outputPath,
  );
}

List<String> _getSvgFileNamesFromDirectory(String directoryPath) {
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

void _generateIconFiles({
  required List<String> svgFileNames,
  required String inputPath,
  required String outputPath,
}) {
  final List<String> iconClassMembers = <String>[];
  final List<String> iconNamesList = <String>[];

  for (final String fileName in svgFileNames) {
    final String iconName = fileName.split('.').firstOrNull ?? '';
    final String camelCaseIconName = ScriptHelpers.toCamelCase(iconName);
    final bool colored = fileName.contains('_colorful');
    final String classType = colored ? 'YgIconData' : 'YgColorableIconData';

    iconClassMembers.add(
      'static const $classType $camelCaseIconName = $classType(name: \'$camelCaseIconName\', path: \'$inputPath/$fileName\');',
    );
    iconNamesList.add(camelCaseIconName);
  }

  _generateIconsListFile(
    iconClassMembers: iconClassMembers,
    iconNamesList: iconNamesList,
    outputPath: outputPath,
  );

  _generateExportBarrelFile(
    outputPath: outputPath,
  );
}

void _generateExportBarrelFile({
  required String outputPath,
}) {
  const String barrelContent = 'export \'yg_icons.dart\';';
  final File barrelFile = File('$outputPath/_icons.dart');
  barrelFile
    ..createSync(recursive: true)
    ..writeAsStringSync(barrelContent);
}

void _generateIconsListFile({
  required List<String> iconClassMembers,
  required List<String> iconNamesList,
  required String outputPath,
}) {
  final String iconsListContent = '''
import 'package:yggdrasil/src/utils/yg_icon_data/_yg_icon_data.dart';

class YgIcons {
  const YgIcons._();

  ${iconClassMembers.join('\n  ')}
  
  static const List<YgIconData> allIcons = <YgIconData>[
    ${iconNamesList.join(',\n    ')},
  ];
}
  ''';

  final File iconsListFile = File('$outputPath/yg_icons.dart');
  iconsListFile
    ..createSync(recursive: true)
    ..writeAsStringSync(iconsListContent);
}
