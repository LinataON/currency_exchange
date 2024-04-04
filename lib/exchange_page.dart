import 'package:flutter/material.dart';
import 'package:currency_exchange/exchange_service.dart';

class ExchangePage extends StatefulWidget {
  @override
  _ExchangePageState createState() => _ExchangePageState();
}
/*
class _ExchangePageState extends State<ExchangePage> {
  double _exchangeRate = 0.0;
  bool _isEurToUsd = true;

  void _refreshExchangeRate() async {
    double rate = await ExchangeService.fetchExchangeRate(_isEurToUsd);
    setState(() {
      _exchangeRate = rate;
    });
  }

  void _toggleExchangeDirection() {
    setState(() {
      _isEurToUsd = !_isEurToUsd;
    });
    _refreshExchangeRate();
  }

  @override
  void initState() {
    super.initState();
    _refreshExchangeRate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Exchange App'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _refreshExchangeRate,
          ),
          IconButton(
            icon: Icon(Icons.swap_horiz),
            onPressed: _toggleExchangeDirection,
          ),
        ],
      ),
      body: Center(
        child: Text(
          '1 ${_isEurToUsd ? 'EUR' : 'USD'} = ${_exchangeRate.toStringAsFixed(2)} ${_isEurToUsd ? 'USD' : 'EUR'}',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
*/
class _ExchangePageState extends State<ExchangePage> {
  double _exchangeRate = 0.0;
  bool _isEurToUsd = true;

  void _refreshExchangeRate() async {
    double rate = await ExchangeService.fetchExchangeRate(_isEurToUsd);
    setState(() {
      _exchangeRate = rate;
    });
  }

  void _toggleExchangeDirection() {
    setState(() {
      _isEurToUsd = !_isEurToUsd;
    });
    _refreshExchangeRate();
  }

  @override
  void initState() {
    super.initState();
    _refreshExchangeRate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Exchange App'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _refreshExchangeRate,
          ),
          IconButton(
            icon: Icon(Icons.swap_horiz),
            onPressed: _toggleExchangeDirection,
          ),
        ],
      ),
      body: Center(
        child: _exchangeRate == 0.0
            ? CircularProgressIndicator() // Show loading indicator while fetching rate
            : Text(
          '1 ${_isEurToUsd ? 'EUR' : 'USD'} = ${_exchangeRate.toStringAsFixed(2)} ${_isEurToUsd ? 'USD' : 'EUR'}',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

