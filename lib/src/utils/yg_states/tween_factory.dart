import 'package:flutter/material.dart';

import '_yg_states.dart';

/// Factory to create tweens for specific value types.
class TweenFactory {
  const TweenFactory._();

  static Tween<T> createTween<T>(T initialValue) {
    switch (T) {
      // region Templated

      case Alignment:
        initialValue as Alignment;

        return NonNullableAlignmentTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case NullableAlignment:
        initialValue as Alignment?;

        return NullableAlignmentTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case AlignmentGeometry:
        initialValue as AlignmentGeometry;

        return NonNullableAlignmentGeometryTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case NullableAlignmentGeometry:
        initialValue as AlignmentGeometry?;

        return NullableAlignmentGeometryTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case Border:
        initialValue as Border;

        return NonNullableBorderTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case NullableBorder:
        initialValue as Border?;

        return NullableBorderTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case BorderRadius:
        initialValue as BorderRadius;

        return NonNullableBorderRadiusTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case NullableBorderRadius:
        initialValue as BorderRadius?;

        return NullableBorderRadiusTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case BoxConstraints:
        initialValue as BoxConstraints;

        return NonNullableBoxConstraintsTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case NullableBoxConstraints:
        initialValue as BoxConstraints?;

        return NullableBoxConstraintsTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case Color:
        initialValue as Color;

        return NonNullableColorTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case NullableColor:
        initialValue as Color?;

        return NullableColorTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case Decoration:
        initialValue as Decoration;

        return NonNullableDecorationTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case NullableDecoration:
        initialValue as Decoration?;

        return NullableDecorationTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case EdgeInsets:
        initialValue as EdgeInsets;

        return NonNullableEdgeInsetsTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case NullableEdgeInsets:
        initialValue as EdgeInsets?;

        return NullableEdgeInsetsTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case EdgeInsetsGeometry:
        initialValue as EdgeInsetsGeometry;

        return NonNullableEdgeInsetsGeometryTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case NullableEdgeInsetsGeometry:
        initialValue as EdgeInsetsGeometry?;

        return NullableEdgeInsetsGeometryTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case FractionalOffset:
        initialValue as FractionalOffset;

        return NonNullableFractionalOffsetTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case NullableFractionalOffset:
        initialValue as FractionalOffset?;

        return NullableFractionalOffsetTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case Offset:
        initialValue as Offset;

        return NonNullableOffsetTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case NullableOffset:
        initialValue as Offset?;

        return NullableOffsetTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case Rect:
        initialValue as Rect;

        return NonNullableRectTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case NullableRect:
        initialValue as Rect?;

        return NullableRectTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case RelativeRect:
        initialValue as RelativeRect;

        return NonNullableRelativeRectTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case NullableRelativeRect:
        initialValue as RelativeRect?;

        return NullableRelativeRectTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case ShapeBorder:
        initialValue as ShapeBorder;

        return NonNullableShapeBorderTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case NullableShapeBorder:
        initialValue as ShapeBorder?;

        return NullableShapeBorderTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case Size:
        initialValue as Size;

        return NonNullableSizeTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case NullableSize:
        initialValue as Size?;

        return NullableSizeTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case TextStyle:
        initialValue as TextStyle;

        return NonNullableTextStyleTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case NullableTextStyle:
        initialValue as TextStyle?;

        return NullableTextStyleTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case BorderSide:
        initialValue as BorderSide;

        return NonNullableBorderSideTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case NullableBorderSide:
        initialValue as BorderSide?;

        return NullableBorderSideTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case IconThemeData:
        initialValue as IconThemeData;

        return NonNullableIconThemeDataTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case NullableIconThemeData:
        initialValue as IconThemeData?;

        return NullableIconThemeDataTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;

      // endregion

      case int:
        initialValue as int;

        return IntTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case Matrix4:
        initialValue as Matrix4;

        return Matrix4Tween(
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
