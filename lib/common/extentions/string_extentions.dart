extension StringExtentions on String {
  String addSeparator({int? qty = 3, String? separator = " "}) {
    assert(qty! >= 1, "[qty] value as the number separator must be positive!");
    assert(separator! != "",
        "[separator] value as the number separator must not be empty!");

    String tempNum = this;
    String sign = "";
    String decimal = "";

    if (RegExp(r'^[-+]?[0-9](\d+\.?\d*|\.\d+)').hasMatch(this)) {
      if (this[0] == "+" || this[0] == "-") {
        sign = this[0];
        tempNum = substring(1);
      }
      if (tempNum.contains(".")) {
        decimal = ".${tempNum.split(".")[1]}";
        tempNum = tempNum.split(".")[0];
      }
    }

    return sign +
        (tempNum
            .split('')
            .reversed
            .join()
            .replaceAllMapped(
                RegExp(r'(.{})(?!$)'.replaceAll('''{}''', '''{$qty}''')),
                (m) => '${m[0]}$separator')
            .split('')
            .reversed
            .join()) +
        decimal;
  }
}
