part of '_yg_editable_text_container_mixin.dart';

mixin EditableTextContainerStateMixin<W extends EditableTextContainerWidgetMixin> on State<W>
    implements TextSelectionGestureDetectorBuilderDelegate {
  /// The key of the editable text, used to manage the selection toolbar.
  @override
  final GlobalKey<EditableTextState> editableTextKey = GlobalKey();

  /// Disabled force press as we don't need it.
  @override
  final bool forcePressEnabled = false;

  /// Always allow selection.
  @override
  final bool selectionEnabled = true;

  /// Handles the selection gestures and triggers [_handleTap].
  late _TextFieldSelectionGestureDetectorBuilder _selectionGestureDetectorBuilder;

  /// Whether the selection handles should be show.
  bool _showSelectionHandles = false;
  bool get showSelectionHandles => _showSelectionHandles;

  late final YgControllerManager<FocusNode> _focusNodeManager =
      YgControllerManagerImplementation<EditableTextContainerStateMixin<EditableTextContainerWidgetMixin>, FocusNode>(
    createController: () => FocusNode(),
    getUserController: () => widget.focusNode,
    state: this,
    listener: focusChanged,
  );

  FocusNode get focusNode => _focusNodeManager.value;

  late final YgControllerManager<TextEditingController> _controllerManager = YgControllerManagerImplementation<
      EditableTextContainerStateMixin<EditableTextContainerWidgetMixin>, TextEditingController>(
    createController: () => TextEditingController(
      text: widget.initialValue,
    ),
    getUserController: () => widget.controller,
    state: this,
    listener: valueUpdated,
  );

  TextEditingController get controller => _controllerManager.value;

  void valueUpdated() {}

  void focusChanged() {}

  @override
  void initState() {
    _selectionGestureDetectorBuilder = _TextFieldSelectionGestureDetectorBuilder(state: this);

    super.initState();
  }

  Widget buildContextMenu(BuildContext _, EditableTextState editableTextState) {
    return AdaptiveTextSelectionToolbar.editableText(
      editableTextState: editableTextState,
    );
  }

  EditableTextState? get _editableText => editableTextKey.currentState;

  void _requestKeyboard() {
    _editableText?.requestKeyboard();
  }

  /// Toggle the toolbar when a selection handle is tapped.
  void handleSelectionHandleTapped() {
    if (controller.value.selection.isCollapsed) {
      _editableText!.toggleToolbar();
    }
  }

  bool _shouldShowSelectionHandles(SelectionChangedCause? cause) {
    // When the text field is activated by something that doesn't trigger the
    // selection overlay, we shouldn't show the handles either.
    if (!_selectionGestureDetectorBuilder.shouldShowSelectionToolbar) {
      return false;
    }

    if (cause == SelectionChangedCause.keyboard) {
      return false;
    }

    if (widget.readOnly && controller.selection.isCollapsed) {
      return false;
    }

    if (cause == SelectionChangedCause.longPress || cause == SelectionChangedCause.scribble) {
      return true;
    }

    if (controller.text.isNotEmpty) {
      return true;
    }

    return false;
  }

  void _handleTap() {
    if (!focusNode.hasFocus) {
      focusNode.requestFocus();
    }
  }

  void handleSelectionChanged(TextSelection selection, SelectionChangedCause? cause) {
    final bool willShowSelectionHandles = _shouldShowSelectionHandles(cause);
    if (willShowSelectionHandles != _showSelectionHandles) {
      _showSelectionHandles = willShowSelectionHandles;
      setState(() {});
    }

    if (cause == SelectionChangedCause.longPress) {
      _editableText?.bringIntoView(selection.extent);
    }

    if (!YgConsts.isMobile && cause == SelectionChangedCause.drag) {
      _editableText?.hideToolbar();
    }
  }

  Widget buildGestureDetector({
    required Widget child,
  }) {
    return _selectionGestureDetectorBuilder.buildGestureDetector(
      behavior: HitTestBehavior.translucent,
      child: child,
    );
  }

  Widget buildEditableText({
    required bool obscureText,
    required int? maxLines,
    required int? minLines,
    required TextInputType keyboardType,
    required bool autocorrect,
    required TextCapitalization textCapitalization,
    required bool readOnly,
    required List<TextInputFormatter>? inputFormatters,
    required ValueChanged<String>? onChanged,
    required VoidCallback? onEditingComplete,
    required TextInputAction textInputAction,
    required bool disabled,
    required Color cursorColor,
  }) {
    return YgEditableText(
      editableTextKey: editableTextKey,
      focusNode: focusNode,
      controller: controller,
      obscureText: obscureText,
      maxLines: maxLines,
      minLines: minLines,
      keyboardType: keyboardType,
      autocorrect: autocorrect,
      textCapitalization: textCapitalization,
      readOnly: readOnly,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      textInputAction: textInputAction,
      onSelectionChanged: handleSelectionChanged,
      onSelectionHandleTapped: handleSelectionHandleTapped,
      contextMenuBuilder: buildContextMenu,
      showSelectionHandles: showSelectionHandles,
      disabled: disabled,
      cursorColor: cursorColor,
    );
  }
}
