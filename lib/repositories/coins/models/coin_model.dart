import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_app/repositories/coins/models/coin_detail.dart';

part 'coin_model.g.dart';

@HiveType(typeId: 2)

class CoinModel extends Equatable{
  const CoinModel({
    required this.name,
    required this.details,
    required this.imageUrl,
  });

  @HiveField(0)
  final String name;
  @HiveField(1)
  final CoinDetail details;
  @HiveField(2)
  final String imageUrl;

  @override
  List<Object> get props => [name, details, imageUrl];
}