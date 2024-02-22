// ignore_for_file: avoid-dynamic, prefer-match-file-name

import 'dart:convert';
import 'dart:io';

import 'package:recase/recase.dart';

import 'supported_languages.dart';

// Can't use fh_utils because we depend on flutter which we can't use in scripts.
extension JsonExtensions on Map<String, dynamic> {
  T? safeValue<T>(String key) {
    final dynamic value = this[key];

    if (value is T) {
      return value;
    }

    return null;
  }
}

extension NullableStringExtensions on String? {
  bool get isNullOrEmpty {
    return this == null || this!.isEmpty;
  }
}

void main() {
  stdout.writeln('''
# =================================== #
#          Building arb file          #
# =================================== #
  ''');

  final Directory l10nDirectory = Directory('l10n/src');
  final List<FileSystemEntity> fileSystemEntities = l10nDirectory.listSync(recursive: true);
  final List<File> files = <File>[];
  final Map<String, Map<String, dynamic>> allTranslations = <String, Map<String, dynamic>>{};

  for (final String language in SupportedLanguages.supportedLanguages) {
    allTranslations[language] = <String, dynamic>{'@@locale': language};
  }

  // Get all the files in l10n folder.
  for (FileSystemEntity fileSystemEntity in fileSystemEntities) {
    // We're not interested in directories.
    if (FileSystemEntity.isDirectorySync(fileSystemEntity.path)) {
      continue;
    }

    files.add(File(fileSystemEntity.path));
  }

  void handleRootObject(
    Map<String, dynamic> rootObject,
    void Function(String error) writeError,
  ) {
    final String? context = rootObject.safeValue('context');
    final String? prefix = rootObject.safeValue('prefix');
    final String? suffix = rootObject.safeValue('suffix');
    final Map<String, dynamic>? translations = rootObject.safeValue('translations');

    if (context.isNullOrEmpty) {
      return writeError('"context" has to be a string and can not be empty');
    }

    if (prefix.isNullOrEmpty && suffix.isNullOrEmpty) {
      return writeError('Either "prefix" or "suffix" has to be a non empty string');
    }

    if (translations == null) {
      return writeError('"translations" has to be a object');
    }

    for (final String name in translations.keys) {
      final Map<String, dynamic>? value = translations.safeValue(name);

      if (value == null) {
        return writeError('"translations.$name" has to be a object');
      }

      final String? description = value.safeValue('description');

      if (description.isNullOrEmpty) {
        return writeError('"translations.$name.description" has to be a string and can not be empty');
      }

      for (final String language in SupportedLanguages.supportedLanguages) {
        final String? translation = value.safeValue(language);

        if (translation == null) {
          return writeError('"translations.$name.$language" has to be a string and can not be empty');
        }

        final String l10nKey = '${prefix ?? ''}_${name}_${suffix ?? ''}'.camelCase;

        // Create the translation object.
        final Map<String, dynamic> translationObject = _getARBTranslationObject(
          l10nKey: l10nKey,
          translation: translation,
          context: context!,
          description: description!,
        );

        allTranslations[language]!.addAll(translationObject);
      }
    }
  }

  for (final File file in files) {
    final dynamic json = jsonDecode(file.readAsStringSync());

    void writeError(String error) {
      stderr.writeln(error);
      stderr.writeln('In $file');
      exit(1);
    }

    // We allow the json to be object or a array of objects.
    if (json is List) {
      for (int i = 0; i < json.length; i++) {
        final dynamic rootObject = json[i];

        if (rootObject is! Map<String, dynamic>) {
          return writeError('"json[$i]" is not a object');
        }

        handleRootObject(rootObject, writeError);
      }
    } else if (json is Map<String, dynamic>) {
      handleRootObject(json, writeError);
    } else {
      return writeError('"json" is not a object or array of objects');
    }
  }

  for (final String language in SupportedLanguages.supportedLanguages) {
    final File outputFile = File('l10n/generated/intl_$language.arb');

    outputFile.writeAsStringSync(jsonEncode(allTranslations[language]));
  }

  stdout.writeln('''
# =================================== #
#                DONE!                #
# =================================== #
  ''');
}

// ignore: prefer-static-class
Map<String, dynamic> _getARBTranslationObject({
  required String l10nKey,
  required String translation,
  required String context,
  required String description,
}) {
  return <String, dynamic>{
    l10nKey: translation,
    '@$l10nKey': <String, String>{
      'context': context,
      'description': description,
    },
  };
}
