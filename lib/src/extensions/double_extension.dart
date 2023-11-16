extension DoubleExtension on double {
  int get precision {
    final String string = (this % 1).toString();

    if (string.length == 3 && string[2] == '0') {
      return 0;
    }

    return string.length - 2;
  }
}
