import 'package:flutter/material.dart';
class CityName extends StatefulWidget {
  @override
  _CityNameState createState() => _CityNameState();
}

class _CityNameState extends State<CityName> {
  String? cityname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/city_background.jpg"),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 50,),
                 TextField(
                    style: TextStyle(color: Colors.black,fontSize: 25),
                    onChanged: (newValue){
                    this.cityname = newValue ;
                    },
                    decoration: InputDecoration(
                      icon: Icon(Icons.location_city,size: 50,color: Colors.white,),
                        fillColor: Colors.white,
                      filled: true,
                      hintText: "Enter city name",
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                    ) ,
                      border:OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      )

                      )
                  ) ,

                TextButton(
                    onPressed: (){
                      Navigator.pop(context,this.cityname);
                    },
                    child: Text("Get Weather",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 40,
                    ),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
