import 'dart:convert';
import 'package:http/http.dart' as http;

class GoogleSheetService {
  /// private constructor
  GoogleSheetService._();

  /// the one and only instance of this singleton
  static final instance = GoogleSheetService._();

  List<GoogleSheetAPIModel> list = [];

  Future<bool> callGoogleSheetAPI() async {
    print("callGoogleSheetAPI");

    String apiKey = 'AIzaSyA0w_ZecwgQJ9XHcrfsxLpW92i_FacfzRU';
    String spreadsheetId = '1osAu_AWYqWaMMxd2JGo7yJfTTSKVOyqodAV9dCDRILs';
    String range = 'finance!A1:Y998';
    String url =
        'https://sheets.googleapis.com/v4/spreadsheets/$spreadsheetId/values/$range?key=$apiKey';

    list.clear();

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        List<dynamic> values = data['values'];

        for (var value in values) {
          String currencyPair = value[0];
          String price = value[1];
          String currencyCode = value[2];
          String currencyPairName = value[3];

          list.add(GoogleSheetAPIModel(
              currencyPair, price, currencyCode, currencyPairName));
        }
        return true;
      } else {
        print('Failed to retrieve data. Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}

class GoogleSheetAPIModel {
  final String currencyPair;
  final String rate;
  final String currencyCode;
  final String currencyPairName;

  GoogleSheetAPIModel(
      this.currencyPair, this.rate, this.currencyCode, this.currencyPairName);
}
