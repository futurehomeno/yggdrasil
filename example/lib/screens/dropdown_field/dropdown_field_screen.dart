import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/yg_route_builder.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class DropdownFieldScreen extends StatefulWidget {
  const DropdownFieldScreen({super.key});

  static const String routeName = 'DropdownFieldScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const DropdownFieldScreen(),
    );
  }

  @override
  State<DropdownFieldScreen> createState() => _DropdownFieldScreenState();
}

class _DropdownFieldScreenState extends State<DropdownFieldScreen> {
  final FormFieldKey<String> _singleSelectKey = FormFieldKey<String>();
  final MultiSelectKey<String> _multiSelectKey = MultiSelectKey<String>();
  final YgMultiSelectDropdownController<String> _controller = YgMultiSelectDropdownController<String>();
  final FormKey _formKey = FormKey();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: DemoScreen(
        componentName: 'DropdownField',
        componentDesc: 'Dropdown Field',
        supernovaLink: 'Dropdown',
        child: Column(
          children: <Widget>[
            YgSection.column(
              title: 'Variations',
              children: <Widget>[
                YgDropdownField<String>(
                  label: 'Default dropdown',
                  entries: _generateEntries(4),
                ),
                YgDropdownField<String>(
                  label: 'Label',
                  placeholder: 'Fixed placeholder',
                  entries: _generateEntries(4),
                ),
                YgDropdownField<String>.multiSelect(
                  label: 'Multi select',
                  entries: _generateEntries(4),
                ),
                YgDropdownField<String>(
                  label: 'Bottom sheet',
                  dropdownAction: YgDropdownAction.bottomSheet,
                  entries: _generateEntries(4),
                ),
                YgDropdownField<String>(
                  label: 'Menu',
                  dropdownAction: YgDropdownAction.menu,
                  entries: _generateEntries(4),
                ),
                YgDropdownField<String>(
                  label: 'Button only',
                  dropdownAction: YgDropdownAction.none,
                  entries: _generateEntries(4),
                ),
                YgDropdownField<String>(
                  label: 'Button only',
                  variant: YgFieldVariant.outlined,
                  dropdownAction: YgDropdownAction.none,
                  entries: _generateEntries(4),
                ),
                YgDropdownField<String>(
                  label: 'Scrollable bottom sheet',
                  dropdownAction: YgDropdownAction.bottomSheet,
                  entries: _generateEntries(20),
                ),
                YgDropdownField<String>(
                  label: 'Scrollable menu',
                  dropdownAction: YgDropdownAction.menu,
                  entries: _generateEntries(20),
                ),
                YgDropdownField<String>(
                  label: 'Disabled',
                  disabled: true,
                  entries: _generateEntries(4),
                ),
              ].withVerticalSpacing(15),
            ),
            YgSection.column(
              title: 'Variants',
              children: <Widget>[
                YgDropdownField<String>(
                  label: 'Standard',
                  variant: YgFieldVariant.standard,
                  entries: _generateEntries(4),
                ),
                YgDropdownField<String>(
                  label: 'Outlined',
                  variant: YgFieldVariant.outlined,
                  entries: _generateEntries(4),
                ),
              ].withVerticalSpacing(15),
            ),
            YgSection.column(
              title: 'Form example',
              children: <Widget>[
                YgDropdownFormField<String>(
                  key: _singleSelectKey,
                  label: 'Single select',
                  entries: _generateEntries(4),
                ),
                YgDropdownFormField<String>.multiSelect(
                  key: _multiSelectKey,
                  label: 'Multi select',
                  entries: _generateEntries(4),
                ),
                YgButton(
                  onPressed: _onSubmit,
                  child: const Text('Submit'),
                ),
              ].withVerticalSpacing(15),
            ),
            Form(
              key: _formKey,
              child: YgSection.column(
                title: 'Custom controller',
                children: <Widget>[
                  YgDropdownField<String>.multiSelect(
                    entries: _generateEntries(4),
                    label: 'Custom controller',
                    controller: _controller,
                  ),
                  YgButton(
                    onPressed: () => _controller.add('value1'),
                    child: const Text('Add Value 1'),
                  ),
                  YgButton(
                    onPressed: () => _controller.clear(),
                    child: const Text('Clear selected values'),
                  ),
                  YgButton(
                    onPressed: () => _controller.openMenu(),
                    child: const Text('Open dropdown menu'),
                  ),
                ].withVerticalSpacing(15),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<YgDropdownEntry<String>> _generateEntries(int amount) {
    return List<YgDropdownEntry<String>>.generate(
      amount,
      (int index) => YgDropdownEntry<String>(
        icon: YgIcon(YgIcons.allIconPaths[index]),
        subtitle: 'Subtitle of value $index',
        title: 'Value $index',
        value: 'value$index',
      ),
    );
  }

  void _onSubmit() {
    FocusScope.of(context).unfocus();

    if (!_formKey.validate()) {
      return;
    }

    final String singleSelect = _singleSelectKey.value ?? '';
    final String multiSelect = _multiSelectKey.value?.join(', ') ?? '';

    ScaffoldMessenger.of(context).showSnackBar(
      YgSnackBar(
        context: context,
        message: 'Submitted form with $singleSelect and $multiSelect.',
      ),
    );
  }
}
