import 'dart:convert';

import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'Location.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/screens/city_screen.dart';
import 'package:clima/utilities/constants.dart';
Location loc = Location();

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double longi;
  double lati;
  @override
  void initState() {
    super.initState();
    apigetter();

  }

  Future<void> getpermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
  }

  void apigetter() async {
    await  getpermission();
    var wd3;


    WeatherModel wthrmd =  WeatherModel();
    var wd1 = await wthrmd.getlocationData();
    var wd2 = await wthrmd.getlocationData1();
    if (cn!=null){
       wd3 = await wthrmd.getlocationData3(cn);
    }




    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            locationweather: wd1,
            locationweather1: wd2,
            locationweather3: wd3,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitRotatingCircle(
        color: Colors.white,
        size: 50.0,
      )),
    );
  }
}
