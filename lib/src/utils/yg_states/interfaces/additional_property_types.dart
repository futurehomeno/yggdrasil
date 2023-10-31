import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

// These are addition types which support animation but for which we do not need
// or want custom tweens.

// region double

typedef NullableDouble = double?;
typedef YgNullableDoubleProperty<T extends Enum> = YgProperty<T, double?>;
typedef YgMaterialNullableDoubleProperty = YgMaterialProperty<double?>;
typedef YgAnimatedNullableDoubleProperty = YgAnimatedProperty<double?>;
typedef YgDrivenNullableDoubleProperty = YgDrivenProperty<double?>;
typedef YgDoubleProperty<T extends Enum> = YgProperty<T, double>;
typedef YgMaterialDoubleProperty = YgMaterialProperty<double>;
typedef YgAnimatedDoubleProperty = YgAnimatedProperty<double>;
typedef YgDrivenDoubleProperty = YgDrivenProperty<double>;

// endregion

// region Matrix4

typedef YgMatrix4Property<T extends Enum> = YgProperty<T, Matrix4>;
typedef YgMaterialMatrix4Property = YgMaterialProperty<Matrix4>;
typedef YgAnimatedMatrix4Property = YgAnimatedProperty<Matrix4>;
typedef YgDrivenMatrix4Property = YgDrivenProperty<Matrix4>;

// endregion

// region int

typedef YgIntProperty<T extends Enum> = YgProperty<T, int>;
typedef YgMaterialIntProperty = YgMaterialProperty<int>;
typedef YgAnimatedIntProperty = YgAnimatedProperty<int>;
typedef YgDrivenIntProperty = YgDrivenProperty<int>;

// endregion
