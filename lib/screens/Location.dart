import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


class Location {
  double longitude1;
  double latitude1;

  Future<double> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      longitude1 = position.longitude;
      latitude1 = position.latitude;

    }
    catch(e) {
      print(e);
    }
    }


}



