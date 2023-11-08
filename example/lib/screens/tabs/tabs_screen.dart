import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  static const String routeName = 'TabsScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const TabsScreen(),
    );
  }

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: 4,
      initialIndex: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'Tabs',
      child: Column(
        children: <Widget>[
          const YgSection.list(
            title: 'YgTabBar with label only',
            children: <Widget>[
              DefaultTabController(
                length: 4,
                child: Column(
                  children: <Widget>[
                    YgTabBar(
                      tabs: <YgTab>[
                        YgTab(label: 'Tab 1'),
                        YgTab(label: 'Tab 2'),
                        YgTab(label: 'Tab 3'),
                        YgTab(label: 'Tab 4'),
                      ],
                    ),
                    SizedBox(
                      height: 100.0,
                      child: TabBarView(
                        children: <Widget>[
                          Center(child: Text('Tab 1')),
                          Center(child: Text('Tab 2')),
                          Center(child: Text('Tab 3')),
                          Center(child: Text('Tab 4')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const YgSection.list(
            title: 'YgTabBar with icon only',
            children: <Widget>[
              DefaultTabController(
                length: 4,
                child: Column(
                  children: <Widget>[
                    YgTabBar(
                      tabs: <YgTab>[
                        YgTab(icon: YgIcons.info),
                        YgTab(icon: YgIcons.edit),
                        YgTab(icon: YgIcons.check),
                        YgTab(icon: YgIcons.bluetooth),
                      ],
                    ),
                    SizedBox(
                      height: 100.0,
                      child: TabBarView(
                        children: <Widget>[
                          Center(child: YgIcon(YgIcons.info)),
                          Center(child: YgIcon(YgIcons.edit)),
                          Center(child: YgIcon(YgIcons.check)),
                          Center(child: YgIcon(YgIcons.bluetooth)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const YgSection.list(
            title: 'YgTabBar with both label and icon',
            children: <Widget>[
              DefaultTabController(
                length: 4,
                child: Column(
                  children: <Widget>[
                    YgTabBar(
                      tabs: <YgTab>[
                        YgTab(
                          label: 'Tab 1',
                          icon: YgIcons.info,
                        ),
                        YgTab(
                          label: 'Tab 2',
                          icon: YgIcons.edit,
                        ),
                        YgTab(
                          label: 'Tab 3',
                          icon: YgIcons.check,
                        ),
                        YgTab(
                          label: 'Tab 4',
                          icon: YgIcons.bluetooth,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 100.0,
                      child: TabBarView(
                        children: <Widget>[
                          Center(child: Text('Tab 1')),
                          Center(child: Text('Tab 2')),
                          Center(child: Text('Tab 3')),
                          Center(child: Text('Tab 4')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          YgSection.list(
            title: 'YgTabBar with custom controller',
            subtitle:
                'Most cases should be covered by the default controller, but passing a custom controller is supported.',
            children: <Widget>[
              Column(
                children: <Widget>[
                  YgTabBar(
                    controller: _tabController,
                    tabs: const <YgTab>[
                      YgTab(
                        label: 'Tab 1',
                        icon: YgIcons.info,
                      ),
                      YgTab(
                        label: 'Tab 2',
                        icon: YgIcons.edit,
                      ),
                      YgTab(
                        label: 'Tab 3',
                        icon: YgIcons.check,
                      ),
                      YgTab(
                        label: 'Tab 4',
                        icon: YgIcons.bluetooth,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100.0,
                    child: TabBarView(
                      controller: _tabController,
                      children: const <Widget>[
                        Center(child: Text('Tab 1')),
                        Center(child: Text('Tab 2')),
                        Center(child: Text('Tab 3')),
                        Center(child: Text('Tab 4')),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
