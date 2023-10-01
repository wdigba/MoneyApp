class CoinModel {
  const CoinModel({
    required this.name,
    required this.priceInUSD,
    required this.imageUrl,
  });

  final String name;
  final double priceInUSD;
  final String imageUrl;
}