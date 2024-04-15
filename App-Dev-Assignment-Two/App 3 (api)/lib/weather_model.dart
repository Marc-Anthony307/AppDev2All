import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherModel {
  final double temperature;
  final String timezone;
  final double latitude;
  final double longitude;
  final String time;

  WeatherModel({
    required this.temperature,
    required this.timezone,
    required this.latitude,
    required this.longitude,
    required this.time,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    // Extracting the current temperature and time from the response
    String time = json['hourly']['time'][0];
    String timezone = json['timezone'];
    double latitude = json['latitude'];
    double longitude = json['longitude'];
    double temperature = json['hourly']['temperature_2m'][0];

    return WeatherModel(
      temperature: temperature,
      timezone: timezone,
      latitude: latitude,
      longitude: longitude,
      time: time,
    );
  }
}