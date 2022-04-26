import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:weather_app/modals.dart';
import 'package:weather_app/main.dart';

class yourlooc extends StatelessWidget {
  Widget currentWeater(IconData icon, String temp, String Location) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(90.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.my_location, color: Colors.blueGrey,),
                SizedBox(width: 5.0,),
                Text('Your Location Now',
                  style: TextStyle(fontSize: 16, color: Colors.blueGrey),)
              ],),

            Text('$Location',
              style: TextStyle(fontSize: 40),),
            SizedBox(height: 10.0,),
            Icon(
              icon,
              color: Colors.orange,
              size: 64.0,
            ),
            SizedBox(height: 10),
            Text('$temp', style: TextStyle(fontSize: 40.0),),
            SizedBox(height: 10.0,)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
