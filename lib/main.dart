import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/data/repository/weather_repository.dart';

import 'package:weather_app/data/service/weather_service.dart';
import 'package:weather_app/logic/theme_cubit/theme_mode_cubit.dart';
import 'package:weather_app/logic/weather_cubit/weather_cubit.dart';

import 'package:weather_app/router/app_router.dart';
import 'package:weather_app/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeModeCubit()..getSavedTheme(),
        ),
        BlocProvider(
          create: (context) => WeatherCubit(
              weatherRepository:
                  WeatherRepository(weatherService: WeatherService()))
            ..getWeatherData(),
        ),
      ],
      child: BlocBuilder<ThemeModeCubit, ThemeModeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: context.read<ThemeModeCubit>().isDark != false
                ? appThemeData[AppTheme.light]
                : appThemeData[AppTheme.dark],
            onGenerateRoute: AppRouter().generateRoute,
          );
        },
      ),
    );
  }
}
