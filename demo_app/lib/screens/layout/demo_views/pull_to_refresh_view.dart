import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class PullToRefreshView extends StatefulWidget {
  const PullToRefreshView({super.key});

  @override
  State<PullToRefreshView> createState() => _PullToRefreshViewState();
}

class _PullToRefreshViewState extends State<PullToRefreshView> {
  final Random _random = Random();
  DateTime _lastRefreshed = DateTime.now();
  int _refreshCount = 0;
  double _power = 1.4;
  double _current = 6.0;
  double _voltage = 230;

  Future<void> _handleRefresh() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    if (!mounted) {
      return;
    }
    setState(() {
      _lastRefreshed = DateTime.now();
      _refreshCount += 1;
      _power = 1 + _random.nextDouble() * 4;
      _current = 4 + _random.nextDouble() * 12;
      _voltage = 220 + _random.nextDouble() * 20;
    });
  }

  String get _lastRefreshedLabel {
    final String hh = _lastRefreshed.hour.toString().padLeft(2, '0');
    final String mm = _lastRefreshed.minute.toString().padLeft(2, '0');
    final String ss = _lastRefreshed.second.toString().padLeft(2, '0');

    return '$hh:$mm:$ss';
  }

  @override
  Widget build(BuildContext context) {
    return YgLayoutBody(
      onRefresh: _handleRefresh,
      footer: YgButtonGroup.vertical(
        children: <YgButton>[
          YgButton(
            variant: YgButtonVariant.link,
            child: const Text('Cancel'),
            onPressed: () {},
          ),
          YgButton(
            child: const Text('Save'),
            onPressed: () {},
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          YgSection.list(
            title: 'Status',
            children: <Widget>[
              YgListTile(
                title: 'Last refreshed',
                leadingWidgets: const <YgIcon>[YgIcon(YgIcons.refresh)],
                trailingWidgets: <Widget>[Text(_lastRefreshedLabel)],
              ),
              YgListTile(
                title: 'Refresh count',
                leadingWidgets: const <YgIcon>[YgIcon(YgIcons.history)],
                trailingWidgets: <Widget>[Text('$_refreshCount')],
              ),
            ],
          ),
          const YgSection(
            child: YgCallout(
              variant: YgCalloutVariant.highlight,
              description: 'Pull down from the top to refresh the readings below.',
            ),
          ),
          YgSection.list(
            title: 'Live readings',
            children: <Widget>[
              YgListTile(
                title: 'Power',
                leadingWidgets: const <YgIcon>[YgIcon(YgIcons.power)],
                trailingWidgets: <Widget>[Text('${_power.toStringAsFixed(2)} kW')],
              ),
              YgListTile(
                title: 'Current',
                leadingWidgets: const <YgIcon>[YgIcon(YgIcons.power)],
                trailingWidgets: <Widget>[Text('${_current.toStringAsFixed(1)} A')],
              ),
              YgListTile(
                title: 'Voltage',
                leadingWidgets: const <YgIcon>[YgIcon(YgIcons.power)],
                trailingWidgets: <Widget>[Text('${_voltage.toStringAsFixed(0)} V')],
              ),
            ],
          ),
          YgSection.list(
            title: 'Settings',
            children: <Widget>[
              YgListTile.link(
                link: 'System data',
                icon: YgIcons.support,
                onTap: () {},
              ),
              YgListTile.link(
                link: 'Notifications',
                icon: YgIcons.bell,
                onTap: () {},
              ),
              YgListTile.link(
                link: 'Customize',
                icon: YgIcons.edit,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
