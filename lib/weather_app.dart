import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart'as http;
import 'package:weather_app/modals.dart';
class weatherApp extends StatefulWidget {
  @override
  State<weatherApp> createState() => _weatherAppState();
}

class _weatherAppState extends State<weatherApp> {
  final _cityTextController=TextEditingController();
  final _dataService= DataService();
  WeatherResponse? _response;
  int currentIndex=0;
  //final screens=[ weatherApp(),];
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: TextField(
            controller: _cityTextController,
            decoration:  InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(
                  fontSize: 19
              ),
              prefixIcon: Icon(Icons.search, color: Colors.black,),
              /* suffixIcon: IconButton(
    icon: Icon(
    Icons.edit,
    size: 30,
    color: Colors.black,
    ), onPressed: _search),*/
              // border: OutlineInputBorder(
              // borderSide: BorderSide(color: Colors.white),
              // borderRadius: BorderRadius.all(Radius.circular(15))
            )
          //),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        /*  leading: IconButton(
          icon: Icon(
            Icons.search,
            size: 30,
            color: Colors.black,
          ), onPressed: () {  },
        ),*/
      ),
      body:  Padding(
        padding: const EdgeInsets.fromLTRB(25, 10,0, 0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (_response !=null)

                Column(
                  children:
                  [Text(_response!.cityName,
                      style: TextStyle(fontSize: 30)),
                    Text('${_response?.tempInfo.temperature}°',
                      style: TextStyle(fontSize: 40),),
                    Text(_response!.weatherInfo.description ),
                    Text('${_response?.humInfo.humidity}'),
                   // Text('${_response?.windSped.wind}'),
                  ],
                ),
              Padding(padding: EdgeInsets.symmetric(vertical: 50),
              ),

              ElevatedButton(onPressed: _search,child: Text('Search'),),

            ],
          ),
        ),
      ),
      //screens[currentIndex] ,

    );
  }
  void _search()async{
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() => _response =response);
  }
}


class DataService{
  Future<WeatherResponse> getWeather(String city) async{
    final queryParameters={
      'q': city,
      'appid':'5d701d98c04efc6849b676910219eec8' ,
      'units':'metric',
    };
    final uri =Uri.https(
        'api.openweathermap.org','/data/2.5/weather',queryParameters );
    final response = await http.get(uri);
    print (response.body);
    final json=jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }

}



