import 'dart:developer';
import 'package:http/http.dart' as http;
import 'weather_model.dart';
import 'dart:convert';

class ApiService {
  Future<WeatherModel?> getWeather() async {
    try {
      var url = Uri.parse('https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&hourly=temperature_2m');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return WeatherModel.fromJson(json.decode(response.body));
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
