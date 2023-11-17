// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/rendering.dart';

/// See [FlexibleSpaceBar].
class YgRenderFlexibleSpaceHeaderOpacity extends RenderOpacity {
  YgRenderFlexibleSpaceHeaderOpacity({
    super.opacity,
    super.alwaysIncludeSemantics,
  });

  @override
  bool get isRepaintBoundary => false;
}
