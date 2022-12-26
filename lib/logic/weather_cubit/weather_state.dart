part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Current ?current;
  final Location ?location;
  final Forecast ?forecast;
  WeatherLoaded({
    required this.current,
    required this.location,
    required this.forecast
  });
}

class WeatherFailToload extends WeatherState {}
