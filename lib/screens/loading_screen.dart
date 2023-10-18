import 'dart:developer' as developer;
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  Future<void> getLocationData() async {
    var weatherData = await WeatherModel().getWeatherData();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return LocationScreen(weatherData);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            // Row(children: [
            //   Expanded(
            //     child: Text(
            //       'Hold it tight we are gettting your ',
            //       style: TextStyle(fontSize: 30),
            //     ),
            //   ),
            //   // WidgetSpan(
            //   //   child: SizedBox(width: 5),
            //   // ),
            //   SpinKitWave(
            //     size: 30,
            //     color: Colors.white,
            //     // itemBuilder: (context, index) {
            //     //   return Text('.');
            //     // },
            //   )
            // ],),
            RichText(
          text: TextSpan(
              text: 'Hold it tight we are gettting your location',
              style: TextStyle(
                fontSize: 40,
              ),
              children: [
                TextSpan(),

                // treat the child of WidgetSpan as the parameter to insert
                // whatever widget you wish to put here
                // SizedBox is only used to put a little space after the text string
                WidgetSpan(
                    child: SpinKitWave(
                  size: 30,
                  color: Colors.white,
                )),
              ]),
        ),
      ),
    );
  }
}
