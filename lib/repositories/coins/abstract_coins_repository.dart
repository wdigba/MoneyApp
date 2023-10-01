import 'models/coin_model.dart';

abstract class AbstractCoinsRepository {
  Future<List<CoinModel>> getCoinsList();
}