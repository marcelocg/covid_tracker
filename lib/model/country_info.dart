import 'package:json_annotation/json_annotation.dart';

part 'country_info.g.dart';

@JsonSerializable(explicitToJson: true)
class CountryInfo {
  CountryInfo(
      this.id,
      this.code,
      this.lat,
      this.long,
      this.flag,
  );

  @JsonKey(name: '_id')
  int id;
  @JsonKey(name: 'iso2')
  String code;
  @JsonKey(defaultValue: 0)
  double lat;
  @JsonKey(defaultValue: 0)
  double long;
  @JsonKey()
  String flag;
  @JsonKey(ignore: true, defaultValue: '')
  String iso3;

  factory CountryInfo.fromJson(Map<String, dynamic> json) =>_$CountryInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CountryInfoToJson(this);
}
