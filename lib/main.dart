import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_app/repositories/coins/coins.dart';
import 'package:my_app/repositories/coins/models/coin_detail.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'money_app.dart';
import 'package:dio/dio.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);
  GetIt.I<Talker>().debug('Talker started');
  const coinsBoxName = 'coins_box';
  await Hive.initFlutter();

  Hive.registerAdapter(CoinModelAdapter());
  Hive.registerAdapter(CoinDetailAdapter());

  final coinsBox = await Hive.openBox<CoinModel>(coinsBoxName);

  final dio = Dio();
  dio.interceptors.add(
      TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(
        printResponseData: false,
      )
  )
  );

  Bloc.observer = TalkerBlocObserver(
      talker: talker,
    settings: const TalkerBlocLoggerSettings(
      printStateFullData: false,
      printEventFullData: false,
    )
  );

  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
          () => CoinsRepository(dio: dio, coinsBox: coinsBox));

  FlutterError.onError =
      (details) => GetIt.I<Talker>().handle(details.exception, details.stack);

  runZonedGuarded(() => runApp(const MoneyApp()),
        (e, st) => GetIt.I<Talker>().handle(e, st),
  );
}



