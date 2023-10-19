import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/router/router.dart';
import 'package:my_app/theme/theme.dart';
import 'package:talker_flutter/talker_flutter.dart';

class MoneyApp extends StatefulWidget {
  const MoneyApp({super.key});

  @override
  State<MoneyApp> createState() => MoneyAppState();
}

class MoneyAppState extends State<MoneyApp> {
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'MyMoneyList',
      theme: darkTheme,
      routerConfig: appRouter.config(
        navigatorObservers: () => [
        TalkerRouteObserver(GetIt.I<Talker>()),
      ],
      ),
    );
  }
}