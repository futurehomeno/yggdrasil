import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

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
      footerButtons: <YgButton>[
        YgButton(
          variant: ButtonVariant.primary,
          onPressed: () {},
          child: const Text('Primary button'),
        ),
        YgButton(
          variant: ButtonVariant.secondary,
          onPressed: () {},
          child: const Text('Secondary button'),
        ),
      ],
    );
  }
}
