import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/weather_class.dart';
import 'package:weatherapp/weather_service.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  Weather w=new Weather();
  Weather_Data wd=new Weather_Data();

  double t=0;
  double f=0;
  String condi="";

  void initState() {
    super.initState();
    getWether();
  }

  void getWether()async{
    w=await wd.getWeatherData("kerala");
    setState(() {
      t=w.temperature_c;
      f=w.temperature_f;
      condi=w.condition;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/weather2.jpg"),
                fit: BoxFit.cover
              )
            ),
          ),

          SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 20),
                  child: Text("Calicut",style: GoogleFonts.oswald(
                      fontWeight: FontWeight.bold,fontSize: 70,color: Colors.red
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Monday,",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
                      Text("January 30",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 120.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.cloudy_snowing,size:50 ,color: Colors.blue,),
                      SizedBox(width: 20,),
                      Text(condi,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),),
                    ],
                  ),
                ),
                Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.thermostat,size: 40,color: Color(0xFFF61806),),
                        Text("${t.toString()}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),)
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.thermostat,size: 40,color: Color(0xFFF61806),),
                        Text("${f.toString()}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),)
                      ],
                    ),

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 30),
                  child: Text("${t.toString()}°C",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 100,color: Colors.yellow),),
                )
              ],
            ),
          ),


        ],
      ) ,
    );
  }
}