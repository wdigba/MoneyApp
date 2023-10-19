import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../repositories/coins/abstract_coins_repository.dart';
import '../../../repositories/coins/models/coin_model.dart';
import '../bloc/coin_details_bloc.dart';

@RoutePage()

class CoinScreen extends StatefulWidget {
  const CoinScreen({
    super.key,
    required this.coin,
  });

  final CoinModel coin;

  @override
  State<CoinScreen> createState() => _CoinScreenState();
}

class _CoinScreenState extends State<CoinScreen> {
  //CoinModel? coin;

  final _coinDetailsBloc = CoinDetailsBloc(
    GetIt.I<AbstractCoinsRepository>(),
  );

  @override
  void initState() {
    _coinDetailsBloc.add(LoadCoinDetails(currencyCode: widget.coin.name));
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   final args = ModalRoute.of(context)?.settings.arguments;
  //   assert(args != null && args is CryptoCoin, 'You must provide String args');
  //   coin = args as CryptoCoin;
  //   _coinDetailsBloc.add(LoadCryptoCoinDetails(currencyCode: coin!.name));
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CoinDetailsBloc, CoinDetailsState>(
        bloc: _coinDetailsBloc,
        builder: (context, state) {
          if (state is CoinDetailsLoaded) {
            final coin = state.coin;
            final coinDetails = coin.details;
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 160,
                    width: 160,
                    child: Image.network(coinDetails.fullImageUrl),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    coin.name,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    child: Center(
                      child: Text(
                        '${coinDetails.priceInUSD} \$',
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Column(
                      children: [
                        _DataRow(
                          title: 'High 24 Hour',
                          value: '${coinDetails.high24Hour} \$',
                        ),
                        const SizedBox(height: 6),
                        _DataRow(
                          title: 'Low 24 Hour',
                          value: '${coinDetails.low24Hour} \$',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class _DataRow extends StatelessWidget {
  const _DataRow({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 140, child: Text(title)),
        const SizedBox(width: 32),
        Flexible(
          child: Text(value),
        ),
      ],
    );
  }
}
/*import 'dart:developer';
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
}*/