import 'package:yggdrasil/yggdrasil.dart';

class PickerExampleHelpers {
  static List<YgPickerEntry<int>> createEntries(int amount, [int offset = 1]) {
    final List<YgPickerEntry<int>> entries = <YgPickerEntry<int>>[];

    for (int i = 0; i < amount; i++) {
      entries.add(YgPickerEntry<int>(
        title: (i + offset).toString(),
        value: i,
      ));
    }

    return entries;
  }
}
