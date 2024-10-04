part of '_yg_editable_text_container_mixin.dart';

mixin EditableTextContainerWidgetMixin on StatefulWidget {
  bool get readOnly;
  TextEditingController? get controller;
  FocusNode? get focusNode;
  String? get initialValue;
}
