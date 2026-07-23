extension NumPokemonMeasurement on num {
  String formatWeight() {
    final value = this / 10;
    return '${value.toStringAsFixed(1).replaceAll('.', ',')} kg';
  }

  String formatHeight() {
    final value = this / 10;
    return '${value.toStringAsFixed(1).replaceAll('.', ',')} m';
  }
}
