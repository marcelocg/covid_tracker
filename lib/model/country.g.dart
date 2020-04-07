// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['country']);
  return Country(
    json['country'] as String,
    json['countryInfo'] == null
        ? null
        : CountryInfo.fromJson(json['countryInfo'] as Map<String, dynamic>),
    (json['deaths'] as num)?.toDouble() ?? 0,
    (json['active'] as num)?.toDouble() ?? 0,
    (json['recovered'] as num)?.toDouble() ?? 0,
    (json['todayCases'] as num)?.toDouble() ?? 0,
    (json['todayDeaths'] as num)?.toDouble() ?? 0,
    (json['casesPerOneMillion'] as num)?.toDouble() ?? 0,
  );
}

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'country': instance.name,
      'countryInfo': instance.countryInfo?.toJson(),
      'deaths': instance.deaths,
      'active': instance.active,
      'recovered': instance.recovered,
      'todayCases': instance.todayCases,
      'todayDeaths': instance.todayDeaths,
      'casesPerOneMillion': instance.casesPerOneMillion,
    };
