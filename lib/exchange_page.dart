import 'package:flutter/material.dart';
import 'package:currency_exchange/exchange_service.dart';



class CurrencyConverter extends StatefulWidget {
  final ApiService apiService;

  CurrencyConverter({required this.apiService});

  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  double _eurToUsd = 0.0;
  bool _isEurToUsd = true;

  void _fetchExchangeRate() async {
    final rate = await widget.apiService.fetchExchangeRate();
    setState(() {
      _eurToUsd = rate;
    });
  }



  void _toggleDirection() async {
    setState(() {
      _isEurToUsd = !_isEurToUsd;
    });


    _fetchExchangeRate();
  }


  String _getConversionText() {
    if (_isEurToUsd) {
      if (_eurToUsd != 0) {
        return '1 EUR = $_eurToUsd USD';
      } else {
        return 'Loading...';
      }
    } else {
      if (_eurToUsd != 0) {
        return '1 USD = ${(1 / _eurToUsd).toStringAsFixed(2)} EUR';
      } else {
        return 'Loading...';
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchExchangeRate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Converter'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _fetchExchangeRate,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _getConversionText(),
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _toggleDirection,
              child: Text(_isEurToUsd ? 'Switch to USD to EUR' : 'Switch to EUR to USD'),
            ),
          ],
        ),
      ),
    );
  }
}




