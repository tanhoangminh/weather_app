import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/src/info/presentation/state/weather_bloc.dart';
import 'package:weather_app/src/info/presentation/widget/weather_info_builder.dart';
import 'package:weather_app/src/info/presentation/widget/weather_info_error.dart';
import 'package:weather_app/src/info/presentation/widget/weather_info_screen.dart';

class WeatherInfoWrapper extends StatelessWidget {
  const WeatherInfoWrapper({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return WeatherInfoBuilder(
      key: Key(name),
      builder: (info, state) {
        if (state is WeatherStateInitial) {
          return const Scaffold(
            body: AppLoadingIndicator(),
          );
        }

        if (state is WeatherStateFailure) return const WeatherInfoError();

        if (info == null) return const SizedBox.shrink();
        return WeatherInfoScreen(info: info);
      },
      name: name,
    );
  }
}
