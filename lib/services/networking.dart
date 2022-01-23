import 'dart:convert';

import 'package:flutter/material.dart';
import'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

class networkhelper {
   String url;
   String url_1;
   String url_3;
   String data;
   String data1;
   String data3;


   networkhelper({this.url, this.url_1,this.url_3});

   Future getdata() async {
      http.Response response = await http.get(Uri.parse(url
          ),);


      if (response.statusCode == 200) {
         data = response.body;
         return jsonDecode(data);
      }
      else{
         print(response.statusCode);
      }
   }
   Future getdata1() async {
      http.Response response1 = await http.get(Uri.parse(url_1
      ),);

      if (response1.statusCode == 200) {
         data1 = response1.body;
         return jsonDecode(data1);
      }
      else{
         print(response1.statusCode);
      }
   }
   Future getdata3() async {
      http.Response response3 = await http.get(Uri.parse(url_3
      ),);

      if (response3.statusCode == 200) {
         data3 = response3.body;
         return jsonDecode(data3);
      }
      else{
         print(response3.statusCode);
      }
   }
}