import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double min_temp;
  double max_temp;
  String condition;
  String icon;
  WeatherModel(
      {required this.date,
      required this.temp,
      required this.min_temp,
      required this.max_temp,
      required this.condition,
      required this.icon});
  factory WeatherModel.fromjson({required dynamic data}) {
    dynamic jsondata = data["forecast"]["forecastday"][0]["day"];
    return WeatherModel(
        date: data["location"]["localtime"],
        temp: jsondata['avgtemp_c'],
        min_temp: jsondata["mintemp_c"],
        max_temp: jsondata["maxtemp_c"],
        condition: jsondata["condition"]["text"],
        icon: data["current"]["condition"]["icon"]);
  }
  MaterialColor? getthemecolor() {
    if (condition == 'Sunny' || condition == 'Light Cloud') {
      return Colors.amber;
    } else if (condition == 'Sleet' ||
        condition == 'Snow' ||
        condition == 'Hail') {
      return Colors.lightBlue;
    } else if (condition == 'Heavy Cloud') {
      return Colors.blueGrey;
    } else if (condition == 'Light Rain' ||
        condition == 'Heavy Rain' ||
        condition == "Showers" ||
        condition == "Patchy rain nearby") {
      return Colors.blue;
    } else if (condition == 'Thunderstorm') {
      return Colors.teal;
    }
// ignore: curly_braces_in_flow_control_structures
    else {
      return Colors.brown;
    }
  }

  @override
  String toString() {
    return "date =  temp = ";
  }
}
