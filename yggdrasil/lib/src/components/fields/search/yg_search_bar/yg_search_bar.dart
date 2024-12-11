import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yggdrasil/src/components/fields/search/controller/advanced_search/yg_advanced_search_state_mixin.dart';
import 'package:yggdrasil/src/components/fields/search/controller/simple_search/yg_simple_search_state_mixin.dart';
import 'package:yggdrasil/src/components/fields/search/controller/string_search/yg_string_search_state_mixin.dart';
import 'package:yggdrasil/src/components/fields/search/controller/yg_search_state_mixin_interface.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_results_layout.dart';
import 'package:yggdrasil/src/components/fields/search/widgets/mobile_search_screen/_mobile_search_screen.dart';
import 'package:yggdrasil/src/components/fields/search/widgets/search_screen_app_bar.dart';
import 'package:yggdrasil/src/components/fields/search/yg_search_bar/yg_search_bar_style.dart';
import 'package:yggdrasil/src/theme/search_bar/search_bar_theme.dart';
import 'package:yggdrasil/src/theme/theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_search_bar_state.dart';

part 'yg_advanced_search_bar.dart';
part 'yg_simple_search_bar.dart';
part 'yg_string_search_bar.dart';

/// The simplest variation of the yggdrasil search bar.
///
/// This version of the search bar guarantees the value of the selected search
/// result is the same as the final value of the widget.
///
/// For more advanced search implementation, use [YgAdvancedSearchBar] instead.
/// When searching for any string, use [YgStringSearchBar] instead.
abstract class YgSearchBar<Value> extends StatefulWidget {
  const factory YgSearchBar({
    required bool autocorrect,
    YgCompleteAction completeAction,
    YgSimpleSearchController<Value>? controller,
    String? error,
    FocusNode? focusNode,
    Widget? hint,
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
  }) = _YgSimpleSearchBar<Value>;

  const YgSearchBar._({
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
    this.leading,
    this.trailing,
    this.completeAction = YgCompleteAction.unfocus,
    this.searchAction = YgSearchAction.auto,
  });

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
}

abstract class _YgSearchBarWidgetState<Value, ResultValue, Result extends YgBaseSearchResult,
        ResultsLayout extends YgBaseSearchResultsLayout<Result>, StatefulWidget extends YgSearchBar<Value>>
    extends StateWithYgStateAndStyle<StatefulWidget, YgSearchBarState, YgSearchBarStyle>
    with YgControllerManagerMixin
    implements YgSearchStateMixinInterface<Value, ResultValue, Result, ResultsLayout> {
  final GlobalKey _fieldKey = GlobalKey();
  bool _opened = false;

  late final YgMaterialStatesControllerWithChangeCallback _materialController =
      YgMaterialStatesControllerWithChangeCallback(
    onStateChange: _handleMaterialStateChange,
  );

  /// Manages the controller of this widget.
  YgSearchControllerAny<Value, ResultValue> createController();
  YgSearchControllerAny<Value, ResultValue>? getUserController();
  late final YgControllerManager<YgSearchControllerAny<Value, ResultValue>> _controllerManager = manageController(
    createController: createController,
    getUserController: getUserController,
  );

  /// Manages the [FocusNode] of this widget.
  late final YgControllerManager<FocusNode> _focusNodeManager = manageController(
    createController: () => FocusNode(),
    getUserController: () => widget.focusNode,
  );

  @override
  YgSearchBarState createState() {
    return YgSearchBarState();
  }

  @override
  YgSearchBarStyle createStyle() {
    return YgSearchBarStyle(
      state: state,
      vsync: this,
    );
  }

  @override
  void updateState() {}

  void _handleMaterialStateChange(WidgetState widgetState, bool toggled) {
    switch (widgetState) {
      case WidgetState.focused:
        state.focused.value = toggled;
        break;
      case WidgetState.hovered:
        state.hovered.value = toggled;
        break;
      case WidgetState.pressed:
        state.pressed.value = toggled;
        break;
      default:
    }
  }

  @override
  void dispose() {
    _materialController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final YgSearchControllerAny<Value, ResultValue> controller = _controllerManager.value;
    final YgSearchBarTheme theme = context.searchBarTheme;
    final Widget? trailing = widget.trailing;

    final Widget searchButton = Focus(
      descendantsAreTraversable: false,
      skipTraversal: true,
      canRequestFocus: false,
      child: YgIconButton(
        icon: YgIcons.searchAlt,
        onPressed: _controllerManager.value.open,
      ),
    );

    Widget? leading = widget.leading;
    Widget? trailingSearch;
    if (leading == null) {
      leading = searchButton;
    } else {
      trailingSearch = searchButton;
    }

    return YgAnimatedDecoratedBox(
      decoration: style.backgroundColor.map(
        (Color color) => BoxDecoration(
          color: color,
          borderRadius: theme.containerBorderRadius,
        ),
      ),
      child: Material(
        key: _fieldKey,
        borderRadius: theme.containerBorderRadius,
        type: MaterialType.transparency,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          statesController: _materialController,
          focusNode: _focusNodeManager.value,
          splashFactory: InkRipple.splashFactory,
          overlayColor: WidgetStatePropertyAll<Color>(Colors.white.withOpacity(0.05)),
          onTap: _controllerManager.value.open,
          child: Padding(
            padding: theme.contentPadding,
            child: SizedBox(
              height: theme.contentHeight,
              child: Row(
                children: <Widget>[
                  leading,
                  Expanded(
                    child: RepaintBoundary(
                      child: YgOptimizedListenableBuilder<String>(
                        listenable: controller,
                        getValue: () => controller.valueText,
                        builder: (BuildContext context, String value, Widget? child) {
                          final String? placeholder = widget.placeholder;

                          if (value.isNotEmpty) {
                            return Text(
                              value,
                              style: theme.valueTextStyle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            );
                          }

                          if (placeholder != null && placeholder.isNotEmpty == true) {
                            return Text(
                              placeholder,
                              style: theme.placeholderTextStyle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            );
                          }

                          return const SizedBox();
                        },
                      ),
                    ),
                  ),
                  if (trailingSearch != null) trailingSearch,
                  if (trailing != null) trailing,
                ].withHorizontalSpacing(theme.contentSpacing),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void open() {
    _focusNodeManager.value.requestFocus();
    widget.onPressed?.call();

    switch (widget.searchAction) {
      case YgSearchAction.screen:
        return openScreen();
      case YgSearchAction.menu:
        return openMenu();
      case YgSearchAction.auto:
        return _performPlatformAction();
      case YgSearchAction.none:
        return;
    }
  }

  void _performPlatformAction() {
    if (YgConsts.isMobile) {
      openScreen();
    } else {
      openMenu();
    }
  }

  @override
  void openMenu() {
    // TODO(Tim): Implement this.
  }

  @override
  void openScreen() {
    final YgSearchBarTheme theme = context.searchBarTheme;
    _opened = true;

    Navigator.of(context).push(
      SearchScreenRoute<ResultValue>(
        searchController: _controllerManager.value,
        borderRadius: theme.containerBorderRadius,
        fieldKey: _fieldKey,
        onClose: _onClosed,
        searchBarBuilder: (BuildContext context) {
          return SearchScreenAppBar(
            controller: _controllerManager.value,
            placeholder: widget.placeholder,
            keyboardType: widget.keyboardType,
            autocorrect: widget.autocorrect,
            textCapitalization: widget.textCapitalization,
            inputFormatters: widget.inputFormatters,
            textInputAction: YgConsts.isIos ? TextInputAction.search : TextInputAction.none,
            onEditingComplete: widget.onEditingComplete,
            onFocusChanged: null,
            initialValue: null,
            focusNode: null,
            onChanged: null,
          );
        },
      ),
    );

    _controllerManager.value.startSession();
  }

  @override
  void close() {
    Navigator.popUntil(
      context,
      // ignore: avoid-dynamic
      (Route<dynamic> route) => route is! SearchScreenRoute,
    );

    _onClosed();
  }

  @override
  bool get isOpen {
    return _opened;
  }

  void _onClosed() {
    if (!_opened) {
      return;
    }

    _controllerManager.value.endSession();
    YgEditingCompleteHelper.onComplete(
      onEditingComplete: widget.onEditingComplete,
      focusNode: _focusNodeManager.value,
      completeAction: widget.completeAction,
    );
  }
}
