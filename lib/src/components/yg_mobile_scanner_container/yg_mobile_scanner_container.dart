import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

/// Style-only wrapper for mobile scanner widget.
class YgMobileScannerContainer extends StatelessWidget {
  const YgMobileScannerContainer({
    required this.child,
    super.key,
  });

  /// Contents put inside the mobile scanner.
  ///
  /// This should be a MobileScanner widget, but we cannot check it
  /// as then we would have to depend on the package.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final YgMobileScannerContainerTheme mobileScannerContainerTheme = context.mobileScannerContainerTheme;

    return Container(
      width: mobileScannerContainerTheme.width,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: mobileScannerContainerTheme.borderRadius,
      ),
      child: AspectRatio(
        aspectRatio: 1.0,
        child: child,
      ),
    );
  }
}
