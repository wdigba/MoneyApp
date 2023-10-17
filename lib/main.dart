import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/repositories/coins/coins.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'money_app.dart';
import 'package:dio/dio.dart';

void main() {
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);
  GetIt.I<Talker>().debug('Talker started');

  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
          () => CoinsRepository(dio: Dio()));

  FlutterError.onError =
      (details) => GetIt.I<Talker>().handle(details.exception, details.stack);

  runZonedGuarded(() => runApp(const MoneyApp()),
        (e, st) => GetIt.I<Talker>().handle(e, st),
  );
}



