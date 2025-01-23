// ignore_for_file: prefer-single-widget-per-file

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/layout/layout_theme.dart';
import 'package:yggdrasil/src/theme/theme.dart';

abstract class YgLayout extends StatelessWidget {
  const YgLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final YgLayoutTheme theme = context.layoutTheme;
    final Widget content = buildContent(context);
    final Widget? header = buildHeader(context);
    final Widget? footer = buildFooter(context);

    // LocalHistoryRoute
    return Material(
      color: theme.backgroundColor,
      child: Column(
        children: <Widget>[
          if (header != null) header,
          Expanded(
            child: content,
          ),
          if (footer != null) footer,
        ],
      ),
    );
  }

  Widget buildContent(BuildContext context);
  Widget? buildHeader(BuildContext context);
  Widget? buildFooter(BuildContext context);
}

class YgTabbedLayout extends YgLayout {
  const YgTabbedLayout({
    super.key,
  });

  @override
  Widget buildContent(BuildContext context) {
    // TODO: implement buildContent
    throw UnimplementedError();
  }

  @override
  Widget? buildFooter(BuildContext context) {
    // TODO: implement buildFooter
    throw UnimplementedError();
  }

  @override
  Widget? buildHeader(BuildContext context) {
    // TODO: implement buildHeader
    throw UnimplementedError();
  }
}
