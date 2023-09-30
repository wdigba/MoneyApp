import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CoinTile extends StatelessWidget {
  const CoinTile ({Key? key,
    required this.coinName,
  }) : super(key: key);

  final String coinName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: SvgPicture.asset(
        'assets/svg/bitcoin-btc-logo.svg',
        height: 30,
        width: 30,
      ),
      title: Text(
        coinName,
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text(
        '500\$',
        style: theme.textTheme.labelSmall,
      ),
      trailing: const Icon(
          Icons.arrow_forward_ios
      ),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/coin',
          arguments: coinName ,
        );
      },
    );
  }

}

