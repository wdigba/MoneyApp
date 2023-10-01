import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/repositories/coins/coins.dart';
import 'money_app.dart';
import 'package:dio/dio.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
          () => CoinsRepository(dio: Dio()));
  runApp(const MoneyApp());
}



