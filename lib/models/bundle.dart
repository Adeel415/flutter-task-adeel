class Bundle {
  final String id;
  final double dataGB;
  final int validDays;
  final double priceUSD;
  final bool isUnlimited;

  const Bundle({
    required this.id,
    required this.dataGB,
    required this.validDays,
    required this.priceUSD,
    this.isUnlimited = false,
  });

  String get dataLabel => isUnlimited ? 'Unlimited' : '${dataGB % 1 == 0 ? dataGB.toInt() : dataGB} GB';
  String get validLabel => 'Valid for:\n$validDays days';
  String get priceLabel => 'USD ${priceUSD.toStringAsFixed(2)}';
}