// // models/weather_model.dart

// class Weather {
//   final String cityName;
//   final double temperature;
//   final String description;

//   Weather({
//     required this.cityName,
//     required this.temperature,
//     required this.description,
//   });

//   // Factory method to create a Weather object from JSON data
//   factory Weather.fromJson(Map<String, dynamic> json) {
//     return Weather(
//       cityName: json['name'],
//       temperature: json['main']['temp'],
//       description: json['weather'][0]['description'],
//     );
//   }
// }
// models/weather_model.dart

class Weather {
  final String cityName;
  final int temperature; // Changed from double to int
  final String description;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.description,
  });

  // Factory method to create a Weather object from JSON data
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      // Convert the temperature to an integer
      temperature: (json['main']['temp'] as double).round(),
      description: json['weather'][0]['description'],
    );
  }
}
