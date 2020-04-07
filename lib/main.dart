import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'model/country.dart';
import 'util/parsers.dart';
import 'ui/countries_grid.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    final appTitle = 'COVID-19 Data Tracker';

    return MaterialApp(
      title: appTitle,
      theme: ThemeData(primaryColor: Colors.red[800]),
      home: CovidTrackerHomePage(
        title: appTitle,
      ),
    );
  }
}

class CovidTrackerHomePage extends StatefulWidget {
  final String title;

  CovidTrackerHomePage({Key key, this.title}) : super(key: key);

  @override
  _CovidTrackerHomePageState createState() => _CovidTrackerHomePageState();
}

class _CovidTrackerHomePageState extends State<CovidTrackerHomePage> {
  Future<List<Country>> futureCountries;

  @override
  void initState() {
    super.initState();
    futureCountries = _fetchCountries(http.Client());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Country>>(
        future: futureCountries,
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? CountriesGridList(countries: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Future<List<Country>> _fetchCountries(http.Client client) async {
    final response =
        await client.get('https://corona.lmao.ninja/countries/?sort=cases');
    return compute(parseCountries, response.body);
  }
}
