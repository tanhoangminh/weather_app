import 'dart:convert';

import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/di/di.dart';
import 'package:weather_app/src/home_bloc.dart';
import 'package:weather_app/src/info/presentation/widget/weather_info_card_wrapper.dart';
import 'package:weather_app/src/search/presentation/search_screen.dart';

import 'info/presentation/widget/weather_info_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            floating: false,
            pinned: true,
            elevation: 0,
            title: Text(
              'Thời tiết',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: _SearchBox()),
          BlocBuilder<LocationManageBloc, LocationState>(
            builder: (_, state) {
              final data = state.data;
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: 16,
                    ),
                    child: GestureDetector(
                      onTap: () {
                      },
                      behavior: HitTestBehavior.opaque,
                      child: WeatherInfoCardWrapper(name: data[index]),
                    ),
                  ),
                  childCount: data.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _SearchBox extends StatelessWidget {
  const _SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => const SearchScreen(),
            settings: const RouteSettings(name: 'search_screen')));
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xffF6F8FB),
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 12.0,
        ),
        child: Row(
          children: [
            Icon(
              PhosphorIcons.regular.magnifyingGlass,
              size: 20,
              color: const Color(0xffBDBDBD),
            ),
            const SizedBox(width: 6.0),
            const Text(
              'Tìm tên thành phố/mã zip',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xff96A0B5),
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
