import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yggdrasil/src/components/fields/search/enums/yg_search_action.dart';
import 'package:yggdrasil/src/components/fields/search/widgets/mobile_search_screen.dart';
import 'package:yggdrasil/src/components/fields/search/widgets/search_app_bar.dart';
import 'package:yggdrasil/src/components/fields/widgets/_widgets.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_search_field_state.dart';

class YgSearchField<T> extends StatefulWidget implements YgSearchWidget<T> {
  const YgSearchField({
    super.key,
    required this.label,
    this.variant = YgFieldVariant.standard,
    this.size = YgFieldSize.large,
    this.completeAction = YgCompleteAction.unfocus,
    this.searchAction = YgSearchAction.auto,
    this.focusNode,
    this.error,
    this.disabled = false,
    this.placeholder,
    this.onFocusChanged,
    this.controller,
    this.onEditingComplete,
    this.onSearchChanged,
    this.resultSelected,
    required this.resultsBuilder,
    required this.keyboardType,
    required this.autocorrect,
    required this.readOnly,
    required this.textCapitalization,
    this.inputFormatters,
    this.initialValue,
  });

  @override
  final YgSearchResultsBuilder<T> resultsBuilder;

  @override
  final Future<String> Function(T value)? resultSelected;

  final YgSearchController<T>? controller;

  final YgSearchAction searchAction;

  /// Triggers whenever there's a change to the text field value.
  final ValueChanged<String>? onSearchChanged;

  /// The variant of the text field.
  final YgFieldVariant variant;

  /// The label shown on top of the text field.
  final String label;

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

  /// Whether the text field is disabled.
  ///
  /// Applies styling for the disabled text text field. Also disables all interaction.
  final bool disabled;

  /// The size of the text field.
  ///
  /// Primarily affects the height of the text field.
  final YgFieldSize size;

  /// The type of keyboard to use for editing the text.
  final TextInputType keyboardType;

  /// When true enables autocorrect.
  final bool autocorrect;

  /// Whether the text can be changed.
  ///
  /// When this is set to true, the text cannot be modified
  /// by any shortcut or keyboard operation. The text is still selectable.
  ///
  /// Defaults to false. Must not be null.
  final bool readOnly;

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

  /// The initial value of the text field.
  final String? initialValue;

  /// The action to perform when the user completes editing the field.
  ///
  /// By default based on the [textInputAction].
  final YgCompleteAction? completeAction;

  @override
  State<YgSearchField<T>> createState() => YgSearchFieldState2<T>();
}

class YgSearchFieldState2<T> extends StateWithYgState<YgSearchField<T>, YgSearchFieldState>
    with YgControllerManagerMixin
    implements YgSearchState<YgSearchField<T>> {
  /// Manages the controller of this widget.
  late final YgControllerManager<YgSearchController<T>> _controllerManager = manageController(
    createController: () => YgSearchController<T>(text: widget.initialValue),
    getUserController: () => widget.controller,
  );

  /// Manages the [FocusNode] of this widget.
  late final YgControllerManager<FocusNode> _focusNodeManager = manageController(
    createController: () => FocusNode(),
    getUserController: () => widget.focusNode,
  );

  final GlobalKey _fieldKey = GlobalKey();

  @override
  YgSearchFieldState createState() {
    return YgSearchFieldState(
      filled: _controllerManager.value.text.isNotEmpty,
      placeholder: widget.placeholder != null,
      error: widget.error != null,
      disabled: widget.disabled,
      suffix: true,
      variant: widget.variant,
      size: widget.size,
    );
  }

  @override
  void updateState() {
    state.disabled.value = widget.disabled;
    state.filled.value = _controllerManager.value.text.isNotEmpty;
    state.placeholder.value = widget.placeholder != null;
    state.error.value = widget.error != null;
    state.disabled.value = widget.disabled;
    state.variant.value = widget.variant;
    state.size.value = widget.size;
  }

  @override
  Widget build(BuildContext context) {
    final YgFieldTheme theme = context.fieldTheme;

    final bool isTextField = (widget.searchAction == YgSearchAction.menu) ||
        (widget.searchAction == YgSearchAction.auto && !YgConsts.isMobile);

    return YgFieldDecoration(
      key: _fieldKey,
      content: YgFieldContent(
        floatLabelOnFocus: isTextField,
        label: widget.label,
        placeholder: widget.placeholder,
        state: state,
        value: AnimatedBuilder(
          animation: _controllerManager.value,
          builder: (BuildContext context, Widget? child) {
            return Text(_controllerManager.value.text);
          },
        ),
        minLines: null,
      ),
      builder: (BuildContext context, Widget child) {
        if (widget.disabled) {
          return child;
        }

        return InkWell(
          focusNode: _focusNodeManager.value,
          onTap: _controllerManager.value.open,
          child: child,
        );
      },
      error: widget.error,
      state: state,
      suffix: AnimatedRotation(
        duration: theme.animationDuration,
        curve: theme.animationCurve,
        turns: state.opened.value ? 0.5 : 0,
        child: YgIconButton(
          onPressed: widget.disabled ? null : () {},
          size: YgIconButtonSize.small,
          icon: YgIcons.caretDown,
        ),
      ),
    );
  }

  @override
  void open() {}

  @override
  void openMenu() {}

  @override
  void openScreen() {
    final BorderRadius radius = context.fieldTheme.decorationTheme.borderRadiusOutlined;

    Navigator.of(context).push(
      MobileSearchRoute<T>(
        borderRadius: radius,
        fieldKey: _fieldKey,
        searchController: _controllerManager.value,
        searchBarBuilder: (BuildContext context) {
          return SearchAppBar(
            controller: _controllerManager.value,
            placeholder: widget.placeholder,
            keyboardType: widget.keyboardType,
            autocorrect: widget.autocorrect,
            readOnly: widget.readOnly,
            textCapitalization: widget.textCapitalization,
            inputFormatters: widget.inputFormatters,
            initialValue: widget.initialValue,
            textInputAction: TextInputAction.none,
          );
        },
      ),
    );
  }

  @override
  void close() {}

  @override
  bool get isOpen {
    return true;
  }
}
