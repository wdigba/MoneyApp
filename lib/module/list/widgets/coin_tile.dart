import 'package:flutter/material.dart';
import '../../../repositories/coins/models/coin_model.dart';

class CoinTile extends StatelessWidget {
  const CoinTile ({
    Key? key,
    required this.coin,
  }) : super(key: key);

  final CoinModel coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final coinDetails = coin.details;
    return ListTile(
      leading: Image.network(coinDetails.imageUrl),
      title: Text(
        coin.name,
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text(
        '${coinDetails.priceInUSD} \$',
        style: theme.textTheme.labelSmall,
      ),
      trailing: const Icon(
          Icons.arrow_forward_ios
      ),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/coin',
          arguments: coin,
        );
      },
    );
  }

}

