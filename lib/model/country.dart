import 'package:meta/meta.dart';

class Country {
  Country({
    @required this.name,
    @required this.code,
    this.deaths = 0,
    this.active = 0,
    this.recovered = 0,
    this.ranking = 999,
    this.casesToday = 0,
    this.deathsToday = 0,
    this.casesPerMillion = 0,
  });

  final String name;
  final String code;
  final int deaths;
  final int active;
  final int recovered;
  final int ranking;
  final int casesToday;
  final int deathsToday;
  final int casesPerMillion;
}
