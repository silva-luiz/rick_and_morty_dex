extension StringExtensions on String {
  String get possessiveForm {
    if (isEmpty) return this;

    final lowerCaseName = toLowerCase();
    final lastChar = lowerCaseName.codeUnitAt(length - 1);

    if (lastChar == 's'.codeUnitAt(0) ||
        lastChar == 'x'.codeUnitAt(0) ||
        lastChar == 'z'.codeUnitAt(0)) {
      return "$this'";
    }

    return "$this's";
  }
}
