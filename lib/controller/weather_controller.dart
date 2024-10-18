// controllers/weather_service.dart

import 'dart:convert';
import 'package:egram/model/weathermodel.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = '8cd64cba552ecc9fb4cd54bbb2bfd464'; 

  Future<Weather> fetchWeather(double latitude, double longitude) async {
    final String url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Weather.fromJson(json);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
