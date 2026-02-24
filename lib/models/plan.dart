class Plan {
  final String id;
  final String name;
  final String dataLabel;
  final String validLabel;
  final int supportedCountries;
  final double priceUSD;

  const Plan({
    required this.id,
    required this.name,
    required this.dataLabel,
    required this.validLabel,
    required this.supportedCountries,
    required this.priceUSD,
  });

  String get priceFormatted => 'USD ${priceUSD.toStringAsFixed(2)}';
}