// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinDetail _$CoinDetailFromJson(Map<String, dynamic> json) => CoinDetail(
      priceInUSD: (json['PRICE'] as num).toDouble(),
      imageUrl: json['IMAGEURL'] as String,
      toSymbol: json['TOSYMBOL'] as String,
      lastUpdate: CoinDetail._dateTimeFromJson(json['LASTUPDATE'] as int),
      high24Hour: (json['HIGH24HOUR'] as num).toDouble(),
      low24Hour: (json['LOW24HOUR'] as num).toDouble(),
    );

Map<String, dynamic> _$CoinDetailToJson(CoinDetail instance) =>
    <String, dynamic>{
      'PRICE': instance.priceInUSD,
      'IMAGEURL': instance.imageUrl,
      'TOSYMBOL': instance.toSymbol,
      'LASTUPDATE': CoinDetail._dateTimeToJson(instance.lastUpdate),
      'HIGH24HOUR': instance.high24Hour,
      'LOW24HOUR': instance.low24Hour,
    };
