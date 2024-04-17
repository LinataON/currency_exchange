import 'package:flutter/material.dart';

import 'exchange_page.dart';
import 'exchange_service.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final ApiService apiService = ApiService('fca_live_MobjuZgBTeC1cHjJVPPN6P8uUhxMteATlanHs2iQ');
  //http://api.freecurrencyapi.com/v1/latest?apikey=fca_live_MobjuZgBTeC1cHjJVPPN6P8uUhxMteATlanHs2iQ
  @override
  Widget build(BuildContext context) {
    return CurrencyConverter(apiService: apiService);
  }
}
