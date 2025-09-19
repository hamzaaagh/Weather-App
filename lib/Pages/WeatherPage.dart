import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Cubit/Weather_Cubit.dart';

import 'package:weatherapp/Models/Weather_Model.dart';

// ignore: must_be_immutable
class Weatherpage extends StatelessWidget {
  Weatherpage({required this.WeatherData});
  WeatherModel? WeatherData;
  String? CityName;
  @override
  Widget build(BuildContext context) {
    WeatherData = BlocProvider.of<WeatherCubit>(context).weatherModel;
    String? CityName = BlocProvider.of<WeatherCubit>(context).city;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              WeatherData!.getthemecolor()!,
              WeatherData!.getthemecolor()![400]!,
              WeatherData!.getthemecolor()![100]!
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 2,
            ),
            Column(
              children: [
                Text(
                  CityName.toString(),
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Uptaded at : ${WeatherData!.date}",
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
            Spacer(
              flex: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network("${WeatherData!.icon}"),
                Text(
                  "${WeatherData!.temp}",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    Text("Max : ${WeatherData!.max_temp.toInt()}"),
                    Text("Min :  ${WeatherData!.min_temp.toInt()}"),
                  ],
                ),
              ],
            ),
            Spacer(
              flex: 1,
            ),
            Text(
              "${WeatherData!.condition}",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            Spacer(
              flex: 6,
            ),
          ],
        ),
      ),
    );
  }
}
