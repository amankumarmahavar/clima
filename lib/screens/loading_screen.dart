import 'dart:developer' as developer;
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/utilities/constants.dart';

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
    var weatherData = await WeatherModel().getLocationWeatherData();
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
        child: RichText(
          text: TextSpan(
              text: 'Hold it tight we are getting your location',
              style: kLoadingTextStyle,
              children: [
                TextSpan(),
                WidgetSpan(
                    child: SpinKitThreeInOut(
                  size: 50,
                  color: Colors.blueGrey,
                )),
              ]),
        ),
      ),
    );
  }
}
