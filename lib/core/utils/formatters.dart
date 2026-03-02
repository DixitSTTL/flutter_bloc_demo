
class Formatters {
  static String formatMarketCap(String? value) {
    final number = double.tryParse(value ?? '') ?? 0;

    if (number >= 1e12) {
      return _formatCompact(number / 1e12, "T");
    } else if (number >= 1e9) {
      return _formatCompact(number / 1e9, "B");
    } else if (number >= 1e6) {
      return _formatCompact(number / 1e6, "M");
    } else if (number >= 1e3) {
      return _formatCompact(number / 1e3, "K");
    } else {
      return "\$${number.toStringAsFixed(2)}";
    }
  }

  static String _formatCompact(double number, String suffix) {
    final formatted = number.toStringAsFixed(2);
    return formatted.endsWith('.00')
        ? "\$${formatted.replaceAll('.00', '')}$suffix"
        : "\$$formatted$suffix";
  }
}