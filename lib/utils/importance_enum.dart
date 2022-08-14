enum Importance {
  important('important'),
  basic('basic'),
  low('low');

  const Importance(this.value);
  final String value;

  static Importance fromString(String s) {
    if (Importance.important.value == s) return Importance.important;
    if (Importance.low.value == s) return Importance.low;
    return Importance.basic;
  }
}
