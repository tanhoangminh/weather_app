import 'package:flutter/material.dart';
import 'package:weather_app/src/info/data/repository/weather_info.dart';
import 'package:weather_app/src/info/presentation/widget/weather_info_screen.dart';

class WeatherInfoCard extends StatelessWidget {
  const WeatherInfoCard({super.key, required this.info});

  final WeatherInfo info;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.04),
            offset: Offset(0, 4),
            blurRadius: 12,
            spreadRadius: 4,
          )
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: WeatherData(info: info),
      ),
    );
  }
}
