import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import '../_components.dart';

class YgBottomSheet extends StatefulWidget {
  const YgBottomSheet({
    super.key,
    required this.title,
    required this.content,
    this.icon,
  })  : footerButtonsAxis = null,
        footerButtons = null;

  const YgBottomSheet.withFooter({
    super.key,
    required this.title,
    required this.content,
    this.icon,
    required this.footerButtonsAxis,
    required this.footerButtons,
  });

  final String title;
  final Widget content;
  final Widget? icon;
  final Axis? footerButtonsAxis;
  final List<YgButton>? footerButtons;

  @override
  State<YgBottomSheet> createState() => _YgBottomSheetState();
}

class _YgBottomSheetState extends State<YgBottomSheet> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final YgBottomSheetThemes theme = context.bottomSheetTheme;
    final YgBottomSheetScrollPhysicsProvider? scrollPhysicsProvider =
        context.dependOnInheritedWidgetOfExactType<YgBottomSheetScrollPhysicsProvider>();

    return RepaintBoundary(
      child: Material(
        borderRadius: theme.borderRadius,
        color: theme.backgroundColor,
        child: SafeArea(
          top: false,
          child: ClipRRect(
            borderRadius: theme.borderRadius,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: theme.outerPadding.bottom,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _buildHeader(theme),
                  _buildContent(scrollPhysicsProvider, theme),
                  if (widget.footerButtons?.isNotEmpty == true) _buildFooter(theme),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFooter(YgBottomSheetThemes theme) {
    return Padding(
      padding: theme.outerPadding.copyWith(
        top: theme.footerPadding.top,
        bottom: 0,
      ),
      child: _buildFooterButtonsList(
        theme: theme,
        buttons: widget.footerButtons ?? <Widget>[],
      ),
    );
  }

  Widget _buildFooterButtonsList({
    required YgBottomSheetThemes theme,
    required List<Widget> buttons,
  }) {
    switch (widget.footerButtonsAxis) {
      case Axis.horizontal:
        return _buildFooterHorizontalButtonsList(
          theme: theme,
          buttons: buttons,
        );

      case Axis.vertical:
      case null:
        return _buildFooterVerticalButtonsList(
          theme: theme,
          buttons: buttons,
        );
    }
  }

  Widget _buildFooterHorizontalButtonsList({
    required YgBottomSheetThemes theme,
    required List<Widget> buttons,
  }) {
    final List<Widget> children = <Widget>[];

    for (int i = 0; i < buttons.length; i++) {
      if (i != 0) {
        children.add(
          SizedBox(
            width: theme.buttonSpacing,
          ),
        );
      }

      children.add(
        Expanded(
          child: buttons[i],
        ),
      );
    }

    return Row(
      children: children,
    );
  }

  Widget _buildFooterVerticalButtonsList({
    required YgBottomSheetThemes theme,
    required List<Widget> buttons,
  }) {
    final List<Widget> children = <Widget>[];

    for (int i = 0; i < buttons.length; i++) {
      if (i != 0) {
        children.add(
          SizedBox(
            height: theme.buttonSpacing,
          ),
        );
      }

      children.add(buttons[i]);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: buttons,
    );
  }

  Padding _buildHeader(YgBottomSheetThemes theme) {
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

  Container _buildDragHandle(YgBottomSheetThemes theme) {
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
    YgBottomSheetThemes theme,
  ) {
    final Widget? icon = widget.icon;

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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                if (icon != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: icon,
                  ),
                widget.content,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
