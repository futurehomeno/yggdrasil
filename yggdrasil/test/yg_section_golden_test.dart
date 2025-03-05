// ignore_for_file: prefer-match-file-name

import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'extensions/_extensions.dart';
import 'utils/_utils.dart';

void main() {
  group(
    'YgSectionGoldenTest',
    () {
      // Using basic widgets to avoid having the tests break when things change.
      const List<Widget> childrenToTest = <Widget>[
        SizedBox.square(
          dimension: 100.0,
          child: YgIcon(YgIcons.info),
        ),
        Flexible(
          child: Text(
            YgGoldenTestValues.longText,
          ),
        ),
        SizedBox.square(
          dimension: 100.0,
          child: YgIcon(YgIcons.info),
        ),
      ];

      final List<GoldenTestScenario> sectionScenarios = <GoldenTestScenario>[];
      final List<GoldenTestScenario> expandingSectionScenarios = <GoldenTestScenario>[];
      final List<GoldenTestScenario> expandedSectionScenarios = <GoldenTestScenario>[];

      // Generate all the possible scenarios because there are way too many.
      for (final SectionOptions options in SectionOptions.all) {
        // region Regular

        sectionScenarios.add(
          GoldenTestScenario(
            name: 'YgSection ${options.name}',
            child: YgSection(
              icon: options.icon,
              subtitle: options.subtitle,
              trailing: options.trailing,
              title: options.title,
              child: const Row(
                children: childrenToTest,
              ),
            ),
          ),
        );
        sectionScenarios.add(
          GoldenTestScenario(
            name: 'YgSection.list ${options.name}',
            child: YgSection.list(
              icon: options.icon,
              subtitle: options.subtitle,
              trailing: options.trailing,
              title: options.title,
              children: const <Widget>[YgListTile(title: 'YgListTile')],
            ),
          ),
        );
        sectionScenarios.add(
          GoldenTestScenario(
            name: 'YgSection.column ${options.name}',
            child: YgSection.column(
              icon: options.icon,
              subtitle: options.subtitle,
              trailing: options.trailing,
              title: options.title,
              children: childrenToTest,
            ),
          ),
        );

        // endregion

        final String? title = options.title;
        if (title != null) {
          // region Expanding, not expanded.

          expandingSectionScenarios.add(
            GoldenTestScenario(
              name: 'YgExpandingSection ${options.name}',
              child: YgExpandingSection(
                initiallyExpanded: false,
                icon: options.icon,
                subtitle: options.subtitle,
                trailing: options.trailing,
                title: title,
                child: const Row(
                  children: childrenToTest,
                ),
              ),
            ),
          );
          expandingSectionScenarios.add(
            GoldenTestScenario(
              name: 'YgExpandingSection.list ${options.name}',
              child: YgExpandingSection.list(
                initiallyExpanded: false,
                icon: options.icon,
                subtitle: options.subtitle,
                trailing: options.trailing,
                title: title,
                children: const <Widget>[YgListTile(title: 'YgListTile')],
              ),
            ),
          );
          expandingSectionScenarios.add(
            GoldenTestScenario(
              name: 'YgExpandingSection.column ${options.name}',
              child: YgExpandingSection.column(
                initiallyExpanded: false,
                icon: options.icon,
                subtitle: options.subtitle,
                trailing: options.trailing,
                title: title,
                children: childrenToTest,
              ),
            ),
          );

          // endregion

          // region Expanding, expanded.

          expandedSectionScenarios.add(
            GoldenTestScenario(
              name: 'YgExpandingSection (expanded) ${options.name}',
              child: YgExpandingSection(
                initiallyExpanded: true,
                icon: options.icon,
                subtitle: options.subtitle,
                trailing: options.trailing,
                title: title,
                child: const Row(
                  children: childrenToTest,
                ),
              ),
            ),
          );
          expandedSectionScenarios.add(
            GoldenTestScenario(
              name: 'YgExpandingSection.list (expanded) ${options.name}',
              child: YgExpandingSection.list(
                initiallyExpanded: true,
                icon: options.icon,
                subtitle: options.subtitle,
                trailing: options.trailing,
                title: title,
                children: const <Widget>[YgListTile(title: 'YgListTile')],
              ),
            ),
          );
          expandedSectionScenarios.add(
            GoldenTestScenario(
              name: 'YgExpandingSection.column (expanded) ${options.name}',
              child: YgExpandingSection.column(
                initiallyExpanded: true,
                icon: options.icon,
                subtitle: options.subtitle,
                trailing: options.trailing,
                title: title,
                children: childrenToTest,
              ),
            ),
          );

          // endregion
        }
      }

      final List<ScenarioGroup> groups = <ScenarioGroup>[
        ScenarioGroup(
          scenarios: sectionScenarios,
          filePrefix: 'yg_section',
          namePrefix: 'YgSection',
        ),
        ScenarioGroup(
          scenarios: expandingSectionScenarios,
          filePrefix: 'yg_expanding_section',
          namePrefix: 'YgExpandingSection',
        ),
        ScenarioGroup(
          scenarios: expandedSectionScenarios,
          filePrefix: 'yg_expanded_section',
          namePrefix: 'YgExpandingSection (expanded)',
        ),
      ];

      for (final ScenarioGroup group in groups) {
        final GoldenTestGroup ygSectionGoldenTestGroup = GoldenTestGroup(
          scenarioConstraints: YgGoldenTestValues.scenarioConstraints,
          columns: 3,
          children: group.scenarios,
        );

        for (final YgThemeTestData themeTestData in YgGoldenTestValues.themesToTest) {
          goldenTest(
            '${group.namePrefix} - ${themeTestData.themeName}',
            fileName: '${group.filePrefix}_${themeTestData.fileName}',
            builder: () => ygSectionGoldenTestGroup,
            pumpWidget: (WidgetTester widgetTester, Widget widget) {
              return widgetTester.pumpWidgetWithYgTheme(
                widget: widget,
                ygTheme: themeTestData.theme,
              );
            },
          );
        }
      }
    },
  );
}

class SectionOptions {
  const SectionOptions({
    required this.name,
    this.title,
    this.subtitle,
    this.trailing,
    this.icon,
  });

  static List<SectionOptions> createOptions(String string, String prefix) => <SectionOptions>[
        SectionOptions(
          name: 'with $prefix title',
          title: string,
        ),
        SectionOptions(
          name: 'with $prefix title and $prefix subtitle',
          title: string,
          subtitle: string,
        ),
        SectionOptions(
          name: 'with $prefix title and $prefix tag',
          title: string,
          trailing: YgTag(child: Text(string)),
        ),
        SectionOptions(
          name: 'with $prefix title and icon',
          title: string,
          icon: YgIcons.placeholder,
        ),
        SectionOptions(
          name: 'with $prefix title, $prefix subtitle, $prefix tag and icon',
          title: string,
          trailing: YgTag(child: Text(string)),
          subtitle: string,
          icon: YgIcons.placeholder,
        ),
      ];

  static final List<SectionOptions> all = <SectionOptions>[
    const SectionOptions(
      name: 'No options',
    ),
    ...createOptions(YgGoldenTestValues.shortText, 'short'),
    ...createOptions(YgGoldenTestValues.mediumText, 'medium'),
    ...createOptions(YgGoldenTestValues.longText, 'long'),
  ];

  final String name;
  final String? title;
  final String? subtitle;
  final YgTag? trailing;
  final YgColorableIconData? icon;
}

class ScenarioGroup {
  const ScenarioGroup({
    required this.scenarios,
    required this.filePrefix,
    required this.namePrefix,
  });

  final List<GoldenTestScenario> scenarios;
  final String filePrefix;
  final String namePrefix;
}
