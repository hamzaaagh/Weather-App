import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/Models/Weather_Model.dart';

class WeatherService {
  String baseurl = "http://api.weatherapi.com/v1";
  String apikey = "d694519d86ac4a61ae665933250605";

  Future<WeatherModel?> getweather({required String Cityname}) async {
    Uri url =
        Uri.parse("$baseurl/forecast.json?key=$apikey&q=$Cityname&days=1");
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    WeatherModel weather = WeatherModel.fromjson(data: data);
    return weather;
  }
}
