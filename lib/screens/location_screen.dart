import 'package:clima/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/networking.dart';
import 'dart:convert';
import 'package:clima/services/weather.dart';
import 'package:clima/screens/city_screen.dart';

class LocationScreen extends StatefulWidget {

  final locationweather;
  final locationweather1;
  final locationweather3;
  LocationScreen({this.locationweather, this.locationweather1,this.locationweather3});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  int temperature;
  int condition;
  String cityname;
  String wicon;
  String comment;

  @override
  void initState() {
    super.initState();
    wthrinfo(widget.locationweather, widget.locationweather1,widget.locationweather3);

  }
  void wthrinfo(dynamic whtrdata,dynamic whtrdata1, dynamic whtrdatat3) {
    if (whtrdatat3 == null) {
      setState(() {
        if ((whtrdata == null) && (whtrdata1 == null)) {
          cityname = '';
          temperature = 0;
          wicon = 'error';
          comment = 'unable to get weather data';
          return;
        }
        cityname = whtrdata1[0]['name'];
        double temp = whtrdata['current']['temp'];
        temperature = temp.toInt();
        condition = whtrdata['current']['weather'][0]['id'];
        wicon = weatherModel.getWeatherIcon(condition);
        comment = weatherModel.getMessage(temperature);
      });
    }
      if(whtrdatat3!=null){
        setState(() {
          cityname = whtrdatat3['name'];
          double temp = whtrdatat3['main']['temp'];
          temperature = temp.toInt();
          condition =whtrdatat3['weather'][0]['id'];
          wicon = weatherModel.getWeatherIcon(condition);
          comment = weatherModel.getMessage(temperature);
          cn = null;

        });
        if(whtrdatat3 == null){
          print('invalid city name');
        }
      }
    }


  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async{
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return LoadingScreen();
                      },),);


                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async{
                     var typedname = await Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CityScreen();
                      }),);
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      wicon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$comment in $cityname!',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
