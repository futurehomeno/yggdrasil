import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/fields/_fields.dart';

mixin YgDropDownChildRouteMixin<T extends Object> on PopupRoute<Widget> {
  YgAnyDropdownController<T> get dropdownController;
  VoidCallback get onClose;

  @override
  void onPopInvokedWithResult(bool didPop, Widget? result) {
    if (!didPop || !dropdownController.attached) {
      return;
    }

    onClose();
    dropdownController.discardChanges();
  }

  @override
  void install() {
    dropdownController.addListener(_handleDropdownControllerChange);
    super.install();
  }

  @override
  void dispose() {
    dropdownController.removeListener(_handleDropdownControllerChange);
    super.dispose();
  }

  void _handleDropdownControllerChange() {
    if (!dropdownController.attached) {
      navigator?.removeRoute(this);
    }
  }
}
