abstract class WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSucces extends WeatherState {}

class WeatherFailed extends WeatherState {}

class InitialState extends WeatherState {}
