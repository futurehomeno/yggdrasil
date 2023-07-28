import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';

class YgDebugBottomSheet extends YgBottomSheetModalRoute {
  YgDebugBottomSheet(this.ygAppState);

  final YgAppState ygAppState;

  @override
  String get name => 'YgDebugBottomSheet';

  @override
  YgBottomSheet buildBottomSheet(BuildContext context) {
    return YgBottomSheet(
      title: 'Toggle debug stuff',
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
