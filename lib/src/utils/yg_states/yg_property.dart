import 'package:flutter/material.dart';

import '_yg_states.dart';

part 'yg_animated_property.dart';
part 'yg_driven_property.dart';

typedef YgStatesResolver<T extends Enum, V> = V Function(BuildContext, Set<T>);
typedef YgStatesAllResolver<V> = V Function(BuildContext);

typedef _NullableAlignmentGeometry = AlignmentGeometry?;
typedef _NullableAlignment = Alignment?;
typedef _NullableBorder = Border?;
typedef _NullableBorderRadius = BorderRadius?;
typedef _NullableBoxConstraints = BoxConstraints?;
typedef _NullableColor = Color?;
typedef _NullableDecoration = Decoration?;
typedef _NullableDouble = double?;
typedef _NullableEdgeInsetsGeometry = EdgeInsetsGeometry?;
typedef _NullableEdgeInsets = EdgeInsets?;
typedef _NullableFractionalOffset = FractionalOffset?;
typedef _NullableMatrix4 = Matrix4?;
typedef _NullableRect = Rect?;
typedef _NullableRelativeRect = RelativeRect?;
typedef _NullableShapeBorder = ShapeBorder?;
typedef _NullableSize = Size?;
typedef _NullableTextStyle = TextStyle?;
typedef _NullableThemeData = ThemeData?;

abstract class YgProperty<T extends Enum, V> {
  const YgProperty();

  const factory YgProperty.resolveWith(
    YgStatesResolver<T, V> resolver,
  ) = _YgPropertyResolveWith<T, V>;

  const factory YgProperty.all(
    YgStatesAllResolver<V> resolver,
  ) = _YgPropertyResolveAll<T, V>;

  /// Resolves the value for a given set of [states].
  V resolve(BuildContext context, Set<T> states);

  Tween<V> createTween(V initialValue) {
    switch (V) {
      case _NullableAlignmentGeometry:
        initialValue as _NullableAlignmentGeometry;

        return AlignmentGeometryTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<V>;
      case _NullableAlignment:
        initialValue as _NullableAlignment;

        return AlignmentTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<V>;
      case _NullableBorder:
        initialValue as _NullableBorder;

        return BorderTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<V>;
      case _NullableBorderRadius:
        initialValue as _NullableBorderRadius;

        return BorderRadiusTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<V>;
      case _NullableBoxConstraints:
        initialValue as _NullableBoxConstraints;

        return BoxConstraintsTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<V>;
      case _NullableColor:
        initialValue as _NullableColor;

        return ColorTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<V>;
      case _NullableDecoration:
        initialValue as _NullableDecoration;

        return DecorationTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<V>;
      case _NullableDouble:
        initialValue as _NullableDouble;

        return Tween<double>(
          begin: initialValue,
          end: initialValue,
        ) as Tween<V>;
      case _NullableEdgeInsetsGeometry:
        initialValue as _NullableEdgeInsetsGeometry;

        return EdgeInsetsGeometryTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<V>;
      case _NullableEdgeInsets:
        initialValue as _NullableEdgeInsets;

        return EdgeInsetsTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<V>;
      case _NullableFractionalOffset:
        initialValue as _NullableFractionalOffset;

        return FractionalOffsetTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<V>;
      case _NullableMatrix4:
        initialValue as _NullableMatrix4;

        return Matrix4Tween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<V>;
      case _NullableRect:
        initialValue as _NullableRect;

        return RectTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<V>;
      case _NullableRelativeRect:
        initialValue as _NullableRelativeRect;

        return RelativeRectTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<V>;
      case _NullableShapeBorder:
        initialValue as _NullableShapeBorder;

        return ShapeBorderTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<V>;
      case _NullableSize:
        initialValue as _NullableSize;

        return SizeTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<V>;
      case _NullableTextStyle:
        initialValue as _NullableTextStyle;

        return TextStyleTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<V>;
      case _NullableThemeData:
        initialValue as _NullableThemeData;

        return ThemeDataTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<V>;

      case AlignmentGeometry:
        initialValue as AlignmentGeometry;

        return AlignmentGeometryTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<V>;
      case Alignment:
        initialValue as Alignment;

        return AlignmentTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<V>;
      case Border:
        initialValue as Border;

        return BorderTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<V>;
      case BorderRadius:
        initialValue as BorderRadius;

        return BorderRadiusTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<V>;
      case BoxConstraints:
        initialValue as BoxConstraints;

        return BoxConstraintsTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<V>;
      case Color:
        initialValue as Color;

        return ColorTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<V>;
      case Decoration:
        initialValue as Decoration;

        return DecorationTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<V>;
      case double:
        initialValue as double;

        return Tween<double>(
          begin: initialValue,
          end: initialValue,
        ) as Tween<V>;
      case EdgeInsetsGeometry:
        initialValue as EdgeInsetsGeometry;

        return EdgeInsetsGeometryTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<V>;
      case EdgeInsets:
        initialValue as EdgeInsets;

        return EdgeInsetsTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<V>;
      case FractionalOffset:
        initialValue as FractionalOffset;

        return FractionalOffsetTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<V>;
      case Matrix4:
        initialValue as Matrix4;

        return Matrix4Tween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<V>;
      case Rect:
        initialValue as Rect;

        return RectTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<V>;
      case RelativeRect:
        initialValue as RelativeRect;

        return RelativeRectTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<V>;
      case ShapeBorder:
        initialValue as ShapeBorder;

        return ShapeBorderTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<V>;
      case Size:
        initialValue as Size;

        return SizeTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<V>;
      case TextStyle:
        initialValue as TextStyle;

        return TextStyleTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<V>;
      case ThemeData:
        initialValue as ThemeData;

        return ThemeDataTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<V>;
      default:
        return Tween<V>(
          begin: initialValue,
          end: initialValue,
        );
    }
  }

  YgAnimatedProperty<V> animate({
    required YgStatesController<T> controller,
    required YgUpdateMixin vsync,
    required Duration duration,
    required Curve curve,
  }) {
    return _YgAnimatedProperty<T, V>(
      controller: controller,
      vsync: vsync,
      curve: curve,
      duration: duration,
      property: this,
    );
  }

  YgDrivenProperty<V> drive({
    required YgStatesController<T> controller,
    required YgUpdateMixin updater,
  }) {
    return _YgDrivenProperty<T, V>(
      controller: controller,
      vsync: updater,
      property: this,
    );
  }
}

mixin YgPropertyResolveWithMixin<T extends Enum, V> on YgProperty<T, V> {
  YgStatesResolver<T, V> get resolver;

  @override
  V resolve(BuildContext context, Set<T> states) {
    return resolver(context, states);
  }
}

class _YgPropertyResolveWith<T extends Enum, V> extends YgProperty<T, V> with YgPropertyResolveWithMixin<T, V> {
  const _YgPropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, V> resolver;
}

mixin YgPropertyResolveAllMixin<T extends Enum, V> on YgProperty<T, V> {
  YgStatesAllResolver<V> get resolver;

  @override
  V resolve(BuildContext context, Set<T> states) {
    return resolver(context);
  }
}

class _YgPropertyResolveAll<T extends Enum, V> extends YgProperty<T, V> with YgPropertyResolveAllMixin<T, V> {
  const _YgPropertyResolveAll(this.resolver);

  @override
  final YgStatesAllResolver<V> resolver;
}
