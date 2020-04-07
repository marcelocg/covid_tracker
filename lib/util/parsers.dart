import 'dart:convert';

import '../model/country.dart';

List<Country> parseCountries(String responseBody) {
  List countriesArray = jsonDecode(responseBody);

  List<Country> countries = countriesArray
      .asMap()
      .map((index, c) =>
          MapEntry(index, Country.fromJson(c).setRanking(index + 1)))
      .values
      .toList();

  return countries;
}
