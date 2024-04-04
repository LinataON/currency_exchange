import 'dart:convert';
import 'package:http/http.dart' as http;

class ExchangeService {
  static const String _apiKey = 'fca_live_MobjuZgBTeC1cHjJVPPN6P8uUhxMteATlanHs2iQ';
  static const String _baseUrl = 'https://api.freecurrencyapi.com/api/v1/latest';

  static Future<double> fetchExchangeRate(bool isEurToUsd) async {
    final fromCurrency = isEurToUsd ? 'EUR' : 'USD';
    final toCurrency = isEurToUsd ? 'USD' : 'EUR';

    //final response = await http.get('$_baseUrl/converter?apikey=$_apiKey&q=$fromCurrency-$toCurrency');
    final response = await http.get(Uri.parse('$_baseUrl/converter?apikey=$_apiKey&q=$fromCurrency-$toCurrency'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['data'][toCurrency];
    } else {
      throw Exception('Failed to load exchange rate');
    }
  }
}
