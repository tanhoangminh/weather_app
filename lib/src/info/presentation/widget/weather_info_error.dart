import 'package:flutter/material.dart';

class WeatherInfoError extends StatelessWidget {
  const WeatherInfoError({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Lỗi không tải được dữ liệu',
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
      ),
    );
  }
}
