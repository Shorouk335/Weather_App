import 'package:dibloma_7_api_weather/screens/WeatherScreen.dart';
import 'package:dibloma_7_api_weather/servies/WeatherApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
   WeatherApi a = new WeatherApi();
         var data = a.GetData();
    Future.delayed(Duration(seconds: 2),(){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return WeatherScreen(data);
          },
        ),);
    });

  }

  @override
  Widget build(BuildContext context) {
    //GetData();
    return Scaffold(
        backgroundColor: Colors.black,
      body: Center(
        child: SpinKitCircle(
          color: Colors.yellow,
          size: 100,
        )
      ),
    );
  }
}
