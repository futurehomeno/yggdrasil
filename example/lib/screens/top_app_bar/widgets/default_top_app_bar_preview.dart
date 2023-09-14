import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class DefaultTopAppBarPreview extends StatefulWidget {
  const DefaultTopAppBarPreview({super.key});

  @override
  State<DefaultTopAppBarPreview> createState() => _DefaultTopAppBarPreviewState();
}

class _DefaultTopAppBarPreviewState extends State<DefaultTopAppBarPreview> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        YgTopAppBar(
          leading: _leadingWidget,
          title: 'Page title',
          centerTitle: true,
          actions: _actionsWidget,
        ),
        const SizedBox(height: 30.0),
        Padding(
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
              const SizedBox(height: 5.0),
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
            ],
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
