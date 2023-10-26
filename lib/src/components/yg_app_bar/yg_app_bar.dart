import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight((toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}

/// Custom app based based on [AppBar] from Material.
///
/// Changes were made to:
/// - allow the title to seamlessly transition from expanded to folded version.
/// - remove all unused code that caused headaches to work around.
class YgAppBar extends StatefulWidget implements PreferredSizeWidget {
  YgAppBar({
    super.key,
    this.title,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.actions,
    this.bottom,
    this.centerTitle = false,
  }) : preferredSize = _PreferredAppBarSize(50.0, bottom?.preferredSize.height);

  /// Used by [Scaffold] to compute its [YgAppBar]'s overall height. The returned value is
  /// the same `preferredSize.height` unless [YgAppBar.toolbarHeight] was null and
  /// `AppBarTheme.of(context).toolbarHeight` is non-null. In that case the
  /// return value is the sum of the theme's toolbar height and the height of
  /// the app bar's [YgAppBar.bottom] widget.
  static double preferredHeightFor(BuildContext context, Size preferredSize) {
    if (preferredSize is _PreferredAppBarSize && preferredSize.toolbarHeight == null) {
      return (AppBarTheme.of(context).toolbarHeight ?? kToolbarHeight) + (preferredSize.bottomHeight ?? 0);
    }
    return preferredSize.height;
  }

  // region values

  /// A widget to display before the toolbar's [title].
  ///
  /// Typically the [leading] widget is an [Icon] or an [IconButton].
  ///
  /// Becomes the leading component of the [NavigationToolbar] built
  /// by this widget.
  ///
  /// If this is null and [automaticallyImplyLeading] is set to true, the
  /// [YgAppBar] will imply an appropriate widget. For example, if the [YgAppBar] is
  /// in a [Scaffold] that also has a [Drawer], the [Scaffold] will fill this
  /// widget with an [IconButton] that opens the drawer (using [Icons.menu]). If
  /// there's no [Drawer] and the parent [Navigator] can go back, the [YgAppBar]
  /// will use a [BackButton] that calls [Navigator.maybePop].
  final Widget? leading;

  // TODO(bjhandeland): false and leading is null, title should be centered.
  // TODO(bjhandeland): should not be able to set this true and specify a leading.
  /// Controls whether we should try to imply the leading widget if null.
  ///
  /// If true and [leading] is null, automatically try to deduce what the leading
  /// widget should be.
  ///
  /// If false and [leading] is null, title will be centered.
  final bool automaticallyImplyLeading;

  /// The primary widget displayed in the app bar.
  ///
  /// Becomes the middle component of the [NavigationToolbar] built by this widget.
  ///
  /// The [title]'s width is constrained to fit within the remaining space
  /// between the toolbar's [leading] and [actions] widgets. Its height is
  /// _not_ constrained. The [title] is vertically centered and clipped to fit
  /// within the toolbar, whose height is [toolbarHeight]. Typically this
  /// isn't noticeable because a simple [Text] [title] will fit within the
  /// toolbar by default. On the other hand, it is noticeable when a
  /// widget with an intrinsic height that is greater than [toolbarHeight]
  /// is used as the [title]. For example, when the height of an Image used
  /// as the [title] exceeds [toolbarHeight], it will be centered and
  /// clipped (top and bottom), which may be undesirable. In cases like this
  /// the height of the [title] widget can be constrained. For example:
  ///
  /// ```dart
  /// MaterialApp(
  ///   home: Scaffold(
  ///     appBar: AppBar(
  ///       title: SizedBox(
  ///         height: _myToolbarHeight,
  ///         child: Image.asset(_logoAsset),
  ///       ),
  ///       toolbarHeight: _myToolbarHeight,
  ///     ),
  ///   ),
  /// )
  /// ```
  final String? title;

  /// {@template flutter.material.appbar.actions}
  /// A list of Widgets to display in a row after the [title] widget.
  ///
  /// Typically these widgets are [IconButton]s representing common operations.
  /// For less common operations, consider using a [PopupMenuButton] as the
  /// last action.
  ///
  /// The [actions] become the trailing component of the [NavigationToolbar] built
  /// by this widget. The height of each action is constrained to be no bigger
  /// than the [toolbarHeight].
  ///
  /// To avoid having the last action covered by the debug banner, you may want
  /// to set the [MaterialApp.debugShowCheckedModeBanner] to false.
  /// {@endtemplate}
  ///
  /// {@tool snippet}
  ///
  /// ```dart
  /// Scaffold(
  ///   body: CustomScrollView(
  ///     primary: true,
  ///     slivers: <Widget>[
  ///       SliverAppBar(
  ///         title: const Text('Hello World'),
  ///         actions: <Widget>[
  ///           IconButton(
  ///             icon: const Icon(Icons.shopping_cart),
  ///             tooltip: 'Open shopping cart',
  ///             onPressed: () {
  ///               // handle the press
  ///             },
  ///           ),
  ///         ],
  ///       ),
  ///       // ...rest of body...
  ///     ],
  ///   ),
  /// )
  /// ```
  /// {@end-tool}
  final List<Widget>? actions;

  /// {@template flutter.material.appbar.flexibleSpace}
  /// This widget is stacked behind the toolbar and the tab bar. Its height will
  /// be the same as the app bar's overall height.
  ///
  /// A flexible space isn't actually flexible unless the [YgAppBar]'s container
  /// changes the [YgAppBar]'s size. A [SliverAppBar] in a [CustomScrollView]
  /// changes the [YgAppBar]'s height when scrolled.
  ///
  /// Typically a [FlexibleSpaceBar]. See [FlexibleSpaceBar] for details.
  /// {@endtemplate}
  // final Widget? flexibleSpace;

  /// {@template flutter.material.appbar.bottom}
  /// This widget appears across the bottom of the app bar.
  ///
  /// Typically a [TabBar]. Only widgets that implement [PreferredSizeWidget] can
  /// be used at the bottom of an app bar.
  /// {@endtemplate}
  ///
  /// See also:
  ///
  ///  * [PreferredSize], which can be used to give an arbitrary widget a preferred size.
  final PreferredSizeWidget? bottom;

  /// {@template flutter.material.appbar.centerTitle}
  /// Whether the title should be centered.
  ///
  /// If this property is null, then [AppBarTheme.centerTitle] of
  /// [ThemeData.appBarTheme] is used. If that is also null, then value is
  /// adapted to the current [TargetPlatform].
  /// {@endtemplate}
  final bool centerTitle;

  /// {@template flutter.material.appbar.preferredSize}
  /// A size whose height is the sum of [toolbarHeight] and the [bottom] widget's
  /// preferred height.
  ///
  /// [Scaffold] uses this size to set its app bar's height.
  /// {@endtemplate}
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
        setState(() {
          // React to a change in MaterialState.scrolledUnder
        });
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

    final Color backgroundColor = theme.backgroundColor;

    final double effectiveElevation =
        states.contains(MaterialState.scrolledUnder) ? theme.scrolledUnderElevation : theme.elevation;

    final Widget? leading = _getLeading();
    final Widget? title = _getTitle();
    final Widget? actions = _getActions();

    final Widget toolbar = NavigationToolbar(
      leading: leading,
      middle: title,
      trailing: actions,
      centerMiddle: widget.centerTitle,
      middleSpacing: theme.titleSpacing,
    );

    // The padding applies to the toolbar and tabbar, not the flexible space.
    final Widget appBar = Align(
      alignment: Alignment.topCenter,
      child: SafeArea(
        bottom: false,
        child: toolbar,
      ),
    );

    return Semantics(
      container: true,
      child: Material(
        color: backgroundColor,
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
    if (widget.leading != null || !widget.automaticallyImplyLeading) {
      return widget.leading;
    }

    // ignore: avoid-dynamic
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    if (parentRoute?.canPop == true || parentRoute?.impliesAppBarDismissal == true) {
      return YgIconButton(
        onPressed: () => Navigator.maybePop(context),
        child: const YgIcon(YgIcons.caretLeft),
      );
    }

    return null;
  }

  Widget? _getTitle() {
    if (widget.title != null) {
      return Semantics(
        namesRoute: true,
        header: true,
        child: Text(
          widget.title!,
          style: context.appBarTheme.titleTextStyle,
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
