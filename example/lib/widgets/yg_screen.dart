import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';

class YgScreen extends StatelessWidget {
  const YgScreen({
    super.key,
    required this.componentName,
    required this.componentDesc,
    required this.supernovaLink,
    required this.child,
    this.scrollable = true,
  });

  final String componentName;
  final String componentDesc;
  final String supernovaLink;
  final bool scrollable;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final SafeArea child = SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: this.child,
      ),
    );

    return Consumer<YgAppState>(
      builder: (BuildContext context, YgAppState ygAppState, Widget? widget) {
        return Scaffold(
          appBar: AppBar(
            title: Text(componentName),
            actions: <Widget>[
              YgIcon(
                YgIcons.eyeOpen,
                onTap: () => Navigator.of(context).push(DebugBottomSheet(ygAppState)),
                tapSize: YgIconTapSize.largest,
              ),
              YgIcon(
                YgIcons.refresh,
                onTap: ygAppState.toggleTheme,
                tapSize: YgIconTapSize.largest,
              ),
            ],
          ),
          body: scrollable
              ? SingleChildScrollView(
                  child: child,
                )
              : child,
        );
      },
    );
  }
}

class DebugBottomSheet extends YgBottomSheetModalRoute {
  DebugBottomSheet(this.ygAppState);

  final YgAppState ygAppState;

  @override
  String get name => 'DebugBottomSheet';

  @override
  YgBottomSheet buildBottomSheet(BuildContext context) {
    return YgBottomSheet(
      title: 'Debug Stuff',
      content: Column(children: <Widget>[
        YgListTile(
          title: 'Toggle paint size',
          onTap: () => ygAppState.toggleDebugPaintSizeEnabled(),
          trailingWidgets: <Widget>[
            Checkbox(
              value: ygAppState.debugPaintSizeEnabled,
              onChanged: (_) => ygAppState.toggleDebugPaintSizeEnabled(),
            )
          ],
        ),
        YgListTile(
          title: 'Toggle paint baseline',
          onTap: () => ygAppState.toggleDebugPaintBaselinesEnabled(),
          trailingWidgets: <Widget>[
            Checkbox(
              value: ygAppState.debugPaintBaselinesEnabled,
              onChanged: (_) => ygAppState.toggleDebugPaintBaselinesEnabled(),
            )
          ],
        ),
        YgListTile(
          title: 'Toggle layer borders',
          onTap: () => ygAppState.toggleDebugPaintLayerBordersEnabled(),
          trailingWidgets: <Widget>[
            Checkbox(
              value: ygAppState.debugPaintLayerBordersEnabled,
              onChanged: (_) => ygAppState.toggleDebugPaintLayerBordersEnabled(),
            )
          ],
        ),
        YgListTile(
          title: 'Toggle paint pointers',
          onTap: () => ygAppState.toggleDebugPaintPointersEnabled(),
          trailingWidgets: <Widget>[
            Checkbox(
              value: ygAppState.debugPaintPointersEnabled,
              onChanged: (_) => ygAppState.toggleDebugPaintPointersEnabled(),
            )
          ],
        ),
        YgListTile(
          title: 'Toggle repaint rainbow',
          onTap: () => ygAppState.toggleDebugRepaintRainbowEnabled(),
          trailingWidgets: <Widget>[
            Checkbox(
              value: ygAppState.debugRepaintRainbowEnabled,
              onChanged: (_) => ygAppState.toggleDebugRepaintRainbowEnabled(),
            )
          ],
        ),
        YgListTile(
          title: 'Toggle repaint text rainbow',
          onTap: () => ygAppState.toggleDebugRepaintTextRainbowEnabled(),
          trailingWidgets: <Widget>[
            Checkbox(
              value: ygAppState.debugRepaintTextRainbowEnabled,
              onChanged: (_) => ygAppState.toggleDebugRepaintTextRainbowEnabled(),
            )
          ],
        ),
      ]),
    );
  }
}
