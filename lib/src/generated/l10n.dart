// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class DefaultYggdrasilLocalizations {
  DefaultYggdrasilLocalizations();

  static DefaultYggdrasilLocalizations? _current;

  static DefaultYggdrasilLocalizations get current {
    assert(_current != null,
        'No instance of DefaultYggdrasilLocalizations was loaded. Try to initialize the DefaultYggdrasilLocalizations delegate before accessing DefaultYggdrasilLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<DefaultYggdrasilLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = DefaultYggdrasilLocalizations();
      DefaultYggdrasilLocalizations._current = instance;

      return instance;
    });
  }

  static DefaultYggdrasilLocalizations of(BuildContext context) {
    final instance = DefaultYggdrasilLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of DefaultYggdrasilLocalizations present in the widget tree. Did you add DefaultYggdrasilLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static DefaultYggdrasilLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<DefaultYggdrasilLocalizations>(
        context, DefaultYggdrasilLocalizations);
  }

  /// `Step {step} of {steps}`
  String wizardHeaderNOfN(Object step, Object steps) {
    return Intl.message(
      'Step $step of $steps',
      name: 'wizardHeaderNOfN',
      desc:
          'The text that shows the current step out of the total steps. For example, \'Step 1 of 3\'.',
      args: [step, steps],
    );
  }

  /// `Done`
  String get dropdownDone {
    return Intl.message(
      'Done',
      name: 'dropdownDone',
      desc:
          'The text to display on the button when the user has finished making a selection.',
      args: [],
    );
  }
}

class AppLocalizationDelegate
    extends LocalizationsDelegate<DefaultYggdrasilLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'da'),
      Locale.fromSubtags(languageCode: 'fi'),
      Locale.fromSubtags(languageCode: 'nb'),
      Locale.fromSubtags(languageCode: 'sv'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<DefaultYggdrasilLocalizations> load(Locale locale) =>
      DefaultYggdrasilLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
