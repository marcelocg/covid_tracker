import 'package:flag/flag.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COVID-19 Data Tracker',
      theme: ThemeData(primaryColor: Colors.red[800]),
      home: CountriesGridList(),
    );
  }
}

class CountriesGridList extends StatelessWidget {
//  const CountriesGridList({Key key}) : super(key: key);

  final List<_Country> _countries = [
    _Country(
      name: 'Brazil',
      code: 'BR',
      deaths: 17,
      active: 155,
      ranking: 17,
      recovered: 1555,
    ),
    _Country(
      name: 'Portugal',
      code: 'PT',
      deaths: 15,
      active: 155,
      ranking: 15,
      recovered: 1555,
    ),
    _Country(
      name: 'Italy',
      code: 'IT',
      deaths: 2,
      active: 155,
      ranking: 2,
      recovered: 1555,
    ),
    _Country(
      name: 'Spain',
      code: 'ES',
      deaths: 3,
      active: 155,
      ranking: 3,
      recovered: 1555,
    ),
    _Country(
      name: 'United States of America',
      code: 'US',
      deaths: 1,
      active: 155,
      ranking: 1,
      recovered: 1555,
    ),
    _Country(
      name: 'Germany',
      code: 'DE',
      deaths: 5,
      active: 155,
      ranking: 5,
      recovered: 1555,
    ),
    _Country(
      name: 'Japan',
      code: 'JP',
      deaths: 7,
      active: 155,
      ranking: 7,
      recovered: 1555,
    ),
    _Country(
      name: 'Estonia',
      code: 'EE',
      deaths: 23,
      active: 155,
      ranking: 23,
      recovered: 1555,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('Covid-19 Data Tracker'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(10.0),
        childAspectRatio: 16.0 / 15.0,
        children: _countries.map<Widget>((country) {
          return _CountryCard(country: country);
        }).toList(),
      ),
    );
  }
}

class _Country {
  _Country({
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

class _CountryCard extends StatelessWidget {
  _CountryCard({Key key, @required this.country}) : super(key: key);

  final _Country country;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          _countryCardTop(),
          Divider(),
          _countryStats(country),
        ],
      ),
    );
  }

  Widget _statWidget(String statLabel, int statValue,
      {Color color = Colors.black}) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Text(
            statLabel,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(statValue.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }

  Widget _countryStats(_Country country) {
    int totalCases = country.active + country.recovered + country.deaths;
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                'Total Cases: ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                totalCases.toString(),
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[800]),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              _statWidget('Active', country.active, color: Colors.red[600]),
              _statWidget('Recovered', country.recovered,
                  color: Colors.green[600]),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              _statWidget('Deaths', country.deaths),
              _statWidget('Total/Million', country.casesPerMillion,
                  color: Colors.blue[600]),
            ],
          ),
        ),
      ],
    );
  }

  Widget _countryCardTop() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: Flags.getMiniFlag(country.code, 24, null),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        country.name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10, top: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '# ' + country.ranking.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
