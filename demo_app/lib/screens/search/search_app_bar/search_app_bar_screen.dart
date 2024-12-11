import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/screens/search/demo_string_search_provider.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class SearchAppBarScreen extends StatefulWidget {
  const SearchAppBarScreen({super.key});

  static const String routeName = 'SearchAppBarScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const SearchAppBarScreen(),
    );
  }

  @override
  State<SearchAppBarScreen> createState() => _SearchAppBarScreenState();
}

class _SearchAppBarScreenState extends State<SearchAppBarScreen> {
  bool _trailingAvatar = false;
  bool _customLeading = false;
  bool _automaticallyImplyLeading = true;

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      appBar: YgStringSearchAppBar(
        keyboardType: TextInputType.streetAddress,
        autocorrect: false,
        textCapitalization: TextCapitalization.sentences,
        placeholder: 'Default search field',
        completeAction: YgCompleteAction.focusNext,
        searchProvider: DemoStringSearchProvider(),
        automaticallyImplyLeading: _automaticallyImplyLeading,
        leading: _getLeading(),
        trailing: _getAvatar(),
      ),
      child: Column(
        children: <Widget>[
          YgSection.list(
            title: 'Options',
            subtitle: 'Options available for the SearchAppBar.',
            children: <Widget>[
              YgSwitchListTile(
                title: 'Automatically imply leading',
                subtitle:
                    'When true (default) will automatically show the correct leading icon button based on the current route.',
                value: _automaticallyImplyLeading,
                onChanged: (_) => setState(() => _automaticallyImplyLeading ^= true),
              ),
              YgSwitchListTile(
                title: 'Trailing avatar',
                subtitle: 'Will show a trailing avatar widget in the right side of the SearchAppBar',
                value: _trailingAvatar,
                onChanged: (_) => setState(() => _trailingAvatar ^= true),
              ),
              YgSwitchListTile(
                title: 'Custom leading',
                subtitle: 'Will show a custom leading widget instead of the default search or implied button.',
                value: _customLeading,
                onChanged: (_) => setState(() => _customLeading ^= true),
              ),
            ],
          ),
          YgSection(
            title: 'Padding to allow the screen to scroll',
            child: DemoPlaceholder(
              height: MediaQuery.sizeOf(context).height,
            ),
          ),
        ],
      ),
    );
  }

  Widget? _getLeading() {
    if (_customLeading) {
      return YgIconButton(
        icon: YgIcons.placeholder,
        onPressed: () {},
      );
    }

    return null;
  }

  Widget? _getAvatar() {
    if (_trailingAvatar) {
      return const YgAvatar(
        initials: 'TR',
        size: YgAvatarSize.medium,
      );
    }

    return null;
  }
}
