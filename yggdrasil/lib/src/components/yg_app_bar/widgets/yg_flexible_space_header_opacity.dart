// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'yg_render_flexible_space_header_opacity.dart';

/// See [FlexibleSpaceBar].
class YgFlexibleSpaceHeaderOpacity extends SingleChildRenderObjectWidget {
  const YgFlexibleSpaceHeaderOpacity({
    super.key,
    required super.child,
    required this.opacity,
    required this.alwaysIncludeSemantics,
  });

  final double opacity;
  final bool alwaysIncludeSemantics;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgRenderFlexibleSpaceHeaderOpacity(opacity: opacity, alwaysIncludeSemantics: alwaysIncludeSemantics);
  }

  @override
  void updateRenderObject(BuildContext context, covariant YgRenderFlexibleSpaceHeaderOpacity renderObject) {
    renderObject
      ..alwaysIncludeSemantics = alwaysIncludeSemantics
      ..opacity = opacity;
  }
}
