import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class ToggleButtonScreen extends StatefulWidget {
  const ToggleButtonScreen({super.key});

  static const String routeName = 'ToggleButtonScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const ToggleButtonScreen(),
    );
  }

  @override
  State<ToggleButtonScreen> createState() => _ToggleButtonScreenState();
}

class _ToggleButtonScreenState extends State<ToggleButtonScreen> {
  bool? iconValue = false;
  bool? triStateValue = false;
  bool? errorValue = false;
  bool? listTileValue = false;

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'ToggleButton',
      componentDesc: 'ToggleButtons',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          YgSection.base(
            title: 'Icon toggle button',
            child: YgToggleButton(
              icon: YgIcons.info,
              value: iconValue,
              onChanged: (bool? newValue) {
                iconValue = newValue;
                setState(() {});
              },
            ),
          ),
          // YgSection.base(
          //   title: 'Tri-state toggle button',
          //   child: YgToggleButton(
          //     text: 'Tri-state toggle button',
          //     value: triStateValue,
          //     triState: true,
          //     onChanged: (bool? newValue) {
          //       triStateValue = newValue;
          //       setState(() {});
          //     },
          //   ),
          // ),
          // const YgSection.base(
          //   title: 'Disabled toggle button, selected / unselected',
          //   child: Row(
          //     mainAxisSize: MainAxisSize.min,
          //     children: <Widget>[
          //       YgToggleButton(
          //         text: 'Disabled Toggle button',
          //         value: true,
          //         onChanged: null,
          //       ),
          //       YgToggleButton(
          //         text: 'Disabled Toggle button',
          //         value: false,
          //         onChanged: null,
          //       ),
          //     ],
          //   ),
          // ),
          // const YgSection.base(
          //   title: 'Toggle button in a list tile',
          //   child: YgCallout(
          //     variant: YgCalloutVariant.warning,
          //     description:
          //         'You can place a toggle button in a list tile as shown below, but consider using ToggleButtonListTile instead if you intend for the whole list tile to be tappable.',
          //   ),
          // ),
          // YgSection.list(
          //   children: <Widget>[
          //     YgListTile(
          //       title: 'Toggle button in a list tile',
          //       subtitle: 'Only the toggle button is tappable.',
          //       trailingWidgets: <Widget>[
          //         YgToggleButton(
          //           text: 'Toggle button in a list tile',
          //           value: listTileValue,
          //           onChanged: (bool? newValue) {
          //             listTileValue = newValue;
          //             setState(() {});
          //           },
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
