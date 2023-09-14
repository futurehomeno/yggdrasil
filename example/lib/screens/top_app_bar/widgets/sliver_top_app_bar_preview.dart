import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class SliverTopAppBarPreview extends StatefulWidget {
  const SliverTopAppBarPreview({super.key});

  @override
  State<SliverTopAppBarPreview> createState() => _SliverTopAppBarPreviewState();
}

class _SliverTopAppBarPreviewState extends State<SliverTopAppBarPreview> {
  List<String> leadingStates = <String>[
    'Auto leading',
    'Custom leading',
    'No leading',
  ];

  List<String> actionStates = <String>[
    'No actions',
    'Single action',
    'Multiple actions',
  ];

  int currentLeadingIndex = 0;
  int currentActionsIndex = 0;
  YgSliverTopAppBarVariant currentVariant = YgSliverTopAppBarVariant.small;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        YgSliverTopAppBar(
          variant: currentVariant,
          leading: _leadingWidget,
          title: 'Page title',
          actions: _actionsWidget,
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 30.0)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Preview options:',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    YgTextLink(
                      text: _currentLeadingState,
                      onPressed: _toggleLeadingState,
                      size: YgTextLinkSize.medium,
                    ),
                    YgTextLink(
                      text: _currentActionsState,
                      onPressed: _toggleActionsState,
                      size: YgTextLinkSize.medium,
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                YgRadioGroup<YgSliverTopAppBarVariant>(
                  label: 'Variant',
                  radioItems: <YgRadioItem<YgSliverTopAppBarVariant>>[
                    YgRadioItem<YgSliverTopAppBarVariant>(
                      title: 'Small',
                      value: YgSliverTopAppBarVariant.small,
                      groupValue: currentVariant,
                      onChanged: (_) => setVariantValue(YgSliverTopAppBarVariant.small),
                    ),
                    YgRadioItem<YgSliverTopAppBarVariant>(
                      title: 'Medium',
                      value: YgSliverTopAppBarVariant.medium,
                      groupValue: currentVariant,
                      onChanged: (_) => setVariantValue(YgSliverTopAppBarVariant.medium),
                    ),
                    YgRadioItem<YgSliverTopAppBarVariant>(
                      title: 'Large',
                      value: YgSliverTopAppBarVariant.large,
                      groupValue: currentVariant,
                      onChanged: (_) => setVariantValue(YgSliverTopAppBarVariant.large),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // Used for better scrolling preview.
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 500.0,
          ),
        ),
      ],
    );
  }

  void _toggleLeadingState() {
    if (currentLeadingIndex < 2) {
      currentLeadingIndex++;
    } else {
      currentLeadingIndex = 0;
    }
    setState(() {});
  }

  void _toggleActionsState() {
    if (currentActionsIndex < 2) {
      currentActionsIndex++;
    } else {
      currentActionsIndex = 0;
    }
    setState(() {});
  }

  void setVariantValue(YgSliverTopAppBarVariant variant) {
    currentVariant = variant;
    setState(() {});
  }

  Widget? get _leadingWidget {
    switch (_currentLeadingState) {
      case 'Auto leading':
        return null;
      case 'Custom leading':
        return const YgIcon(YgIcons.deviceHub);
      case 'No leading':
        return const SizedBox();
    }

    return null;
  }

  List<Widget>? get _actionsWidget {
    switch (_currentActionsState) {
      case 'No actions':
        return null;
      case 'Single action':
        return const <Widget>[
          YgIcon(YgIcons.alert),
          SizedBox(width: 10.0),
        ];
      case 'Multiple actions':
        return const <Widget>[
          YgIcon(YgIcons.alert),
          SizedBox(width: 10.0),
          YgIcon(YgIcons.bluetooth),
          SizedBox(width: 10.0),
          YgIcon(YgIcons.edit),
          SizedBox(width: 10.0),
        ];
    }

    return null;
  }

  String get _currentLeadingState {
    return leadingStates[currentLeadingIndex];
  }

  String get _currentActionsState {
    return actionStates[currentActionsIndex];
  }
}
