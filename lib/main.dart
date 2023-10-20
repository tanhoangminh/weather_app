import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/src/home_bloc.dart';
import 'package:weather_app/src/home_screen.dart';

import 'di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => getIt<LocationManageBloc>(),
      child: MaterialApp(
        navigatorKey: getIt<AppRouter>().navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Colors.white),
          scaffoldBackgroundColor: Colors.white
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
