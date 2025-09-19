import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Cubit/Weather_Cubit.dart';

import 'package:weatherapp/Models/Weather_Model.dart';

// ignore: must_be_immutable
class Searchpage extends StatelessWidget {
  // ignore: non_constant_identifier_names
  String? CityName;

  WeatherModel? weatherdata;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            onSubmitted: (data) async {
              CityName = data;
              BlocProvider.of<WeatherCubit>(context)
                  .getweather(cityname: CityName);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              border: OutlineInputBorder(),
              hintText: "Find your city",
              labelText: "Search",
              suffixIcon: Icon(Icons.search),
              fillColor: Colors.blueAccent,
            ),
          ),
        ),
      ),
    );
  }
}
