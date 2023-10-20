import 'package:flutter/material.dart';

import '../_yg_states.dart';

typedef YgMaterialProperty<V> = YgProperty<MaterialState, V>;

// region Non Nullable

typedef YgMaterialBoxConstraintsProperty = YgMaterialProperty<BoxConstraints>;
typedef YgMaterialEdgeInsetsProperty = YgMaterialProperty<EdgeInsets>;
typedef YgMaterialRelativeRectProperty = YgMaterialProperty<RelativeRect>;
typedef YgMaterialThemeDataProperty = YgMaterialProperty<ThemeData>;
typedef YgMaterialAlignmentGeometryProperty = YgMaterialProperty<AlignmentGeometry>;
typedef YgMaterialColorProperty = YgMaterialProperty<Color>;
typedef YgMaterialFractionalOffsetProperty = YgMaterialProperty<FractionalOffset>;
typedef YgMaterialOffsetProperty = YgMaterialProperty<Offset>;
typedef YgMaterialShapeBorderProperty = YgMaterialProperty<ShapeBorder>;
typedef YgMaterialAlignmentProperty = YgMaterialProperty<Alignment>;
typedef YgMaterialDecorationProperty = YgMaterialProperty<Decoration>;
typedef YgMaterialIntProperty = YgMaterialProperty<int>;
typedef YgMaterialSizeProperty = YgMaterialProperty<Size>;
typedef YgMaterialBorderProperty = YgMaterialProperty<Border>;
typedef YgMaterialDoubleProperty = YgMaterialProperty<double>;
typedef YgMaterialMatrix4Property = YgMaterialProperty<Matrix4>;
typedef YgMaterialStepProperty = YgMaterialProperty<Step>;
typedef YgMaterialBorderRadiusProperty = YgMaterialProperty<BorderRadius>;
typedef YgMaterialEdgeInsetsGeometryProperty = YgMaterialProperty<EdgeInsetsGeometry>;
typedef YgMaterialRectProperty = YgMaterialProperty<Rect>;
typedef YgMaterialTextStyleProperty = YgMaterialProperty<TextStyle>;

// endregion

// region Nullable

typedef YgMaterialNullableBoxConstraintsProperty = YgMaterialProperty<BoxConstraints?>;
typedef YgMaterialNullableEdgeInsetsProperty = YgMaterialProperty<EdgeInsets?>;
typedef YgMaterialNullableRelativeRectProperty = YgMaterialProperty<RelativeRect?>;
typedef YgMaterialNullableAlignmentGeometryProperty = YgMaterialProperty<AlignmentGeometry?>;
typedef YgMaterialNullableColorProperty = YgMaterialProperty<Color?>;
typedef YgMaterialNullableFractionalOffsetProperty = YgMaterialProperty<FractionalOffset?>;
typedef YgMaterialNullableOffsetProperty = YgMaterialProperty<Offset?>;
typedef YgMaterialNullableShapeBorderProperty = YgMaterialProperty<ShapeBorder?>;
typedef YgMaterialNullableAlignmentProperty = YgMaterialProperty<Alignment?>;
typedef YgMaterialNullableDecorationProperty = YgMaterialProperty<Decoration?>;
typedef YgMaterialNullableIntProperty = YgMaterialProperty<int?>;
typedef YgMaterialNullableSizeProperty = YgMaterialProperty<Size?>;
typedef YgMaterialNullableBorderProperty = YgMaterialProperty<Border?>;
typedef YgMaterialNullableDoubleProperty = YgMaterialProperty<double?>;
typedef YgMaterialNullableMatrix4Property = YgMaterialProperty<Matrix4?>;
typedef YgMaterialNullableStepProperty = YgMaterialProperty<Step?>;
typedef YgMaterialNullableBorderRadiusProperty = YgMaterialProperty<BorderRadius?>;
typedef YgMaterialNullableEdgeInsetsGeometryProperty = YgMaterialProperty<EdgeInsetsGeometry?>;
typedef YgMaterialNullableRectProperty = YgMaterialProperty<Rect?>;
typedef YgMaterialNullableTextStyleProperty = YgMaterialProperty<TextStyle?>;

// endregion
