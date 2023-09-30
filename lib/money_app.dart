import 'package:flutter/material.dart';
import 'package:my_app/router/router.dart';
import 'package:my_app/theme/theme.dart';

class MoneyApp extends StatelessWidget {
  const MoneyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyMoneyList',
      theme: darkTheme,
      routes: routes,
    );
  }
}