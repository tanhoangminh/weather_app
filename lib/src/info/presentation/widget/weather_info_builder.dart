import 'package:core_dependency/core_dependency.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/di/di.dart';
import 'package:weather_app/src/info/data/repository/weather_info.dart';
import 'package:weather_app/src/info/presentation/state/weather_bloc.dart';

class WeatherInfoBuilder extends StatefulWidget {
  const WeatherInfoBuilder({
    super.key,
    required this.builder,
    required this.name,
  });

  final String name;
  final Widget Function(WeatherInfo? info, WeatherState state) builder;

  @override
  State<WeatherInfoBuilder> createState() => _WeatherInfoBuilderState();
}

class _WeatherInfoBuilderState extends State<WeatherInfoBuilder> {
  late final WeatherBloc bloc;

  @override
  void initState() {
    bloc = getIt<WeatherBloc>()..add(WeatherEvent.fetch(widget.name));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherBloc>.value(
      value: bloc,
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (_, state) {
          if (state is WeatherStateLoaded) {
            return widget.builder(state.info, state);
          }
          return widget.builder(null, state);
        },
      ),
    );
  }
}
