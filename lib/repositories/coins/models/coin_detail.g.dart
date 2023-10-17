// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_detail.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CoinDetailAdapter extends TypeAdapter<CoinDetail> {
  @override
  final int typeId = 1;

  @override
  CoinDetail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CoinDetail(
      priceInUSD: fields[0] as double,
      imageUrl: fields[1] as String,
      toSymbol: fields[2] as String,
      lastUpdate: fields[3] as DateTime,
      high24Hour: fields[4] as double,
      low24Hour: fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, CoinDetail obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.priceInUSD)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(2)
      ..write(obj.toSymbol)
      ..writeByte(3)
      ..write(obj.lastUpdate)
      ..writeByte(4)
      ..write(obj.high24Hour)
      ..writeByte(5)
      ..write(obj.low24Hour);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoinDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
