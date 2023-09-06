import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/widgets/debug_option.dart';

class DebugBottomSheet extends YgBottomSheetModalRoute {
  @override
  String get name => 'YgDebugBottomSheet';

  @override
  Widget buildBottomSheet(BuildContext context) {
    return const YgBottomSheet(
      title: 'Debug',
      content: _DebugBottomSheetContent(),
    );
  }
}

class _DebugBottomSheetContent extends StatefulWidget {
  const _DebugBottomSheetContent();

  @override
  State<_DebugBottomSheetContent> createState() => _DebugBottomSheetContentState();
}

class _DebugBottomSheetContentState extends State<_DebugBottomSheetContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DebugOption(
          title: 'Layout',
          subtitle: 'Widgets that are not visible, but determine the placing of other widgets',
          type: YgDebugType.layout,
          onChange: () => setState(() {}),
          color: const Color(0x800080ff),
        ),
        DebugOption(
          title: 'Intractable',
          subtitle: 'All widgets that support some type of interaction',
          type: YgDebugType.intractable,
          onChange: () => setState(() {}),
          color: const Color(0x80ff8000),
        ),
        DebugOption(
          title: 'Other',
          subtitle: 'All widgets that are not intractable nor layout components',
          type: YgDebugType.other,
          onChange: () => setState(() {}),
          color: const Color(0x80ff00ff),
        ),
      ],
    );
  }
}
