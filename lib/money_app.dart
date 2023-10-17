import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/router/router.dart';
import 'package:my_app/theme/theme.dart';
import 'package:talker_flutter/talker_flutter.dart';

class MoneyApp extends StatelessWidget {
  const MoneyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyMoneyList',
      theme: darkTheme,
      routes: routes,
      navigatorObservers: [
        TalkerRouteObserver(GetIt.I<Talker>()),
      ],
    );
  }
}