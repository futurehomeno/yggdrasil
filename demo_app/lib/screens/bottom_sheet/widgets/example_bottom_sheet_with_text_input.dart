import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class ExampleBottomSheetWithTextInput extends YgBottomSheetModalRoute {
  @override
  String get name => 'ExampleBottomSheetWithTextInput';

  @override
  YgBottomSheet buildBottomSheet(BuildContext context) {
    return const YgBottomSheet(
      title: 'Example Bottom Sheet',
      content: YgSection(
        child: YgTextField(
          label: 'Example text field',
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          autocorrect: false,
          textCapitalization: TextCapitalization.sentences,
        ),
      ),
    );
  }
}
