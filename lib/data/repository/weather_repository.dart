import 'package:weather_app/data/model/weather.dart';
import 'package:weather_app/data/service/weather_service.dart';

class WeatherRepository {
  final WeatherService weatherService;
  WeatherRepository({required this.weatherService});

  Future<Weather>getWeatherData(double lat,double long,{String?city})async{
    var data =await weatherService.getWeatherData(lat, long,city: city);
    return Weather.fromJson(data);
  }
}