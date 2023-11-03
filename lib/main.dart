import 'dart:convert';
import 'package:flutter/material.dart';

void main() {
  runApp(WeatherInfoApp());
}

class WeatherDataSet {
  final String cityName;
  final double temperature;
  final String condition;
  final int humidity;
  final double windSpeed;

  WeatherDataSet(
      {required this.cityName,
      required this.temperature,
      required this.condition,
      required this.humidity,
      required this.windSpeed});

  factory WeatherDataSet.fromJson(Map<String, dynamic> json) {
    return WeatherDataSet(
      cityName: json['city'],
      temperature: json['temperature'].toDouble(),
      condition: json['condition'],
      humidity: json['humidity'],
      windSpeed: json['windSpeed'].toDouble(),
    );
  }
}

class WeatherInfoApp extends StatefulWidget {
  @override
  _WeatherInfoAppState createState() => _WeatherInfoAppState();
}

class _WeatherInfoAppState extends State<WeatherInfoApp> {
  List<WeatherDataSet> weatherInfoList = [];

  @override
  void initState() {
    super.initState();

    String jsonString = '''
      [
        {
          "city": "New York",
          "temperature": 20,
          "condition": "Clear",
          "humidity": 60,
          "windSpeed": 5.5
        },
        {
          "city": "Los Angeles",
          "temperature": 25,
          "condition": "Sunny",
          "humidity": 50,
          "windSpeed": 6.8
        },
        {
          "city": "London",
          "temperature": 15,
          "condition": "Partly Cloudy",
          "humidity": 70,
          "windSpeed": 4.2
        },
        {
          "city": "Tokyo",
          "temperature": 28,
          "condition": "Rainy",
          "humidity": 75,
          "windSpeed": 8.0
        },
        {
          "city": "Sydney",
          "temperature": 22,
          "condition": "Cloudy",
          "humidity": 55,
          "windSpeed": 7.3
        }
      ]
    ''';

    List<dynamic> jsonList = json.decode(jsonString);

    for (Map<String, dynamic> jsonData in jsonList) {
      WeatherDataSet weatherData = WeatherDataSet.fromJson(jsonData);
      weatherInfoList.add(weatherData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Weather Info App',
            style: TextStyle(fontSize: 24),
          ),
        ),
        body: ListView.builder(
          itemCount: weatherInfoList.length,
          itemBuilder: (context, index) {
            WeatherDataSet data = weatherInfoList[index];
            return Card(
              child: ListTile(
                title: Text(
                  'City: ${data.cityName}',
                  style: const TextStyle(fontSize: 20),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Temperature: ${data.temperature}°C',
                        style: const TextStyle(fontSize: 16)),
                    Text('Condition: ${data.condition}',
                        style: const TextStyle(fontSize: 16)),
                    Text('Humidity: ${data.humidity}%',
                        style: const TextStyle(fontSize: 16)),
                    Text('Wind Speed: ${data.windSpeed} m/s',
                        style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
