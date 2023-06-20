import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class ExampleBottomSheet extends YgBottomSheetModalRoute {
  @override
  YgBottomSheet buildBottomSheet(BuildContext context) {
    return YgBottomSheet.withFooter(
      title: 'Example Bottom Sheet',
      content: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Center(
            child: Text('Example content'),
          ),
        ),
      ),
      footerButtonsAxis: Axis.vertical,
      footerButtons: <YgButton>[
        YgButton(
          variant: ButtonVariant.primary,
          onPressed: () {},
          child: const Text('Button'),
        ),
      ],
    );
  }
}
