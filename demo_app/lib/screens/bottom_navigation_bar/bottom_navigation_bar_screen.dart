import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  static const String routeName = 'BottomNavigationBarScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const BottomNavigationBarScreen(),
    );
  }

  @override
  State<BottomNavigationBarScreen> createState() => _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int _fourIndex = 0;
  int _fiveIndex = 2;
  int _subtitleIndex = 1;
  int _liveIndex = 0;
  bool _showSubtitle = true;

  static const List<YgBottomNavigationBarItem> _baseFourItems = <YgBottomNavigationBarItem>[
    YgBottomNavigationBarItem(icon: YgIcons.homeMorning, title: 'Home'),
    YgBottomNavigationBarItem(icon: YgIcons.search, title: 'Discover'),
    YgBottomNavigationBarItem(icon: YgIcons.notification, title: 'Alerts'),
    YgBottomNavigationBarItem(icon: YgIcons.settings, title: 'Settings'),
  ];

  static const List<YgBottomNavigationBarItem> _fiveItems = <YgBottomNavigationBarItem>[
    YgBottomNavigationBarItem(icon: YgIcons.homeMorning, title: 'Home'),
    YgBottomNavigationBarItem(icon: YgIcons.search, title: 'Discover'),
    YgBottomNavigationBarItem(icon: YgIcons.calendar, title: 'Calendar'),
    YgBottomNavigationBarItem(icon: YgIcons.notification, title: 'Alerts'),
    YgBottomNavigationBarItem(icon: YgIcons.settings, title: 'Settings'),
  ];

  static const List<YgBottomNavigationBarItem> _subtitleItems = <YgBottomNavigationBarItem>[
    YgBottomNavigationBarItem(
      icon: YgIcons.homeMorning,
      title: 'Home',
      subtitle: '3 devices',
    ),
    YgBottomNavigationBarItem(
      icon: YgIcons.calendar,
      title: 'Calendar',
      subtitle: '2 events',
    ),
    YgBottomNavigationBarItem(
      icon: YgIcons.notification,
      title: 'Alerts',
      subtitle: '12 new',
    ),
    YgBottomNavigationBarItem(
      icon: YgIcons.settings,
      title: 'Settings',
      subtitle: 'Up to date',
    ),
  ];

  /// Pool of items used for the live demo. The user adds and removes items
  /// from the middle of [_liveItems], drawing from items that are not already
  /// present in the bar.
  static const List<YgBottomNavigationBarItem> _candidatePool = <YgBottomNavigationBarItem>[
    YgBottomNavigationBarItem(
      icon: YgIcons.calendar,
      title: 'Calendar',
      subtitle: '2 events',
    ),
    YgBottomNavigationBarItem(
      icon: YgIcons.bluetooth,
      title: 'Devices',
      subtitle: '6 paired',
    ),
    YgBottomNavigationBarItem(
      icon: YgIcons.info,
      title: 'About',
      subtitle: 'v1.0',
    ),
    YgBottomNavigationBarItem(
      icon: YgIcons.edit,
      title: 'Notes',
      subtitle: 'Drafts',
    ),
  ];

  /// Initial set of items shown in the live demo bar.
  late List<YgBottomNavigationBarItem> _liveItems = <YgBottomNavigationBarItem>[
    const YgBottomNavigationBarItem(
      icon: YgIcons.homeMorning,
      title: 'Home',
      subtitle: '3 devices',
    ),
    const YgBottomNavigationBarItem(
      icon: YgIcons.search,
      title: 'Discover',
      subtitle: 'New picks',
    ),
    const YgBottomNavigationBarItem(
      icon: YgIcons.notification,
      title: 'Alerts',
      subtitle: '12 new',
    ),
    const YgBottomNavigationBarItem(
      icon: YgIcons.settings,
      title: 'Settings',
      subtitle: 'Up to date',
    ),
  ];

  static const int _maxItems = 6;
  static const int _minItems = 2;

  YgBottomNavigationBarItem? _nextCandidate() {
    final Set<String> existing = _liveItems.map((YgBottomNavigationBarItem i) => i.title).toSet();
    for (final YgBottomNavigationBarItem candidate in _candidatePool) {
      if (!existing.contains(candidate.title)) {
        return candidate;
      }
    }
    return null;
  }

  void _addItemInMiddle() {
    if (_liveItems.length >= _maxItems) {
      return;
    }
    final YgBottomNavigationBarItem? candidate = _nextCandidate();
    if (candidate == null) {
      return;
    }
    setState(() {
      final int insertAt = _liveItems.length ~/ 2;
      _liveItems = <YgBottomNavigationBarItem>[
        ..._liveItems.sublist(0, insertAt),
        candidate,
        ..._liveItems.sublist(insertAt),
      ];
      // Keep selection on the same logical item it was on before the insert.
      if (_liveIndex >= insertAt) {
        _liveIndex += 1;
      }
    });
  }

  void _removeItemFromMiddle() {
    if (_liveItems.length <= _minItems) {
      return;
    }
    setState(() {
      final int removeAt = (_liveItems.length - 1) ~/ 2;
      _liveItems = <YgBottomNavigationBarItem>[
        ..._liveItems.sublist(0, removeAt),
        ..._liveItems.sublist(removeAt + 1),
      ];
      if (_liveIndex == removeAt) {
        _liveIndex = (removeAt - 1).clamp(0, _liveItems.length - 1);
      } else if (_liveIndex > removeAt) {
        _liveIndex -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool canAdd = _liveItems.length < _maxItems && _nextCandidate() != null;
    final bool canRemove = _liveItems.length > _minItems;

    return DemoScreen(
      componentName: 'BottomNavigationBar',
      child: YgLayoutBody(
        child: Column(
          children: <Widget>[
            YgSection.column(
              title: '4 items',
              subtitle: 'Default usage with icon and title only.',
              children: <Widget>[
                YgBottomNavigationBar(
                  items: _baseFourItems,
                  currentIndex: _fourIndex,
                  applySafeArea: false,
                  onTap: (int index) => setState(() => _fourIndex = index),
                ),
              ],
            ),
            YgSection.column(
              title: '5 items',
              subtitle: 'Indicator slides between items as the selection changes.',
              children: <Widget>[
                YgBottomNavigationBar(
                  items: _fiveItems,
                  currentIndex: _fiveIndex,
                  applySafeArea: false,
                  onTap: (int index) => setState(() => _fiveIndex = index),
                ),
              ],
            ),
            YgSection.column(
              title: 'With subtitle',
              subtitle: 'Each item exposes an optional subtitle, toggled per bar.',
              children: <Widget>[
                YgBottomNavigationBar(
                  items: _subtitleItems,
                  currentIndex: _subtitleIndex,
                  showSubtitle: true,
                  applySafeArea: false,
                  onTap: (int index) => setState(() => _subtitleIndex = index),
                ),
              ],
            ),
            YgSection.column(
              title: 'Live: insert and remove items in the middle',
              subtitle:
                  'Use the + / − buttons to inject or remove a tile in the middle of the bar. '
                  'Existing tiles smoothly resize to make room (or close the gap), and inserted '
                  'tiles fade in.',
              children: <Widget>[
                Wrap(
                  spacing: 12,
                  runSpacing: 8,
                  children: <Widget>[
                    YgButton(
                      onPressed: canAdd ? _addItemInMiddle : null,
                      child: const Text('+ Insert in middle'),
                    ),
                    YgButton(
                      variant: YgButtonVariant.secondary,
                      onPressed: canRemove ? _removeItemFromMiddle : null,
                      child: const Text('− Remove from middle'),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: <Widget>[
                    const Text('Show subtitle'),
                    const SizedBox(width: 8),
                    YgSwitch(
                      value: _showSubtitle,
                      onChanged: (bool value) => setState(() => _showSubtitle = value),
                    ),
                    const SizedBox(width: 16),
                    Text('Items: ${_liveItems.length}'),
                  ],
                ),
                const SizedBox(height: 12),
                YgBottomNavigationBar(
                  items: _liveItems,
                  currentIndex: _liveIndex.clamp(0, _liveItems.length - 1),
                  showSubtitle: _showSubtitle,
                  applySafeArea: false,
                  onTap: (int index) => setState(() => _liveIndex = index),
                ),
              ],
            ),
            YgSection.column(
              title: 'Safe area',
              subtitle:
                  'When the bar is placed directly above the bottom of the screen, leave applySafeArea: true (the default). '
                  'When wrapped in a parent that already pads the bottom inset (e.g. YgLayoutBody.footer), pass '
                  'applySafeArea: false so the safe area is not consumed twice.',
              children: <Widget>[
                YgButton(
                  onPressed: () => sl<YgRouter>().push(_BottomNavigationBarFullScreenDemo.route()),
                  child: const Text('Open full-screen demo'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Full-screen demo of [YgBottomNavigationBar] used as a sticky footer of
/// [YgLayoutBody]. The bar is rendered with `applySafeArea: false` because
/// the layout body already pads the bottom inset.
class _BottomNavigationBarFullScreenDemo extends StatefulWidget {
  const _BottomNavigationBarFullScreenDemo();

  static const String routeName = 'BottomNavigationBarFullScreenDemo';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const _BottomNavigationBarFullScreenDemo(),
    );
  }

  @override
  State<_BottomNavigationBarFullScreenDemo> createState() => _BottomNavigationBarFullScreenDemoState();
}

class _BottomNavigationBarFullScreenDemoState extends State<_BottomNavigationBarFullScreenDemo> {
  static const List<YgBottomNavigationBarItem> _tabs = <YgBottomNavigationBarItem>[
    YgBottomNavigationBarItem(icon: YgIcons.homeMorning, title: 'Home'),
    YgBottomNavigationBarItem(icon: YgIcons.search, title: 'Discover'),
    YgBottomNavigationBarItem(icon: YgIcons.notification, title: 'Alerts'),
    YgBottomNavigationBarItem(icon: YgIcons.settings, title: 'Settings'),
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'BottomNavigationBar — full screen',
      child: YgLayoutBody(
        footer: YgBottomNavigationBar(
          items: _tabs,
          currentIndex: _index,
          applySafeArea: false,
          onTap: (int index) => setState(() => _index = index),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Selected tab: ${_tabs[_index].title}',
              ),
              const SizedBox(height: 12),
              const Text(
                'YgLayoutBody.footer pads the bottom inset itself, so the bar '
                'is rendered with applySafeArea: false to avoid double padding.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
