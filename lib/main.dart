import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/blocs/theme/theme_bloc.dart';
import 'package:flutter_weather_app/blocs/weather/weather_bloc.dart';
import 'package:flutter_weather_app/locator.dart';
import 'widgets/weather_app.dart';

void main() {
  setupLocator();
  runApp(BlocProvider(
    create: (context) => ThemeBloc(),
    child: const MyApp(),
    ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<ThemeBloc>(context),
      builder: (context, state) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: (state as AppThemeState).theme,
        home: BlocProvider(create: (context) => WeatherBloc(),child: WeatherApp()),
      ),
    );
  }
}