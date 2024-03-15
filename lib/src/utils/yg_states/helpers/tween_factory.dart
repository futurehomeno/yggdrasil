import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

/// Factory to create tweens for specific value types.
class TweenFactory {
  const TweenFactory._();

  /// Creates [Tween] of type [T].
  ///
  /// Finds a [Tween] specialized in interpolating [T], otherwise will create
  /// a normal [Tween] of type [T].
  ///
  /// Supports any of the following classes or any class implementing them where
  /// (?) means the type may also be nullable.
  /// - [FractionalOffset] (?)
  /// - [Alignment] (?)
  /// - [AlignmentGeometry] (?)
  /// - [Border] (?)
  /// - [BorderRadius] (?)
  /// - [BoxConstraints] (?)
  /// - [Color] (?)
  /// - [Decoration] (?)
  /// - [EdgeInsets] (?)
  /// - [EdgeInsetsGeometry] (?)
  /// - [Offset] (?)
  /// - [Rect] (?)
  /// - [RelativeRect] (?)
  /// - [ShapeBorder] (?)
  /// - [Size] (?)
  /// - [TextStyle] (?)
  /// - [BorderSide] (?)
  /// - [IconThemeData] (?)
  /// - [int]
  /// - [Matrix4]
  static Tween<T> createTween<T>(T initialValue) {
    final _T<T> t = _T<T>();

    switch (t) {
      // region Templated

      case _T<FractionalOffset>():
        initialValue as FractionalOffset;

        return _AdapterTween<FractionalOffset, T>(
          parent: NonNullableFractionalOffsetTween(
            begin: initialValue,
            end: initialValue,
          ),
        );
      case _T<FractionalOffset?>():
        initialValue as FractionalOffset?;

        return _AdapterTween<FractionalOffset?, T>(
          parent: NullableFractionalOffsetTween(
            begin: initialValue,
            end: initialValue,
          ),
        );
      case _T<Alignment>():
        initialValue as Alignment;

        return _AdapterTween<Alignment, T>(
          parent: NonNullableAlignmentTween(
            begin: initialValue,
            end: initialValue,
          ),
        );
      case _T<Alignment?>():
        initialValue as Alignment?;

        return _AdapterTween<Alignment?, T>(
          parent: NullableAlignmentTween(
            begin: initialValue,
            end: initialValue,
          ),
        );
      case _T<AlignmentGeometry>():
        initialValue as AlignmentGeometry;

        return _AdapterTween<AlignmentGeometry, T>(
          parent: NonNullableAlignmentGeometryTween(
            begin: initialValue,
            end: initialValue,
          ),
        );
      case _T<AlignmentGeometry?>():
        initialValue as AlignmentGeometry?;

        return _AdapterTween<AlignmentGeometry?, T>(
          parent: NullableAlignmentGeometryTween(
            begin: initialValue,
            end: initialValue,
          ),
        );
      case _T<Border>():
        initialValue as Border;

        return _AdapterTween<Border, T>(
          parent: NonNullableBorderTween(
            begin: initialValue,
            end: initialValue,
          ),
        );
      case _T<Border?>():
        initialValue as Border?;

        return _AdapterTween<Border?, T>(
          parent: NullableBorderTween(
            begin: initialValue,
            end: initialValue,
          ),
        );
      case _T<BorderRadius>():
        initialValue as BorderRadius;

        return _AdapterTween<BorderRadius, T>(
          parent: NonNullableBorderRadiusTween(
            begin: initialValue,
            end: initialValue,
          ),
        );
      case _T<BorderRadius?>():
        initialValue as BorderRadius?;

        return _AdapterTween<BorderRadius?, T>(
          parent: NullableBorderRadiusTween(
            begin: initialValue,
            end: initialValue,
          ),
        );
      case _T<BoxConstraints>():
        initialValue as BoxConstraints;

        return _AdapterTween<BoxConstraints, T>(
          parent: NonNullableBoxConstraintsTween(
            begin: initialValue,
            end: initialValue,
          ),
        );
      case _T<BoxConstraints?>():
        initialValue as BoxConstraints?;

        return _AdapterTween<BoxConstraints?, T>(
          parent: NullableBoxConstraintsTween(
            begin: initialValue,
            end: initialValue,
          ),
        );
      case _T<Color>():
        initialValue as Color;

        return _AdapterTween<Color, T>(
          parent: NonNullableColorTween(
            begin: initialValue,
            end: initialValue,
          ),
        );
      case _T<Color?>():
        initialValue as Color?;

        return _AdapterTween<Color?, T>(
          parent: NullableColorTween(
            begin: initialValue,
            end: initialValue,
          ),
        );
      case _T<Decoration>():
        initialValue as Decoration;

        return _AdapterTween<Decoration, T>(
          parent: NonNullableDecorationTween(
            begin: initialValue,
            end: initialValue,
          ),
        );
      case _T<Decoration?>():
        initialValue as Decoration?;

        return _AdapterTween<Decoration?, T>(
          parent: NullableDecorationTween(
            begin: initialValue,
            end: initialValue,
          ),
        );
      case _T<EdgeInsets>():
        initialValue as EdgeInsets;

        return _AdapterTween<EdgeInsets, T>(
          parent: NonNullableEdgeInsetsTween(
            begin: initialValue,
            end: initialValue,
          ),
        );
      case _T<EdgeInsets?>():
        initialValue as EdgeInsets?;

        return _AdapterTween<EdgeInsets?, T>(
          parent: NullableEdgeInsetsTween(
            begin: initialValue,
            end: initialValue,
          ),
        );
      case _T<EdgeInsetsGeometry>():
        initialValue as EdgeInsetsGeometry;

        return _AdapterTween<EdgeInsetsGeometry, T>(
          parent: NonNullableEdgeInsetsGeometryTween(
            begin: initialValue,
            end: initialValue,
          ),
        );
      case _T<EdgeInsetsGeometry?>():
        initialValue as EdgeInsetsGeometry?;

        return _AdapterTween<EdgeInsetsGeometry?, T>(
          parent: NullableEdgeInsetsGeometryTween(
            begin: initialValue,
            end: initialValue,
          ),
        );
      case _T<Offset>():
        initialValue as Offset;

        return _AdapterTween<Offset, T>(
          parent: NonNullableOffsetTween(
            begin: initialValue,
            end: initialValue,
          ),
        );
      case _T<Offset?>():
        initialValue as Offset?;

        return _AdapterTween<Offset?, T>(
          parent: NullableOffsetTween(
            begin: initialValue,
            end: initialValue,
          ),
        );
      case _T<Rect>():
        initialValue as Rect;

        return _AdapterTween<Rect, T>(
          parent: NonNullableRectTween(
            begin: initialValue,
            end: initialValue,
          ),
        );
      case _T<Rect?>():
        initialValue as Rect?;

        return _AdapterTween<Rect?, T>(
          parent: NullableRectTween(
            begin: initialValue,
            end: initialValue,
          ),
        );
      case _T<RelativeRect>():
        initialValue as RelativeRect;

        return _AdapterTween<RelativeRect, T>(
          parent: NonNullableRelativeRectTween(
            begin: initialValue,
            end: initialValue,
          ),
        );
      case _T<RelativeRect?>():
        initialValue as RelativeRect?;

        return _AdapterTween<RelativeRect?, T>(
          parent: NullableRelativeRectTween(
            begin: initialValue,
            end: initialValue,
          ),
        );
      case _T<ShapeBorder>():
        initialValue as ShapeBorder;

        return _AdapterTween<ShapeBorder, T>(
          parent: NonNullableShapeBorderTween(
            begin: initialValue,
            end: initialValue,
          ),
        );
      case _T<ShapeBorder?>():
        initialValue as ShapeBorder?;

        return _AdapterTween<ShapeBorder?, T>(
          parent: NullableShapeBorderTween(
            begin: initialValue,
            end: initialValue,
          ),
        );
      case _T<Size>():
        initialValue as Size;

        return _AdapterTween<Size, T>(
          parent: NonNullableSizeTween(
            begin: initialValue,
            end: initialValue,
          ),
        );
      case _T<Size?>():
        initialValue as Size?;

        return _AdapterTween<Size?, T>(
          parent: NullableSizeTween(
            begin: initialValue,
            end: initialValue,
          ),
        );
      case _T<TextStyle>():
        initialValue as TextStyle;

        return _AdapterTween<TextStyle, T>(
          parent: NonNullableTextStyleTween(
            begin: initialValue,
            end: initialValue,
          ),
        );
      case _T<TextStyle?>():
        initialValue as TextStyle?;

        return _AdapterTween<TextStyle?, T>(
          parent: NullableTextStyleTween(
            begin: initialValue,
            end: initialValue,
          ),
        );
      case _T<BorderSide>():
        initialValue as BorderSide;

        return _AdapterTween<BorderSide, T>(
          parent: NonNullableBorderSideTween(
            begin: initialValue,
            end: initialValue,
          ),
        );
      case _T<BorderSide?>():
        initialValue as BorderSide?;

        return _AdapterTween<BorderSide?, T>(
          parent: NullableBorderSideTween(
            begin: initialValue,
            end: initialValue,
          ),
        );
      case _T<IconThemeData>():
        initialValue as IconThemeData;

        return _AdapterTween<IconThemeData, T>(
          parent: NonNullableIconThemeDataTween(
            begin: initialValue,
            end: initialValue,
          ),
        );
      case _T<IconThemeData?>():
        initialValue as IconThemeData?;

        return _AdapterTween<IconThemeData?, T>(
          parent: NullableIconThemeDataTween(
            begin: initialValue,
            end: initialValue,
          ),
        );

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

/// Type argument type check helper class.
///
/// We can not do `T is AnotherType` because `T is Type` is always true, so we
/// need to do `_T<T>() is _T<AnotherType>()` instead to check type inheritance
/// for type arguments, until dart comes up with a better idea.
// ignore: avoid-unused-generics
class _T<T> {
  const _T();
}

/// Adapts a tween of one type to another type.
///
/// Can only be used to adapt from a base type to an extended type.
class _AdapterTween<From, To> extends Tween<To> {
  _AdapterTween({
    required this.parent,
  });

  final Tween<From> parent;

  @override
  To? get begin => parent.begin as To?;

  @override
  set begin(To? newValue) => parent.begin = newValue as From;

  @override
  To? get end => parent.end as To?;

  @override
  set end(To? newValue) => parent.end = newValue as From;

  @override
  To lerp(double t) {
    return parent.lerp(t) as To;
  }

  @override
  To transform(double t) {
    return parent.transform(t) as To;
  }
}
