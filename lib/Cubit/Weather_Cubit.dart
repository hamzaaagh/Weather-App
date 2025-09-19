// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Cubit/Weather_State.dart';
import 'package:weatherapp/Models/Weather_Model.dart';
import 'package:weatherapp/Services/Weather_Service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherservice) : super(InitialState());
  String? city;
  WeatherService weatherservice;
  WeatherModel? weatherModel;
  void getweather({required dynamic cityname}) async {
    city = cityname;
    emit(WeatherLoading());
    try {
      weatherModel = await weatherservice.getweather(Cityname: cityname);
      emit(WeatherSucces());
    } on Exception catch (e) {
      emit(WeatherFailed());
      print(e);
    }
  }
}
