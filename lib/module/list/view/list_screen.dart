import 'package:flutter/material.dart';
import '../../../repositories/coins/coins_repository.dart';
import '../../../repositories/coins/models/coin_model.dart';
import '../widgets/widgets.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<CoinModel>? coinsList;

  @override
  void initState() {
    loadCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyMoneyList'),
        centerTitle: true,
      ),
      body: (coinsList == null)
          ? const Center(child: CircularProgressIndicator()):
      ListView.separated(
        padding: const EdgeInsets.only(top: 16),
        itemCount: coinsList!.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, i) {
          final coin = coinsList![i];
          return CoinTile(coin : coin);
        },
      ),
    );
  }
  Future<void> loadCoins() async {
    coinsList = await CoinsRepository().getCoinsList();
    setState(() {});
  }

}


