import 'dart:convert';
import 'package:http/http.dart' as http;


class ApiService {
  final String apiKey;
  ApiService(this.apiKey);

  Future<double> fetchExchangeRate() async {
    final response = await http.get(Uri.parse('http://api.freecurrencyapi.com/v1/latest?base_currency=EUR&apikey=$apiKey'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['data']['USD'];
    } else {
      throw Exception('Failed to load exchange rate');
    }
  }
}


