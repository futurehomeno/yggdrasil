// ignore_for_file: avoid-dynamic
import 'package:flutter/material.dart';

import '../../../_token_parser.dart';
import '../type_value_or_reference.dart';
import 'cubic_bezier_type.dart';

abstract class CubicBezierTypeValueOrReference extends TypeValueOrReference<Cubic> {
  const CubicBezierTypeValueOrReference();

  static CubicBezierTypeValueOrReference parse(dynamic data) {
    final List<String>? reference = ReferenceParser.tryParse(data);
    if (reference != null) {
      return CubicBezierTypeReference(
        path: reference,
      );
    }

    if (data is! List) {
      throw TokenParseTypeError(
        type: _type,
        expectedType: List,
        foundType: data.runtimeType,
      );
    }

    if (data.length != 4) {
      throw TokenParseFormatError(
        type: _type,
        data: data,
      );
    }

    final [
      dynamic a,
      dynamic b,
      dynamic c,
      dynamic d,
    ] = data;

    if (a is! num) {
      throw TokenParseTypeError(
        type: _type,
        expectedType: List,
        foundType: data.runtimeType,
        path: <String>['0'],
      );
    }

    if (b is! num) {
      throw TokenParseTypeError(
        type: _type,
        expectedType: List,
        foundType: data.runtimeType,
        path: <String>['1'],
      );
    }

    if (c is! num) {
      throw TokenParseTypeError(
        type: _type,
        expectedType: List,
        foundType: data.runtimeType,
        path: <String>['2'],
      );
    }

    if (d is! num) {
      throw TokenParseTypeError(
        type: _type,
        expectedType: List,
        foundType: data.runtimeType,
        path: <String>['3'],
      );
    }

    return CubicBezierTypeValue(
      value: Cubic(
        a.toDouble(),
        b.toDouble(),
        c.toDouble(),
        d.toDouble(),
      ),
    );
  }

  static const TokenValueType _type = TokenValueType.cubicBezier;

  @override
  TokenValueType get type => _type;
}
