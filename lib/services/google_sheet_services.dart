import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lot_size_calculator_app/utils/constants.dart';
import 'package:intl/intl.dart';

class GoogleSheetService {
  /// private constructor
  GoogleSheetService._();

  /// the one and only instance of this singleton
  static final instance = GoogleSheetService._();

  List<GoogleSheetAPIModel> list = [];
  String date = AppConst.strEmpty;
  DateTime? now;

  Future<bool> callGoogleSheetAPI() async {
    print("callGoogleSheetAPI");

    now = DateTime.now();
    DateFormat outputFormat = DateFormat('yyyy/MM/dd H:m');
    date = outputFormat.format(now!);

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

          String formattedPrice;
          if (double.tryParse(price) != null) {
            if (currencyPair == "XAU/USD") {
              formattedPrice = double.parse(price).toStringAsFixed(2);
            } else {
              switch (currencyPair.substring(currencyPair.length - 3)) {
                case "JPY":
                  formattedPrice = double.parse(price).toStringAsFixed(3);
                  break;
                default:
                  formattedPrice = double.parse(price).toStringAsFixed(5);
                  break;
              }
            }
          } else {
            formattedPrice = AppConst.strEmpty;
          }
          print(currencyPair);
          print(formattedPrice);

          list.add(
              GoogleSheetAPIModel(currencyPair, formattedPrice, currencyCode));
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
  String currencyPair;
  String rate;
  String currencyCode;

  GoogleSheetAPIModel(
    this.currencyPair,
    this.rate,
    this.currencyCode,
  );
}
