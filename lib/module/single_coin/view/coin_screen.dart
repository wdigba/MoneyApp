import 'dart:developer';
import 'package:flutter/material.dart';

class CoinScreen extends StatefulWidget {
  const CoinScreen({super.key});

  @override
  State<CoinScreen> createState() => CoinScreenState();
}

class CoinScreenState extends State<CoinScreen> {
  String? coinName;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    if(args == null) {
      log('you must provide args');
      return;
    }
    if(args is! String) {
      log('you must provide String args');
      return;
    }
    coinName = args;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(coinName ??  '...'),
        centerTitle: true,
      ),
    );
  }
}