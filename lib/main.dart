import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart'as http;
import 'package:weather_app/modals.dart';
import 'package:weather_app/empty1.dart';
import 'package:weather_app/empty2.dart';
import 'package:weather_app/weather_app.dart';
import 'package:weather_app/yourlooc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  int currentIndex=0;
  final screens=[ weatherApp(),empty1(),empty2(),yourlooc()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: false,
            currentIndex: currentIndex,
            onTap: (index)=> setState(() =>
            currentIndex=index ),
            items:[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                 label: '',
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.monitor_heart),
                label: '',
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: '',
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                label: '',
              ),


            ]
        ),
      ),
    );
  }
}