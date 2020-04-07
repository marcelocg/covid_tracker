import 'package:covid_tracker/model/country_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

@JsonSerializable(explicitToJson: true)
class Country {
  Country(
    this.name,
    this.countryInfo,
    this.deaths,
    this.active,
    this.recovered,
    this.todayCases,
    this.todayDeaths,
    this.casesPerOneMillion,
  );

  @JsonKey(name: 'country', required: true)
  String name;
  CountryInfo countryInfo;
  @JsonKey(defaultValue: 0)
  double deaths;
  @JsonKey(defaultValue: 0)
  double active;
  @JsonKey(defaultValue: 0)
  double recovered;
  @JsonKey(defaultValue: 0)
  double todayCases;
  @JsonKey(defaultValue: 0)
  double todayDeaths;
  @JsonKey(defaultValue: 0)
  double casesPerOneMillion;
  @JsonKey(ignore: true, defaultValue: '')
  String code;
  @JsonKey(ignore: true, defaultValue: 0)
  int ranking;

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);

  Country setRanking(int ranking) {
    this.ranking = ranking;
    return this;
  }
}
