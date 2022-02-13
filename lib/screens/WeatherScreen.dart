import 'package:dibloma_7_api_weather/screens/CityScreen.dart';
import 'package:dibloma_7_api_weather/servies/WeatherApi.dart';
import 'package:dibloma_7_api_weather/servies/WeatherModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class WeatherScreen extends StatefulWidget {
  var dataW ;
  WeatherScreen(this.dataW);
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  int?  temperature ;
  String? wetherIcon ;
  int? condition ;
  String? cityName ;
  String? Message ;


  void updateUI( data) {
    temperature = data['main']['temp'];
    condition =data['weather'][0]['id'];
    cityName =data['name'];
    WeatherModel model = new WeatherModel();
    wetherIcon = model.getWeatherIcon(condition!);
    Message =model.getMessage(temperature!);
  }

  @override
  void initState() {
    WeatherApi ap = WeatherApi();
     var data = ap.GetData();
    super.initState();
    updateUI(widget.dataW);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/location_background.jpg'),
              fit: BoxFit.cover,
              // colorFilter: ColorFilter.mode(
              //     Colors.white.withOpacity(0.8), BlendMode.dstATop),
            ),
          ),
          constraints: BoxConstraints.expand(),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Icon(Icons.near_me,size: 50,color: Colors.white,),
                IconButton(
                    icon:  Icon(Icons.location_city,size: 50,color: Colors.white,),
                  onPressed: () async{
                     var name = await Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CityName() ;
                      }));
                     // url l city
                  },
                ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //$temperature
                Text("$temperature",style: TextStyle(color: Colors.white,fontSize: 100),),
                  SizedBox(width: 40,),
                  //$wetherIcon
                 Text("$wetherIcon",style: TextStyle(color :Colors.yellow,fontSize: 120),)
                ],
              ),//$Message$cityName
              Text("it is a $Message  in $cityName  ",style: TextStyle(
                fontSize: 80,
                color: Colors.white,
                fontWeight:FontWeight.bold,
              ),
              textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
