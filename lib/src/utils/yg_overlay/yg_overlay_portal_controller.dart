import 'yg_overlay_portal_2.dart';

class YgOverlayPortalController {
  YgOverlayPortal2State? state;
  bool shown = false;

  void show() {
    if (shown == true) {
      return;
    }

    shown = true;
    state?.show();
  }

  void hide() {
    if (shown == false) {
      return;
    }

    shown = false;
    state?.show();
  }
}
