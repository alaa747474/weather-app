import 'package:dio/dio.dart';
import 'package:weather_app/constants/strings.dart';


class WeatherService {
  late Dio dio;
  late BaseOptions options;

  WeatherService() {
    BaseOptions options =
        BaseOptions(baseUrl: baseUrl, receiveDataWhenStatusError: true);
    dio = Dio(options);
  }
  Future<Map<String,dynamic>> getWeatherData(double lat, double long,{String? city}) async {
    Response response = await dio.get('forecast.json', queryParameters: {
      'key': apiKey,
      'q': city??'$lat,$long',
      'days': '3',
      'aqi': 'no',
      'alerts': 'no'
    });
    return response.data;
    
  }
}
