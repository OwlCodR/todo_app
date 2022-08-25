enum Importance {
  important('important'),
  basic('basic'),
  low('low');

  const Importance(this.string);
  final String string;

  static Importance fromString(String s) {
    if (Importance.important.string == s) return Importance.important;
    if (Importance.low.string == s) return Importance.low;
    return Importance.basic;
  }
}
