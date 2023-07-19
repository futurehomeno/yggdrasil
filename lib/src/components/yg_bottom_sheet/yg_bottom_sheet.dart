import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import '../_components.dart';

// TODO(bjhandeland): potentially expose the scroll controller.
class YgBottomSheet extends StatefulWidget {
  const YgBottomSheet({
    super.key,
    required this.title,
    required this.content,
    this.footerButtons,
  });

  final String title;
  final Widget content;
  final List<YgButton>? footerButtons;

  @override
  State<YgBottomSheet> createState() => _YgBottomSheetState();
}

class _YgBottomSheetState extends State<YgBottomSheet> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final YgBottomSheetTheme bottomSheetTheme = context.bottomSheetTheme;
    final YgBottomSheetScrollPhysicsProvider? scrollPhysicsProvider =
        context.dependOnInheritedWidgetOfExactType<YgBottomSheetScrollPhysicsProvider>();

    return RepaintBoundary(
      child: Material(
        borderRadius: bottomSheetTheme.borderRadius,
        color: bottomSheetTheme.backgroundColor,
        child: SafeArea(
          top: false,
          child: ClipRRect(
            borderRadius: bottomSheetTheme.borderRadius,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: bottomSheetTheme.outerPadding.bottom,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _buildHeader(bottomSheetTheme),
                  _buildContent(scrollPhysicsProvider, bottomSheetTheme),
                  if (widget.footerButtons?.isNotEmpty == true) _buildFooter(bottomSheetTheme),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFooter(YgBottomSheetTheme theme) {
    final List<Widget> buttons = widget.footerButtons!;

    final List<Widget> children = <Widget>[
      buttons[0],
    ];

    for (int i = 1; i < buttons.length; i++) {
      children.addAll(<Widget>[
        SizedBox(height: theme.buttonSpacing),
        buttons[i],
      ]);
    }

    return Padding(
      padding: theme.outerPadding.copyWith(
        top: theme.footerPadding.top,
        bottom: 0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }

  Padding _buildHeader(YgBottomSheetTheme theme) {
    return Padding(
      padding: theme.outerPadding.copyWith(bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
            child: _buildDragHandle(theme),
          ),
          Padding(
            padding: theme.titlePadding,
            child: Text(
              widget.title,
              style: theme.titleStyle,
            ),
          ),
        ],
      ),
    );
  }

  Container _buildDragHandle(YgBottomSheetTheme theme) {
    return Container(
      width: 48,
      height: 5,
      decoration: BoxDecoration(
        color: theme.handleBarColor,
        borderRadius: BorderRadius.circular(2.5),
      ),
    );
  }

  Flexible _buildContent(
    YgBottomSheetScrollPhysicsProvider? scrollPhysicsProvider,
    YgBottomSheetTheme theme,
  ) {
    return Flexible(
      child: YgScrollShadow(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: scrollPhysicsProvider?.scrollPhysics,
          child: Padding(
            padding: theme.outerPadding.copyWith(
              top: 0,
              bottom: 0,
            ),
            child: widget.content,
          ),
        ),
      ),
    );
  }
}
