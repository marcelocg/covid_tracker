import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COVID-19 Data Tracker',
      theme: ThemeData(
        primarySwatch: Colors.red[900],
      ),
      home: Text('COVID-19 Data Tracker Home Page'),
    );
  }
}
