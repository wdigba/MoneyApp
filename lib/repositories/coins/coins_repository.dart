import 'package:dio/dio.dart';
import 'package:my_app/repositories/coins/coins.dart';

import 'models/coin_detail.dart';


class CoinsRepository implements AbstractCoinsRepository {
  CoinsRepository ({
    required this.dio,
  });
  final Dio dio;

  @override
  Future<List<CoinModel>> getCoinsList() async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,BSV,DOG,AAC,DOV,CAG&tsyms=USD');
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final dataList = dataRaw.entries
        .map((e) {
          final usdData = (e.value as Map<String, dynamic>) ['USD'] as Map<String, dynamic>;
          final details = CoinDetail.fromJson(usdData);
          return CoinModel(
            name: e.key,
            details: details,
          );})
        .toList();
    return dataList;
  }
  @override
  Future<CoinModel> getCoinDetails(String currencyCode) async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$currencyCode&tsyms=USD');
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final coinData = dataRaw[currencyCode] as Map<String, dynamic>;
    final usdData = coinData['USD'] as Map<String, dynamic>;
    final details = CoinDetail.fromJson(usdData);

    return CoinModel(
      name: currencyCode,
      details: details,
    );
  }
}