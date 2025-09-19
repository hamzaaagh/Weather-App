// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Cubit/Weather_Cubit.dart';
import 'package:weatherapp/Cubit/Weather_State.dart';
import 'package:weatherapp/Pages/HomePage.dart';

import 'package:weatherapp/Services/Weather_Service.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => WeatherCubit(WeatherService()),
    child: WeatherApp(),
  ));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        return MaterialApp(
          home: HomePage(),
          theme: ThemeData(
            primaryColor:
                BlocProvider.of<WeatherCubit>(context).weatherModel == null
                    ? Colors.cyan
                    : BlocProvider.of<WeatherCubit>(context)
                        .weatherModel!
                        .getthemecolor(),
          ),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
