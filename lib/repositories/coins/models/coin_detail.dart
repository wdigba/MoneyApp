import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coin_detail.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()

import 'coin_model.dart';

class CoinDetail extends Equatable{
  const CoinDetail({
    required this.priceInUSD,
    required this.imageUrl,
    required this.toSymbol,
    required this.lastUpdate,
    required this.high24Hour,
    required this.low24Hour,
  });

  @HiveField(0)
  @JsonKey(name: 'PRICE')
  final double priceInUSD;

  @HiveField(1)
  @JsonKey(name: 'IMAGEURL')
  final String imageUrl;

  String get fullImageUrl => 'https://www.cryptocompare.com/$imageUrl/';

  @HiveField(2)
  @JsonKey(name: 'TOSYMBOL')
  final String toSymbol;
  final DateTime lastUpdate;
  final double high24Hour;

  @HiveField(5)
  @JsonKey(name: 'LOW24HOUR')
  final double low24Hour;

  factory CoinDetail.fromJson(Map<String, dynamic> json) => _$CoinDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CoinDetailToJson(this);

  static int _dateTimeToJson(DateTime time) => time.millisecondsSinceEpoch;
  static DateTime _dateTimeFromJson(int millisec) => DateTime.fromMillisecondsSinceEpoch(millisec);

  @override
  List<Object?> get props => [priceInUSD, imageUrl, toSymbol, lastUpdate, high24Hour, low24Hour];
}