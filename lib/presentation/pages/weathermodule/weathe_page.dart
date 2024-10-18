// views/weather_screen.dart

import 'package:egram/controller/weather_controller.dart';
import 'package:egram/model/weathermodel.dart';
import 'package:flutter/material.dart';


class WeatherScreen extends StatefulWidget {
  final double latitude;
  final double longitude;

  WeatherScreen({required this.latitude, required this.longitude});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Weather? weather;
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    try {
      WeatherService weatherService = WeatherService();
      final fetchedWeather =
          await weatherService.fetchWeather(widget.latitude, widget.longitude);
      setState(() {
        weather = fetchedWeather;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Error fetching weather data';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body:
       isLoading
          ? Center(child: CircularProgressIndicator())
          : weather != null
              ?
               Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('City: ${weather!.cityName}'),
                    Text('Temperature: ${weather!.temperature}°C'),
                    Text('Condition: ${weather!.description}'),
                    
                  ],
                )
              : Center(child: Text(errorMessage)),
    );
  }
}
