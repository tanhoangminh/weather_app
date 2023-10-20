import 'package:flutter/material.dart';
import 'package:weather_app/src/info/presentation/widget/weather_info_builder.dart';
import 'package:weather_app/src/info/presentation/widget/weather_info_card.dart';

class WeatherInfoCardWrapper extends StatelessWidget {
  const WeatherInfoCardWrapper({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return WeatherInfoBuilder(
      key: Key('$name card'),
      name: name,
      builder: (info, state) {
        if (info != null) return WeatherInfoCard(info: info);

        return const SizedBox.shrink();
      },
    );
  }
}
