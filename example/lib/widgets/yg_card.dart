import 'package:flutter/material.dart';

/// Card to contain a set of components.
///
///! --- IMPORTANT ---
/// This is only temporary until we have can
/// use the actual yggdrasil card to split up
/// components.
class YgCard extends StatelessWidget {
  const YgCard({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8.0),
            child,
          ],
        ),
      ),
    );
  }
}
