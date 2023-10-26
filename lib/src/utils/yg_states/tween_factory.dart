import 'package:flutter/material.dart';

import '_yg_states.dart';

/// Factory to create tweens for specific value types.
class TweenFactory {
  const TweenFactory._();

  static Tween<T> createTween<T>(T initialValue) {
    final _T<T> t = _T<T>(
      initialValue: initialValue,
    );

    switch (t) {
      // region Templated

      case _T<FractionalOffset>():
        initialValue as FractionalOffset;

        return NonNullableFractionalOffsetTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case _T<NullableFractionalOffset>():
        initialValue as FractionalOffset?;

        return NullableFractionalOffsetTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case _T<Alignment>():
        initialValue as Alignment;

        return AdapterTween<Alignment, T>(
          parent: NonNullableAlignmentTween(
            begin: initialValue,
            end: initialValue,
          ),
        );
      case _T<NullableAlignment>():
        initialValue as NullableAlignment;

        return AdapterTween<NullableAlignment, T>(
          parent: NullableAlignmentTween(
            begin: initialValue,
            end: initialValue,
          ),
        );
      case _T<AlignmentGeometry>():
        initialValue as AlignmentGeometry;

        return NonNullableAlignmentGeometryTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case _T<NullableAlignmentGeometry>():
        initialValue as AlignmentGeometry?;

        return NullableAlignmentGeometryTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case _T<Border>():
        initialValue as Border;

        return NonNullableBorderTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case _T<NullableBorder>():
        initialValue as Border?;

        return NullableBorderTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case _T<BorderRadius>():
        initialValue as BorderRadius;

        return NonNullableBorderRadiusTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case _T<NullableBorderRadius>():
        initialValue as BorderRadius?;

        return NullableBorderRadiusTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case _T<BoxConstraints>():
        initialValue as BoxConstraints;

        return NonNullableBoxConstraintsTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case _T<NullableBoxConstraints>():
        initialValue as BoxConstraints?;

        return NullableBoxConstraintsTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case _T<Color>():
        initialValue as Color;

        return NonNullableColorTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case _T<NullableColor>():
        initialValue as Color?;

        return NullableColorTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case _T<Decoration>():
        initialValue as Decoration;

        return NonNullableDecorationTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case _T<NullableDecoration>():
        initialValue as Decoration?;

        return NullableDecorationTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case _T<EdgeInsets>():
        initialValue as EdgeInsets;

        return NonNullableEdgeInsetsTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case _T<NullableEdgeInsets>():
        initialValue as EdgeInsets?;

        return NullableEdgeInsetsTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case _T<EdgeInsetsGeometry>():
        initialValue as EdgeInsetsGeometry;

        return NonNullableEdgeInsetsGeometryTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case _T<NullableEdgeInsetsGeometry>():
        initialValue as EdgeInsetsGeometry?;

        return NullableEdgeInsetsGeometryTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case _T<Offset>():
        initialValue as Offset;

        return NonNullableOffsetTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case _T<NullableOffset>():
        initialValue as Offset?;

        return NullableOffsetTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case _T<Rect>():
        initialValue as Rect;

        return NonNullableRectTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case _T<NullableRect>():
        initialValue as Rect?;

        return NullableRectTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case _T<RelativeRect>():
        initialValue as RelativeRect;

        return NonNullableRelativeRectTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case _T<NullableRelativeRect>():
        initialValue as RelativeRect?;

        return NullableRelativeRectTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case _T<ShapeBorder>():
        initialValue as ShapeBorder;

        return AdapterTween<ShapeBorder, T>(
          parent: NonNullableShapeBorderTween(
            begin: initialValue,
            end: initialValue,
          ),
        );
      case _T<NullableShapeBorder>():
        initialValue as ShapeBorder?;

        return AdapterTween<ShapeBorder?, T>(
          parent: NullableShapeBorderTween(
            begin: initialValue,
            end: initialValue,
          ),
        );
      case _T<Size>():
        initialValue as Size;

        return NonNullableSizeTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case _T<NullableSize>():
        initialValue as Size?;

        return NullableSizeTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case _T<TextStyle>():
        initialValue as TextStyle;

        return NonNullableTextStyleTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case _T<NullableTextStyle>():
        initialValue as TextStyle?;

        return NullableTextStyleTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case _T<BorderSide>():
        initialValue as BorderSide;

        return NonNullableBorderSideTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case _T<NullableBorderSide>():
        initialValue as BorderSide?;

        return NullableBorderSideTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case _T<IconThemeData>():
        initialValue as IconThemeData;

        return NonNullableIconThemeDataTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case _T<NullableIconThemeData>():
        initialValue as IconThemeData?;

        return NullableIconThemeDataTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;

      // endregion

      case _T<int>():
        initialValue as int;

        return IntTween(
          begin: initialValue,
          end: initialValue,
        ) as Tween<T>;
      case _T<Matrix4>():
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

typedef SubtypeTweenCreator<T, S extends T> = Tween<S> Function(T initialValue);

class _T<T> {
  const _T({
    required this.initialValue,
  });

  final T initialValue;
}

class AdapterTween<From, To> extends Tween<To> {
  AdapterTween({
    required this.parent,
  });

  final Tween<From> parent;

  @override
  To? get begin => parent.begin as To?;

  @override
  To? get end => parent.end as To?;

  @override
  To lerp(double t) {
    return parent.lerp(t) as To;
  }

  @override
  To transform(double t) {
    return parent.transform(t) as To;
  }
}
