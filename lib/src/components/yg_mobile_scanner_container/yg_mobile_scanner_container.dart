import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// Style-only wrapper for mobile scanner widget.
class YgMobileScannerContainer extends StatelessWidget {
  const YgMobileScannerContainer({
    required this.child,
    required this.loading,
    super.key,
  });

  /// Contents put inside the mobile scanner.
  ///
  /// This should be a MobileScanner widget, but we cannot check it
  /// as then we would have to depend on the package.
  final Widget child;

  /// Whether the mobile scanner should render the loading state.
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final YgMobileScannerContainerTheme mobileScannerContainerTheme = context.mobileScannerContainerTheme;

    return Container(
      width: mobileScannerContainerTheme.width,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: mobileScannerContainerTheme.borderRadius,
        color: mobileScannerContainerTheme.backgroundColor,
      ),
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Offstage(
                offstage: loading,
                child: child,
              ),
            ),
            if (loading)
              const Positioned.fill(
                child: Center(
                  child: YgCircularProgressIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
