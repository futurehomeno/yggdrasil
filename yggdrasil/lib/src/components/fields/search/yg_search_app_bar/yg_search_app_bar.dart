import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yggdrasil/src/components/buttons/yg_icon_button/yg_icon_button.dart';
import 'package:yggdrasil/src/components/fields/enums/yg_complete_action.dart';
import 'package:yggdrasil/src/components/fields/search/controller/_controller.dart';
import 'package:yggdrasil/src/components/fields/search/controller/string_search/yg_string_search_provider.dart';
import 'package:yggdrasil/src/components/fields/search/enums/yg_search_action.dart';
import 'package:yggdrasil/src/components/fields/search/models/advanced_search/_advanced_search.dart';
import 'package:yggdrasil/src/generated/icons/_icons.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

import '../yg_search_bar/yg_search_bar.dart';

part 'yg_advanced_search_app_bar.dart';
part 'yg_simple_search_app_bar.dart';
part 'yg_string_search_app_bar.dart';

abstract class YgSearchAppBar<Value> extends StatefulWidget implements PreferredSizeWidget {
  const factory YgSearchAppBar({
    required bool autocorrect,
    bool automaticallyImplyLeading,
    YgCompleteAction completeAction,
    YgSimpleSearchController<Value>? controller,
    String? error,
    FocusNode? focusNode,
    Widget? hint,
    String? initialQuery,
    Value? initialValue,
    List<TextInputFormatter>? inputFormatters,
    Key? key,
    required TextInputType keyboardType,
    Widget? leading,
    ValueChanged<Value?>? onChanged,
    VoidCallback? onEditingComplete,
    ValueChanged<bool>? onFocusChanged,
    VoidCallback? onPressed,
    String? placeholder,
    YgSearchAction searchAction,
    required YgSimpleSearchProvider<Value> searchProvider,
    required TextCapitalization textCapitalization,
    Widget? trailing,
  }) = _YgSimpleSearchAppBar<Value>;

  const YgSearchAppBar._({
    super.key,
    required this.keyboardType,
    required this.autocorrect,
    required this.textCapitalization,
    this.focusNode,
    this.error,
    this.placeholder,
    this.onFocusChanged,
    this.onPressed,
    this.onEditingComplete,
    this.hint,
    this.inputFormatters,
    this.initialQuery,
    this.leading,
    this.trailing,
    this.completeAction = YgCompleteAction.unfocus,
    this.searchAction = YgSearchAction.auto,
    this.automaticallyImplyLeading = true,
  });

  /// Controls whether we should try to imply the leading widget if null.
  ///
  /// If true and even if [leading] is set, automatically try to deduce what the leading
  /// widget should be. If no leading widget can be automatically deduced, the
  /// [leading] will be shown.
  ///
  /// If false and [leading] is null, title will be centered.
  final bool automaticallyImplyLeading;

  /// A widget to display before the toolbar's [title].
  ///
  /// Typically the [leading] widget is an [Icon] or an [IconButton].
  ///
  /// If set and [automaticallyImplyLeading] is true, then a [BackButton] will
  /// be shown instead of the [leading] widget when possible.
  final Widget? leading;

  final Widget? trailing;

  /// Hint widget shown in the top of the search results.
  final Widget? hint;

  /// The action that should be performed when the user presses the search field.
  ///
  /// By default checks the platform and will show a full screen search for
  /// mobile devices and a search menu for other devices.
  final YgSearchAction searchAction;

  /// Called when the user presses the dropdown.
  final VoidCallback? onPressed;

  /// Called when the user submits editable content (e.g., user presses the "done"
  /// button on the keyboard).
  ///
  /// The default implementation of [onEditingComplete] executes 2 different
  /// behaviors based on the situation:
  ///
  ///  - When a completion action is pressed, such as "done", "go", "send", or
  ///    "search", the user's content is submitted to the [controller] and then
  ///    focus is given up.
  ///
  ///  - When a non-completion action is pressed, such as "next" or "previous",
  ///    the user's content is submitted to the [controller], but focus is not
  ///    given up because developers may want to immediately move focus to
  ///    another text field widget within [onSubmitted].
  ///
  /// Providing [onEditingComplete] prevents the aforementioned default behavior.
  final VoidCallback? onEditingComplete;

  /// Called when the widget gains or loses focus.
  final ValueChanged<bool>? onFocusChanged;

  /// The placeholder shown in the text field.
  ///
  /// Gets replaced with the value entered by the user if the value is not empty.
  final String? placeholder;

  /// The type of keyboard to use for editing the text.
  final TextInputType keyboardType;

  /// When true enables autocorrect.
  final bool autocorrect;

  /// Configures how the platform keyboard will select an uppercase or
  /// lowercase keyboard.
  ///
  /// Only supports text keyboards, other keyboard types will ignore this
  /// configuration. Capitalization is locale-aware.
  ///
  /// Defaults to [TextCapitalization.none]. Must not be null.
  ///
  /// See also:
  ///
  ///  * [TextCapitalization], for a description of each capitalization behavior.
  final TextCapitalization textCapitalization;

  /// The error to display under the text field.
  ///
  /// Will change the styling of the widget to reflect the presence of the error.
  /// Must be null when there is no error, an empty string is still seen as an
  /// valid error.
  final String? error;

  /// Determines what's allowed to enter into the field.
  ///
  /// See [FhInputFormatters].
  final List<TextInputFormatter>? inputFormatters;

  /// Controls the focus of the widget.
  final FocusNode? focusNode;

  /// The action to perform when the user completes editing the field.
  ///
  /// By default based on the [textInputAction].
  final YgCompleteAction completeAction;

  final String? initialQuery;

  @override
  Size get preferredSize => const Size.fromHeight(65);
}

abstract class _YgSearchAppBarState<Value, ResultValue, W extends YgSearchAppBar<Value>> extends State<W> {
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
    final YgSearchBarTheme theme = context.searchBarTheme;

    final FlexibleSpaceBarSettings? settings = context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
    final double effectiveElevation;
    if (settings?.isScrolledUnder ?? _scrolledUnder) {
      effectiveElevation = theme.scrolledUnderElevation;
    } else {
      effectiveElevation = theme.elevation;
    }

    Widget? leading = widget.leading;

    if (leading == null && widget.automaticallyImplyLeading) {
      // ignore: avoid-dynamic
      final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
      if (parentRoute?.canPop == true || parentRoute?.impliesAppBarDismissal == true) {
        leading = YgIconButton(
          onPressed: () => Navigator.maybePop(context),
          icon: YgIcons.caretLeft,
        );
      }
    }

    return Material(
      elevation: effectiveElevation,
      color: theme.barColor,
      child: SafeArea(
        bottom: false,
        child: Container(
          height: theme.barHeight,
          padding: theme.barPadding,
          alignment: Alignment.center,
          child: _buildSearchBar(leading),
        ),
      ),
    );
  }

  Widget _buildSearchBar(Widget? leading);
}
