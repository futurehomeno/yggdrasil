import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgErrorView extends StatelessWidget {
  const YgErrorView({
    super.key,
    this.error,
    this.onRetry,
  });

  final String? error;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final String? error = this.error;
    final VoidCallback? onRetry = this.onRetry;

    return YgLayoutBody(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const YgIcon.colorable(
            YgIcons.error,
            size: YgIconSize.large,
            color: Colors.red,
          ),
          const SizedBox(height: 20),
          const Text('An error occurred'),
          if (error != null) Text(error),
          const SizedBox(height: 20),
          if (onRetry != null)
            YgButton(
              onPressed: onRetry,
              child: const Text('Retry'),
            ),
        ],
      ),
    );
  }
}
