import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Cubit/Weather_Cubit.dart';
import 'package:weatherapp/Cubit/Weather_State.dart';
import 'package:weatherapp/Models/Weather_Model.dart';
import 'package:weatherapp/Pages/InitialPage.dart';
import 'package:weatherapp/Pages/WeatherPage.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  WeatherModel? weatthermodel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text("Weather App"),
        ),
        body:
            BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
          if (state is WeatherLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherSucces) {
            weatthermodel = BlocProvider.of<WeatherCubit>(context).weatherModel;
            return Weatherpage(
              WeatherData: weatthermodel!,
            );
          } else if (state is WeatherFailed) {
            return Center(
              child: Text("There is a wrong"),
            );
          } else {
            return Initialpage();
          }
        }));
  }
}
