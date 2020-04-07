// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryInfo _$CountryInfoFromJson(Map<String, dynamic> json) {
  return CountryInfo(
    json['_id'] as int,
    json['iso2'] as String,
    (json['lat'] as num)?.toDouble() ?? 0,
    (json['long'] as num)?.toDouble() ?? 0,
    json['flag'] as String,
  );
}

Map<String, dynamic> _$CountryInfoToJson(CountryInfo instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'iso2': instance.code,
      'lat': instance.lat,
      'long': instance.long,
      'flag': instance.flag,
    };
