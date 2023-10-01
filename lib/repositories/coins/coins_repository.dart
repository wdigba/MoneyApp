import 'package:dio/dio.dart';
import 'models/coin_model.dart';

class CoinsRepository {
  Future<List<CoinModel>> getCoinsList() async {
    final response = await Dio().get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,BSV,DOG,AAC,DOV,CAG&tsyms=USD');
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final dataList = dataRaw.entries
        .map((e) {
          final usdData = (e.value as Map<String, dynamic>) ['USD'] as Map<String, dynamic>;
          final price = usdData['PRICE'];
          final imageUrl = usdData['IMAGEURL'];
          return CoinModel(
            name: e.key,
            priceInUSD: price,
            imageUrl: 'https://www.cryptocompare.com/$imageUrl',
          );})
        .toList();
    return dataList;
  }
}