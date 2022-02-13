
import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

class WeatherApi {
  late double Latiude ;
  late double Longitude ;
  var dataW ;
 Future <dynamic> GetData ()async {
   Position  position = await Geolocator.getCurrentPosition(
       desiredAccuracy: LocationAccuracy.low);
   Latiude=position.latitude;
   Longitude=position.longitude;
   print ("Latudiue is $Latiude , Longitude is $Longitude");
   var Url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=${this.Latiude}&lon=${this.Longitude}&appid=841459f68c28a90f72bf25680cfb76b3");
   Response response = await get(Url);
   if (response.statusCode == 200){
     dataW = response.body ;
     print('Json from NetworkHelber : $dataW');

   } else{
     print ("response.statusCode =${response.statusCode}");
   }
   return jsonDecode(dataW);
 }







}