import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/_components.dart';

class ExampleScrollableBottomSheet extends YgBottomSheetModalRoute {
  @override
  YgBottomSheet buildBottomSheet(BuildContext context) {
    return YgBottomSheet(
      title: 'Scrollable Bottom Sheet',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: List<Widget>.generate(
          25,
          (int index) => ListTile(
            title: Text('List item ${index + 1}'),
          ),
        ),
      ),
      footer: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          YgButton(
            variant: ButtonVariant.primary,
            onPressed: () {},
            child: const Text('Primary button'),
          ),
          const SizedBox(
            height: 15,
          ),
          YgButton(
            variant: ButtonVariant.secondary,
            onPressed: () {},
            child: const Text('Secondary button'),
          ),
        ],
      ),
    );
  }
}
