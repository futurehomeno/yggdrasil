import 'package:flutter/material.dart';

import '_yg_states.dart';

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

// region Matrix4

typedef YgIntProperty<T extends Enum> = YgProperty<T, int>;
typedef YgMaterialIntProperty = YgMaterialProperty<int>;
typedef YgAnimatedIntProperty = YgAnimatedProperty<int>;
typedef YgDrivenIntProperty = YgDrivenProperty<int>;

// endregion
