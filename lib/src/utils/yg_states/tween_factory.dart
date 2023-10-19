import 'package:flutter/material.dart';

import '_yg_states.dart';
import 'types/internal.dart';

/// Factory to create tweens for specific value types.
class TweenFactory {
  const TweenFactory._();

  static Tween<T> createTween<T>(T initialValue) {
    switch (T) {
      case NullableAlignmentGeometry:
        initialValue as NullableAlignmentGeometry;

        return AlignmentGeometryTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case NullableAlignment:
        initialValue as NullableAlignment;

        return AlignmentTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case NullableBorder:
        initialValue as NullableBorder;

        return BorderTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case NullableBorderRadius:
        initialValue as NullableBorderRadius;

        return BorderRadiusTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case NullableBoxConstraints:
        initialValue as NullableBoxConstraints;

        return BoxConstraintsTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case NullableColor:
        initialValue as NullableColor;

        return ColorTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case NullableDecoration:
        initialValue as NullableDecoration;

        return DecorationTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case NullableDouble:
        initialValue as NullableDouble;

        return Tween<double>(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case NullableEdgeInsetsGeometry:
        initialValue as NullableEdgeInsetsGeometry;

        return EdgeInsetsGeometryTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case NullableEdgeInsets:
        initialValue as NullableEdgeInsets;

        return EdgeInsetsTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case NullableFractionalOffset:
        initialValue as NullableFractionalOffset;

        return FractionalOffsetTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case NullableMatrix4:
        initialValue as NullableMatrix4;

        return Matrix4Tween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case NullableRect:
        initialValue as NullableRect;

        return RectTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case NullableRelativeRect:
        initialValue as NullableRelativeRect;

        return RelativeRectTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case NullableShapeBorder:
        initialValue as NullableShapeBorder;

        return ShapeBorderTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case NullableSize:
        initialValue as NullableSize;

        return SizeTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case NullableTextStyle:
        initialValue as NullableTextStyle;

        return TextStyleTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case NullableThemeData:
        initialValue as NullableThemeData;

        return ThemeDataTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;

      case AlignmentGeometry:
        initialValue as AlignmentGeometry;

        return AlignmentGeometryTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case Alignment:
        initialValue as Alignment;

        return AlignmentTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case Border:
        initialValue as Border;

        return BorderTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case BorderRadius:
        initialValue as BorderRadius;

        return BorderRadiusTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case BoxConstraints:
        initialValue as BoxConstraints;

        return BoxConstraintsTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case Color:
        initialValue as Color;

        return ColorTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case Decoration:
        initialValue as Decoration;

        return DecorationTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case double:
        initialValue as double;

        return Tween<double>(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case EdgeInsetsGeometry:
        initialValue as EdgeInsetsGeometry;

        return EdgeInsetsGeometryTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case EdgeInsets:
        initialValue as EdgeInsets;

        return EdgeInsetsTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case FractionalOffset:
        initialValue as FractionalOffset;

        return FractionalOffsetTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case Matrix4:
        initialValue as Matrix4;

        return Matrix4Tween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case Rect:
        initialValue as Rect;

        return RectTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case RelativeRect:
        initialValue as RelativeRect;

        return RelativeRectTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case ShapeBorder:
        initialValue as ShapeBorder;

        return ShapeBorderTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case Size:
        initialValue as Size;

        return SizeTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case TextStyle:
        initialValue as TextStyle;

        return TextStyleTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case ThemeData:
        initialValue as ThemeData;

        return ThemeDataTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case Offset:
        initialValue as Offset;

        return OffsetTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case NullableOffset:
        initialValue as NullableOffset;

        return OffsetTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      default:
        return Tween<T>(
          begin: initialValue,
          end: initialValue,
        );
    }
  }
}
