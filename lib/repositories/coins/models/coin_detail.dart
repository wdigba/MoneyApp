import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coin_detail.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()

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

  @HiveField(3)
  @JsonKey(name: 'LASTUPDATE',
      toJson: _dateTimeToJson,
      fromJson: _dateTimeFromJson,
  )
  final DateTime lastUpdate;

  @HiveField(4)
  @JsonKey(name: 'HIGH24HOUR')
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