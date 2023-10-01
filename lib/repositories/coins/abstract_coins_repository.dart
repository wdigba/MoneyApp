import 'package:my_app/repositories/coins/models/coin_detail.dart';

import 'models/coin_model.dart';

abstract class AbstractCoinsRepository {
  Future<List<CoinModel>> getCoinsList();
  Future<CoinDetail> getCoinDetails(String currencyCode);
}