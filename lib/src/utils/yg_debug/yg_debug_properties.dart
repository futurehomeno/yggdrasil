/// This file contains all flags that may be changed to enabled debugging of
/// various things.
///
/// The reason this is how we did it is purely because of performance reasons.
/// We do not want complex functions to be run for every built for every one of
/// our widgets even while the debugging is disabled. We rather rebuild the
/// entire app once when enabling debugging instead.

// TODO(tim): move to a better place, e.g. AppState, and remove ignore comments.
// ignore_for_file: prefer-static-class
// ignore: avoid-global-state
bool debugOutlineEnabled = false;
