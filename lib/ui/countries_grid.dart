import 'package:flutter/material.dart';

import '../model/country.dart';
import 'country_card.dart';

class CountriesGridList extends StatelessWidget {
  final List<Country> countries;

  CountriesGridList({Key key, this.countries}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(10.0),
      childAspectRatio: 16.0 / 15.0,
      children: countries.map<Widget>((country) {
        return CountryCard(country: country);
      }).toList(),
    );
  }
}
