import 'package:flutter/material.dart';

import '../model/country.dart';

class CountryCard extends StatelessWidget {
  CountryCard({Key key, @required this.country}) : super(key: key);

  final Country country;

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

  Widget _countryStats(Country country) {
    int totalCases =
        (country.active + country.recovered + country.deaths).toInt();
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
              _statWidget('Active', country.active.toInt(),
                  color: Colors.red[600]),
              _statWidget('Recovered', country.recovered.toInt(),
                  color: Colors.green[600]),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              _statWidget('Deaths', country.deaths.toInt()),
              _statWidget('Total/Million', country.casesPerOneMillion.toInt(),
                  color: Colors.blue[600]),
            ],
          ),
        ),
      ],
    );
  }

  Widget _getFlag(Country c) {
    Widget w;
    try {
      w = Image.network(country.countryInfo.flag, width: 36, height: 24,);
    } catch (e) {
      w = Text('');
    }
    return w;
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
                    child: _getFlag(country),
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
