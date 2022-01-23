import 'package:clima/screens/Location.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/screens/location_screen.dart';
class WeatherModel {
  void getweatherdata(String cityname) {
    LocationScreen locationScreen = LocationScreen();
    String url3 ='api.openweathermap.org/data/2.5/weather?q=$cityname&appid=1f0bbe4ba9abca0a063e71236463a6cf';
    networkhelper nt = networkhelper();
  }
  Future<dynamic> getlocationData() async{
    Location location=Location();
    await location.getLocation();
    double longi = location.longitude1;
    double lati = location.latitude1;
    print('$longi $lati');
    String url1 =
        'http://api.openweathermap.org/geo/1.0/reverse?lat=$lati&lon=$longi&limit=1&appid=1f0bbe4ba9abca0a063e71236463a6cf';
    String url2 =
        'https://api.openweathermap.org/data/2.5/onecall?lat=$lati&lon=$longi&exclude=hourly,daily&appid=1f0bbe4ba9abca0a063e71236463a6cf&units=metric';

    networkhelper networking = networkhelper(url: url2);
    var weatherdata = await networking.getdata();
   return weatherdata;


  }
  Future<dynamic> getlocationData1() async{
     Location location=Location();
    await location.getLocation();
    double longi = location.longitude1;
    double lati = location.latitude1;
    print('$longi $lati');
    String url1 =
        'http://api.openweathermap.org/geo/1.0/reverse?lat=$lati&lon=$longi&limit=1&appid=1f0bbe4ba9abca0a063e71236463a6cf';
    String url2 =
        'https://api.openweathermap.org/data/2.5/onecall?lat=$lati&lon=$longi&exclude=hourly,daily&appid=1f0bbe4ba9abca0a063e71236463a6cf&units=metric';

    networkhelper networking = networkhelper(url_1: url1);
    var weatherdata1 = await networking.getdata1();
    return weatherdata1;


  }
  Future<dynamic> getlocationData3(String cityname) async{

    String url3 ='https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=1f0bbe4ba9abca0a063e71236463a6cf&units=metric';
    networkhelper networking = networkhelper(url_3: url3);
    var weatherdata3 = await networking.getdata3();
    return weatherdata3;


  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
