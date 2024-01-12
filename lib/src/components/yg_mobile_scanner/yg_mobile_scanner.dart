import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

class YgMobileScanner extends StatelessWidget {
  const YgMobileScanner({
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
    final YgMobileScannerTheme mobileScannerTheme = context.mobileScannerTheme;

    return Container(
      height: mobileScannerTheme.size.height,
      width: mobileScannerTheme.size.width,
      decoration: BoxDecoration(
        borderRadius: mobileScannerTheme.borderRadius,
      ),
      child: child,
    );
  }
}
