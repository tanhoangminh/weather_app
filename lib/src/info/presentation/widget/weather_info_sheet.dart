import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/di/di.dart';
import 'package:weather_app/src/home_bloc.dart';
import 'package:weather_app/src/info/presentation/widget/weather_info_builder.dart';
import 'package:weather_app/src/info/presentation/widget/weather_info_screen.dart';

class WeatherInfoSheet extends StatelessWidget {
  const WeatherInfoSheet({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: TextButton(
                  onPressed: () {
                    context.read<LocationManageBloc>().add(Save(name));
                    getIt<AppRouter>().popToPath('search_screen');
                    getIt<AppRouter>().pop();
                  },
                  child: const Text(
                    'Thêm',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: WeatherInfoBuilder(
                name: name,
                builder: (info, state) {
                  if (info == null) return const SizedBox.shrink();

                  return WeatherData(info: info);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
