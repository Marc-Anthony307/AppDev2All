import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'weather_model.dart';
import 'api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  WeatherModel? _weatherModel;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _weatherModel = await ApiService().getWeather();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      home: Scaffold(
        backgroundColor: Colors.blue[300],
        body: _weatherModel == null
            ? Center(child: CircularProgressIndicator())
            : Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.cloud,
                size: 200,
                color: Colors.white,
              ),
              SizedBox(height: 8.0),
              Text(
                '${_weatherModel!.temperature.toStringAsFixed(1)}°C',
                style: TextStyle(
                  fontSize: 80.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${_weatherModel!.timezone}',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                _weatherModel!.time,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              Divider(
                height: 40,
                thickness: 2,
                indent: 20,
                endIndent: 20,
                color: Colors.white,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Latitude: " +
                    _weatherModel!.latitude.toString(),
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Longitude: " +
                    _weatherModel!.longitude.toString(),
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}




