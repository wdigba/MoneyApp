import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../module/list/list.dart';
import '../module/single_coin/single_coin.dart';
import '../repositories/coins/models/coin_model.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: ListRoute.page, path: '/'),
    AutoRoute(page: CoinRoute.page),
    /// routes go here
  ];
}
