import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class ConfigurableLayoutScreen extends StatefulWidget {
  const ConfigurableLayoutScreen({super.key});

  static const String routeName = 'ConfigurableLayoutScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const ConfigurableLayoutScreen(),
    );
  }

  @override
  State<ConfigurableLayoutScreen> createState() => _ConfigurableLayoutScreenState();
}

class _ConfigurableLayoutScreenState extends State<ConfigurableLayoutScreen> {
  YgHeaderBehavior _headerBehavior = YgHeaderBehavior.fixed;
  YgFooterBehavior _footerBehavior = YgFooterBehavior.sticky;
  bool _loading = false;
  bool _appBar = true;
  bool _footer = false;
  bool _bottom = false;
  int _segmentedButtonValue = 0;

  @override
  Widget build(BuildContext context) {
    return YgLayoutRegular(
      appBar: _appBar ? const YgAppBar() : null,
      bottom: _bottom ? _buildBottom() : null,
      headerBehavior: _headerBehavior,
      child: YgLayoutBody(
        footerBehavior: _footerBehavior,
        loading: _loading,
        footer: _footer ? _buildFooter() : null,
        child: _buildContent(),
      ),
    );
  }

  Widget _buildBottom() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: YgSegmentedButton<int>(
        onValueChanged: (int value) => setState(
          () => _segmentedButtonValue = value,
        ),
        value: _segmentedButtonValue,
        segments: const <YgButtonSegment<int>>[
          YgButtonSegment<int>(
            label: 'Year',
            value: 0,
          ),
          YgButtonSegment<int>(
            label: 'Month',
            value: 1,
          ),
          YgButtonSegment<int>(
            label: 'Day',
            value: 2,
          ),
        ],
      ),
    );
  }

  Column _buildContent() {
    return Column(
      children: <Widget>[
        YgSection.list(
          title: 'YgHeaderBehavior',
          children: <Widget>[
            YgRadioListTile<YgHeaderBehavior>(
              title: 'fixed',
              value: YgHeaderBehavior.fixed,
              groupValue: _headerBehavior,
              onChanged: (_) => setState(
                () => _headerBehavior = YgHeaderBehavior.fixed,
              ),
            ),
            YgRadioListTile<YgHeaderBehavior>(
              title: 'hideAppBar',
              value: YgHeaderBehavior.hideAppBar,
              groupValue: _headerBehavior,
              onChanged: (_) => setState(
                () => _headerBehavior = YgHeaderBehavior.hideAppBar,
              ),
            ),
            YgRadioListTile<YgHeaderBehavior>(
              title: 'hide everything',
              value: YgHeaderBehavior.hideEverything,
              groupValue: _headerBehavior,
              onChanged: (_) => setState(
                () => _headerBehavior = YgHeaderBehavior.hideEverything,
              ),
            ),
          ],
        ),
        YgSection.list(
          title: 'YgFooterBehavior',
          children: <Widget>[
            YgRadioListTile<YgFooterBehavior>(
              title: 'sticky',
              value: YgFooterBehavior.sticky,
              groupValue: _footerBehavior,
              onChanged: (_) => setState(
                () => _footerBehavior = YgFooterBehavior.sticky,
              ),
            ),
            YgRadioListTile<YgFooterBehavior>(
              title: 'pushDown',
              value: YgFooterBehavior.pushDown,
              groupValue: _footerBehavior,
              onChanged: (_) => setState(
                () => _footerBehavior = YgFooterBehavior.pushDown,
              ),
            ),
          ],
        ),
        YgSection(
          title: 'Loading',
          child: YgSwitch(
            onChanged: (_) => setState(
              () => _loading ^= true,
            ),
            value: _loading,
          ),
        ),
        YgSection(
          title: 'AppBar',
          child: YgSwitch(
            onChanged: (_) => setState(
              () => _appBar ^= true,
            ),
            value: _appBar,
          ),
        ),
        YgSection(
          title: 'Footer',
          child: YgSwitch(
            onChanged: (_) => setState(
              () => _footer ^= true,
            ),
            value: _footer,
          ),
        ),
        YgSection(
          title: 'Trailing',
          child: YgSwitch(
            onChanged: (_) => setState(
              () => _bottom ^= true,
            ),
            value: _bottom,
          ),
        ),
        const YgSection(
          title: 'Padding for scroll examples',
          child: DemoPlaceholder(
            height: 1000,
          ),
        ),
      ],
    );
  }

  YgButtonGroup _buildFooter() {
    return YgButtonGroup.vertical(
      children: <YgButton>[
        YgButton(
          variant: YgButtonVariant.link,
          onPressed: () {},
          child: const Text('Previous'),
        ),
        YgButton(
          onPressed: () {},
          child: const Text('Next'),
        ),
      ],
    );
  }
}
