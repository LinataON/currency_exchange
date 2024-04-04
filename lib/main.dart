import 'package:flutter/material.dart';
import 'package:currency_exchange/exchange_page.dart';
import 'package:currency_exchange/exchange_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Exchange App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExchangePage(),
    );
  }
}
