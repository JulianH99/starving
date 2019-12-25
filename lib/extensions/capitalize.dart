extension CapitalizeString on String {
  String capitalize() {
    if (this.length == 1) {
      return this.toUpperCase();
    }
    final firstLetter = this[0].toUpperCase();
    final restLetters = this.substring(1);

    return "$firstLetter$restLetters";
  }
}
