
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/constants/strings.dart';
import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather_app/data/service/weather_service.dart';
import 'package:weather_app/logic/weather_cubit/weather_cubit.dart';
import 'package:weather_app/presentation/screens/home_screen.dart';
import 'package:weather_app/presentation/screens/searched_city_weather_screen.dart';
import 'package:weather_app/presentation/screens/weather_screen.dart';

class AppRouter {
  
  Route ? generateRoute(RouteSettings settings){
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(builder: (context)=>const HomeScreen());
       case weatherScreen:
       final isDark=settings.arguments as bool;
        return MaterialPageRoute(builder: (context)=> WeatherScreen(isDark: isDark,));
        case searchedCityScreen:
        final cityName=settings.arguments as String;
        return MaterialPageRoute(builder: (context){
          return BlocProvider(create: (context) =>WeatherCubit(weatherRepository: WeatherRepository(weatherService: WeatherService()))..getWeatherData(city:cityName ) ,
          child:  SearchedCityWeatherScreen(cityName: cityName,),);
        });
    }return MaterialPageRoute(builder: (context)=>const HomeScreen());
  }
}