import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/repositories/coins/coins.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'models/coin_detail.dart';


class CoinsRepository implements AbstractCoinsRepository {
  CoinsRepository ({
    required this.dio,
    required this.coinsBox,
  });
  final Dio dio;
  final Box<CoinModel> coinsBox;

  @override
  Future<List<CoinModel>> getCoinsList() async {
    var dataList = <CoinModel>[];
    try {
      final dataList = await fetchCoinsListFromApi();
      final coinsMap = {for (var e in dataList) e.name:e};
      await coinsBox.putAll(coinsMap);
    }
    catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      dataList = coinsBox.values.toList();
    }
    dataList.sort((a,b) =>  b.details.priceInUSD.compareTo(a.details.priceInUSD));
    return dataList;
  }

  Future<List<CoinModel>> fetchCoinsListFromApi() async {
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
    try {
      final coin = await fetchCoinDetailsFromApi(currencyCode);
      coinsBox.put(currencyCode, coin);
      return coin;
    }
    catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      return coinsBox.get(currencyCode)!;
    }
  }

  Future<CoinModel> fetchCoinDetailsFromApi(String currencyCode) async {
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