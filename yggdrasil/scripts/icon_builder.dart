// ignore_for_file: prefer-static-class

import 'dart:io';

import 'script_helpers.dart';

void main() {
  const String inputPath = 'assets/icons';
  const String outputPath = 'lib/src/generated/icons';

  final List<FileAndName> svgFilesAndNames = _getSvgFilesAndNamesFromDirectory(inputPath);
  _generateIconFiles(
    svgFilesAndNames: svgFilesAndNames,
    inputPath: inputPath,
    outputPath: outputPath,
  );

  _updateSvgFileColors(
    svgFilesAndNames: svgFilesAndNames,
  );
}

List<FileAndName> _getSvgFilesAndNamesFromDirectory(String directoryPath) {
  final Directory directory = Directory(directoryPath);
  final List<FileAndName> svgFilesAndNames = <FileAndName>[];

  for (final FileSystemEntity entity in directory.listSync(recursive: false, followLinks: false)) {
    if (entity is File && entity.path.endsWith('.svg')) {
      final String? fileName = entity.path.split(Platform.pathSeparator).lastOrNull;
      if (fileName != null) {
        svgFilesAndNames.add(
          FileAndName(
            name: fileName,
            file: entity,
          ),
        );
      }
    }
  }

  svgFilesAndNames.sort((FileAndName a, FileAndName b) => a.name.compareTo(b.name));

  return svgFilesAndNames;
}

void _generateIconFiles({
  required List<FileAndName> svgFilesAndNames,
  required String inputPath,
  required String outputPath,
}) {
  final List<String> iconClassMembers = <String>[];
  final List<String> iconNamesList = <String>[];

  for (final FileAndName fileAndName in svgFilesAndNames) {
    final String iconName = fileAndName.name.split('.').firstOrNull ?? '';
    final String camelCaseIconName = ScriptHelpers.toCamelCase(iconName);
    final bool colored = fileAndName.name.contains('_colorful');
    final String classType = colored ? 'YgIconData' : 'YgColorableIconData';

    iconClassMembers.add(
      'static const $classType $camelCaseIconName = $classType(name: \'$camelCaseIconName\', path: \'$inputPath/${fileAndName.name}\');',
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

// Matches any yggColor attribute as long as it has a value.
final RegExp _yggColorRegex = RegExp(r'yggColor="([^"]+)"');

void _updateSvgFileColors({
  required List<FileAndName> svgFilesAndNames,
}) {
  for (final FileAndName fileAndName in svgFilesAndNames) {
    final String data = fileAndName.file.readAsStringSync();

    // Replace the yggColor attribute with id, temporary solution until icon
    // exporting has been updated.
    final String updatedData = data.replaceAllMapped(
      _yggColorRegex,
      (Match match) => 'id="${match.group(1)!}"',
    );

    fileAndName.file.writeAsStringSync(updatedData);
  }
}

// ignore: prefer-match-file-name
class FileAndName {
  const FileAndName({
    required this.file,
    required this.name,
  });

  final File file;
  final String name;
}
