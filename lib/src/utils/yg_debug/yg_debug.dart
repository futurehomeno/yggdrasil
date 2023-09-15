// ignore_for_file: prefer-widget-private-members

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '_yg_debug.dart';

/// A design debugging widget.
///
/// Provides debugging outlines for designers which indicate the bounds of every
/// custom widget we implement.
class YgDebug extends SingleChildRenderObjectWidget {
  const YgDebug({
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

    if (renderObject is _YgDebugChild) {
      renderObject.markNeedsPaint();
    }
  }

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _YgDebugChild(
      type: type,
    );
  }

  @override
  // ignore: library_private_types_in_public_api
  void updateRenderObject(BuildContext context, covariant _YgDebugChild renderObject) {
    renderObject.type = type;
    super.updateRenderObject(context, renderObject);
  }
}

class _YgDebugChild extends RenderProxyBox {
  _YgDebugChild({
    required YgDebugType type,
  }) : _type = type;

  YgDebugType _type;

  YgDebugType get type => _type;

  set type(YgDebugType newType) {
    if (_type != newType) {
      if (_isToggled() != _isToggled(newType)) {
        markNeedsPaint();
      }
      _type = newType;
    }
  }

  bool _isToggled([YgDebugType? type]) => YgDebug.isEnabled(type: type ?? _type);

  static final Paint _layoutPaint = Paint()
    ..color = const Color(0x800080ff)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2
    ..strokeCap = StrokeCap.square;

  static final Paint _intractablePaint = Paint()
    ..color = const Color(0x80ff8000)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2
    ..strokeCap = StrokeCap.square;

  static final Paint _otherPaint = Paint()
    ..color = const Color(0x80ff00ff)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2
    ..strokeCap = StrokeCap.square;

  @override
  void paint(
    PaintingContext context,
    Offset offset,
  ) {
    final RenderBox? child = this.child;

    if (child == null) {
      return;
    }

    // We always first draw the child.
    context.paintChild(child, offset);

    if (_isToggled()) {
      final Path path = Path();

      path.moveTo(offset.dx, offset.dy);
      path.lineTo(offset.dx + size.width, offset.dy);
      path.lineTo(offset.dx + size.width, size.height + offset.dy);
      path.lineTo(offset.dx, size.height + offset.dy);
      path.lineTo(offset.dx, offset.dy);

      final Paint paint = switch (_type) {
        YgDebugType.intractable => _intractablePaint,
        YgDebugType.layout => _layoutPaint,
        YgDebugType.other => _otherPaint,
      };

      context.canvas.drawPath(path, paint);
    }
  }
}
