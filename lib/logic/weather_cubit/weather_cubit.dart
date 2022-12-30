import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/data/model/current.dart';
import 'package:weather_app/data/model/forecast.dart';
import 'package:weather_app/data/model/location.dart';

import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather_app/data/service/current_location_service.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit({required this.weatherRepository}) : super(WeatherInitial());
  final WeatherRepository weatherRepository;

  late double lat;
  late double long;

  CurrentLoctionService currentLoctionService = CurrentLoctionService();
  Future getLatAndLong() async {
    await currentLoctionService.determinePosition().then((value) {
      lat = value.latitude;
      long = value.longitude;
    });
  }

  getWeatherData({String?city}) async {
    await getLatAndLong();
    emit(WeatherLoading());
    weatherRepository.getWeatherData(lat, long,city: city).then((weatherData) {
      emit(WeatherLoaded(
          current: weatherData.current,
          location: weatherData.location,
          forecast: weatherData.forecast));
    });
     
  }
}
