part of '_yg_editable_text_container_mixin.dart';

class _TextFieldSelectionGestureDetectorBuilder extends TextSelectionGestureDetectorBuilder {
  _TextFieldSelectionGestureDetectorBuilder({
    required EditableTextContainerStateMixin<StatefulWidget> state,
  })  : _state = state,
        super(delegate: state);

  final EditableTextContainerStateMixin<StatefulWidget> _state;

  @override
  void onForcePressStart(ForcePressDetails details) {
    super.onForcePressStart(details);
    if (delegate.selectionEnabled && shouldShowSelectionToolbar) {
      editableText.showToolbar();
    }
  }

  @override
  void onForcePressEnd(ForcePressDetails details) {
    // Not required.
  }

  @override
  void onSingleTapUp(TapDragUpDetails details) {
    super.onSingleTapUp(details);
    _state._requestKeyboard();
    _state._handleTap();
  }

  @override
  void onSingleLongTapStart(LongPressStartDetails details) {
    super.onSingleLongTapStart(details);
    if (delegate.selectionEnabled) {
      if (Platform.isAndroid || Platform.isFuchsia || Platform.isLinux || Platform.isWindows) {
        Feedback.forLongPress(_state.context);
      }
    }
  }
}
