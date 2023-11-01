import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// Custom app based based on [AppBar] from Material.
///
/// Changes were made to:
/// - remove all unused code that caused headaches to work around.
class YgAppBar extends StatefulWidget implements PreferredSizeWidget {
  YgAppBar({
    super.key,
    this.title,
    this.centerTitle = false,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    required this.toolbarHeight,
  }) : preferredSize = _PreferredAppBarSize(toolbarHeight, bottom?.preferredSize.height);

  // region Values

  /// The primary text displayed in the app bar.
  ///
  /// Becomes the middle component of the [NavigationToolbar] built by this widget.
  final String? title;

  /// A widget to display before the toolbar's [title].
  ///
  /// Typically the [leading] widget is an [Icon] or an [IconButton].
  ///
  /// If set and [automaticallyImplyLeading] is true, then a [BackButton] will
  /// be shown instead of the [leading] widget when possible.
  final Widget? leading;

  /// Controls whether we should try to imply the leading widget if null.
  ///
  /// If true and even if [leading] is set, automatically try to deduce what the leading
  /// widget should be. If no leading widget can be automatically deduced, the
  /// [leading] will be shown.
  ///
  /// If false and [leading] is null, title will be centered.
  final bool automaticallyImplyLeading;

  /// A list of Widgets to display in a row after the [title] widget.
  ///
  /// Typically these widgets are [IconButton]s representing common operations.
  final List<Widget>? actions;

  /// This widget appears across the bottom of the app bar.
  ///
  /// Typically a [TabBar]. Only widgets that implement [PreferredSizeWidget] can
  /// be used at the bottom of an app bar.
  final PreferredSizeWidget? bottom;

  /// Whether the title should be centered.
  final bool centerTitle;

  /// This widget is stacked behind the toolbar and the tab bar.
  ///
  /// Its height will be the same as the app bar's overall height.
  /// Used when making sliver app bars, see [YgSliverAppBar].
  final Widget? flexibleSpace;

  /// The height of the toolbar component of the app bar.
  ///
  /// Preferred size does not support context, so we need to pass this.
  final double? toolbarHeight;

  /// A size whose height is the sum of [toolbarHeight] and the [bottom] widget's
  /// preferred height.
  ///
  /// [Scaffold] uses this size to set its app bar's height.
  @override
  final Size preferredSize;

  // endregion

  @override
  State<YgAppBar> createState() => _YgAppBarState();
}

class _YgAppBarState extends State<YgAppBar> {
  ScrollNotificationObserverState? _scrollNotificationObserver;
  bool _scrolledUnder = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scrollNotificationObserver?.removeListener(_handleScrollNotification);
    _scrollNotificationObserver = ScrollNotificationObserver.maybeOf(context);
    _scrollNotificationObserver?.addListener(_handleScrollNotification);
  }

  @override
  void dispose() {
    if (_scrollNotificationObserver != null) {
      _scrollNotificationObserver!.removeListener(_handleScrollNotification);
      _scrollNotificationObserver = null;
    }
    super.dispose();
  }

  void _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification && defaultScrollNotificationPredicate(notification)) {
      final bool oldScrolledUnder = _scrolledUnder;
      final ScrollMetrics metrics = notification.metrics;
      switch (metrics.axisDirection) {
        case AxisDirection.up:
          // Scroll view is reversed
          _scrolledUnder = metrics.extentAfter > 0;
        case AxisDirection.down:
          _scrolledUnder = metrics.extentBefore > 0;
        case AxisDirection.right:
        case AxisDirection.left:
          // Scrolled under is only supported in the vertical axis, and should
          // not be altered based on horizontal notifications of the same
          // predicate since it could be a 2D scroller.
          break;
      }

      if (_scrolledUnder != oldScrolledUnder) {
        // React to a change in MaterialState.scrolledUnder
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final YgAppBarTheme theme = context.appBarTheme;
    final FlexibleSpaceBarSettings? settings = context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
    final Set<MaterialState> states = <MaterialState>{
      if (settings?.isScrolledUnder ?? _scrolledUnder) MaterialState.scrolledUnder,
    };
    final double effectiveElevation =
        states.contains(MaterialState.scrolledUnder) ? theme.scrolledUnderElevation : theme.elevation;

    final Widget? leading = _getLeading();
    final Widget? title = _getTitle();
    final Widget? actions = _getActions();

    // Use NavigationToolbar here instead of a Row.
    // This ensures correct positioning of title when there's no leading
    // or trailing widgets.
    final Widget toolbar = NavigationToolbar(
      leading: leading,
      middle: title,
      trailing: actions,
      centerMiddle: widget.centerTitle || _getLeading() == null,
      middleSpacing: theme.titleSpacing,
    );

    // Ensure that the toolbar is positioned correctly when
    // using flexible space.
    Widget appBar = CustomSingleChildLayout(
      delegate: _ToolbarContainerLayout(theme.toolbarHeight),
      child: toolbar,
    );

    // Add the bottom widget if provided.
    if (widget.bottom != null) {
      appBar = Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: theme.toolbarHeight),
              child: appBar,
            ),
          ),
          widget.bottom!,
        ],
      );
    }

    // Add horizontal padding as per the design.
    appBar = SafeArea(
      bottom: false,
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: theme.appBarHorizontalPadding,
          ),
          child: appBar,
        ),
      ),
    );

    // Add flexible space if provided.
    if (widget.flexibleSpace != null) {
      appBar = Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          Semantics(
            sortKey: const OrdinalSortKey(1.0),
            explicitChildNodes: true,
            child: widget.flexibleSpace,
          ),
          Semantics(
            sortKey: const OrdinalSortKey(0.0),
            explicitChildNodes: true,
            // Creates a material widget to prevent the flexibleSpace from
            // obscuring the ink splashes produced by appBar children.
            child: Material(
              type: MaterialType.transparency,
              child: appBar,
            ),
          ),
        ],
      );
    }

    return Semantics(
      container: true,
      child: Material(
        color: theme.backgroundColor,
        elevation: effectiveElevation,
        type: MaterialType.canvas,
        child: Semantics(
          explicitChildNodes: true,
          child: appBar,
        ),
      ),
    );
  }

  Widget? _getLeading() {
    Widget? leading;

    if (widget.automaticallyImplyLeading) {
      // ignore: avoid-dynamic
      final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
      if (parentRoute?.canPop == true || parentRoute?.impliesAppBarDismissal == true) {
        leading = YgIconButton(
          onPressed: () => Navigator.maybePop(context),
          child: const YgIcon(YgIcons.caretLeft),
        );
      }
    }

    if (leading == null && widget.leading != null) {
      leading = widget.leading;
    }

    return leading;
  }

  Widget? _getTitle() {
    if (widget.title != null) {
      return Semantics(
        namesRoute: true,
        header: true,
        child: Text(
          widget.title!,
          style: context.appBarTheme.titleTextStyle,
          overflow: TextOverflow.ellipsis,
        ),
      );
    }

    return null;
  }

  Widget? _getActions() {
    if (widget.actions != null && widget.actions!.isNotEmpty) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: widget.actions!,
      );
    }

    return null;
  }
}

// Bottom justify the toolbarHeight child which may overflow the top.
class _ToolbarContainerLayout extends SingleChildLayoutDelegate {
  const _ToolbarContainerLayout(this.toolbarHeight);

  final double toolbarHeight;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return constraints.tighten(height: toolbarHeight);
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(constraints.maxWidth, toolbarHeight);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset(0.0, size.height - childSize.height);
  }

  @override
  bool shouldRelayout(_ToolbarContainerLayout oldDelegate) => toolbarHeight != oldDelegate.toolbarHeight;
}

// Convenience class for adding preferred app size.
class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight((toolbarHeight ?? 0) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}
