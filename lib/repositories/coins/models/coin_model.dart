import 'package:equatable/equatable.dart';
import 'package:my_app/repositories/coins/models/coin_detail.dart';

class CoinModel extends Equatable{
  const CoinModel({
    required this.name,
    required this.details,
  });

  final String name;
  final CoinDetail details;

  @override
  List<Object> get props => [name, details];
}