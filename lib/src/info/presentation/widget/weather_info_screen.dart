import 'package:flutter/material.dart';
import 'package:weather_app/src/info/data/repository/weather_info.dart';
import 'package:weather_app/src/search/presentation/search_screen.dart';

class WeatherInfoScreen extends StatelessWidget {
  const WeatherInfoScreen({super.key, required this.info});

  final WeatherInfo info;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const SearchScreen(),
                    settings: const RouteSettings(name: 'list_screen'),
                  ));
                },
                icon: const Icon(Icons.list),
              ),
            ),
            const Spacer(),
            WeatherData(info: info),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class WeatherData extends StatelessWidget {
  const WeatherData({super.key, required this.info});

  final WeatherInfo info;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox.square(
          dimension: 30,
          child: Image.network('https:${info.current.condition.icon}'),
        ),
        const SizedBox(height: 16),
        Text(
          info.location.name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'C:',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '${info.current.tempC.toInt()}',
                style: const TextStyle(
                  fontSize: 32,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const VerticalDivider(
                width: 10,
                thickness: 2,
                indent: 5,
                endIndent: 5,
              ),
              const Text(
                'F:',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '${info.current.tempF.toInt()}',
                style: const TextStyle(
                  fontSize: 32,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          info.current.condition.text,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Cập nhật lần cuối: ${info.current.lastUpdated}',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
