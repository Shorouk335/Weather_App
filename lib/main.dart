import 'package:dibloma_7_api_weather/screens/LoadingScreen.dart';
import 'package:dibloma_7_api_weather/screens/WeatherScreen.dart';
import 'package:flutter/material.dart';
main(){
  runApp(WeatherApp());
}
class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Weather App",
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
