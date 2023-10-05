// ignore_for_file: prefer-widget-private-members

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '_yg_debug.dart';

part 'yg_debug_renderbox.dart';
part 'yg_debug_sliver.dart';

/// A design debugging widget.
///
/// Provides debugging outlines for designers which indicate the bounds of every
/// custom widget we implement.
abstract class YgDebug extends SingleChildRenderObjectWidget {
  const factory YgDebug({
    required Widget? child,
    Key? key,
    YgDebugType type,
  }) = _YgDebugRenderBox;

  const factory YgDebug.sliver({
    required Widget? child,
    Key? key,
    YgDebugType type,
  }) = _YgDebugSliver;

  const YgDebug._({
    super.key,
    required super.child,
    this.type = YgDebugType.other,
  });

  final YgDebugType type;

  // ignore: prefer_final_fields
  static Set<YgDebugType> _enabledDebugTypes = <YgDebugType>{};

  static bool isEnabled({YgDebugType? type}) {
    if (type != null) {
      return _enabledDebugTypes.contains(type);
    }

    return _enabledDebugTypes.isNotEmpty;
  }

  static void disableDebugging(BuildContext context, {YgDebugType? type}) {
    if (type != null) {
      if (_enabledDebugTypes.contains(type)) {
        _enabledDebugTypes.remove(type);
        _rebuildFromRoot(context);
      }
    } else if (_enabledDebugTypes.isNotEmpty) {
      _enabledDebugTypes.clear();
      _rebuildFromRoot(context);
    }
  }

  static void enabledDebugging(BuildContext context, {YgDebugType? type}) {
    if (type != null) {
      if (!_enabledDebugTypes.contains(type)) {
        _enabledDebugTypes.add(type);
        _rebuildFromRoot(context);
      }
    } else if (_enabledDebugTypes.length < YgDebugType.values.length) {
      _enabledDebugTypes.addAll(YgDebugType.values);
      _rebuildFromRoot(context);
    }
  }

  static void toggleDebugging(BuildContext context, {YgDebugType? type}) {
    if (type != null) {
      if (_enabledDebugTypes.contains(type)) {
        _enabledDebugTypes.remove(type);
      } else {
        _enabledDebugTypes.add(type);
      }
    } else {
      if (_enabledDebugTypes.isNotEmpty) {
        _enabledDebugTypes.clear();
      } else {
        _enabledDebugTypes.addAll(YgDebugType.values);
      }
    }

    _rebuildFromRoot(context);
  }

  static void _rebuildFromRoot(BuildContext context) {
    Element root = context as Element;

    root.visitAncestorElements((Element element) {
      root = element;

      return true;
    });

    root.visitChildren(_rebuildChildren);
  }

  static void _rebuildChildren(Element element) {
    element.visitChildren(_rebuildChildren);

    final RenderObject? renderObject = element.renderObject;

    if (renderObject is YgRenderObjectDebugPainterMixin) {
      renderObject.markNeedsPaint();
    }
  }
}
