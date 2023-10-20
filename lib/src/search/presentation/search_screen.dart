import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/di/di.dart';
import 'package:weather_app/src/info/presentation/widget/weather_info_sheet.dart';
import 'package:weather_app/src/search/presentation/state/search_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchBloc>(),
      child: Material(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SearchAppBar(),
            const Expanded(child: SearchResult()),
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom,
            ),
          ],
        ),
      ),
    );
  }
}

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (ctx, state) {
        return ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: state.data.length,
          itemBuilder: (ctx, index) {
            final p = state.data[index];

            return GestureDetector(
              onTap: () {
                getIt<AppRouter>().modalBottomPage(
                  WeatherInfoSheet(name: p.name),
                  setting: const RouteSettings(name: 'weather_sheet'),
                );
              },
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${p.name} ${p.country}',
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class SearchAppBar extends StatefulWidget {
  const SearchAppBar({super.key});

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();
  late final SearchBloc bloc = context.read<SearchBloc>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 8,
          right: 16,
          top: 8,
        ),
        child: Row(
          children: [
            buildBackButton(context),
            Expanded(child: buildInput()),
          ],
        ),
      ),
    );
  }

  Widget buildBackButton(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        if (focusNode.hasFocus) {
          focusNode.unfocus();
          await Future.delayed(const Duration(milliseconds: 300));
        }
        Navigator.of(context).pop();
      },
      child: const Padding(
        padding: EdgeInsets.fromLTRB(8, 6.5, 12, 6.5),
        child: Icon(
          Icons.arrow_back_ios_rounded,
          color: Color(0xff0FF697896),
          size: 20,
        ),
      ),
    );
  }

  Widget buildInput() {
    return SizedBox(
      height: 40,
      child: CupertinoTextField(
        controller: controller,
        focusNode: focusNode,
        autofocus: true,
        maxLines: 1,
        keyboardType: TextInputType.text,
        placeholder: 'Tìm theo mã hàng hoá, tên hàng hoá',
        placeholderStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 1.3,
          color: Color(0xff0FF697896),
        ),
        textInputAction: TextInputAction.done,
        style: const TextStyle(
          fontSize: 14,
          color: Color(0xff0FF697896),
          height: 1.2,
        ),
        cursorHeight: 18,
        cursorColor: const Color(0xFF1A4C70),
        cursorWidth: 1.5,
        prefix: Padding(
          padding: const EdgeInsets.only(left: 10, right: 4),
          child: SizedBox.square(
            dimension: 16,
            child: SvgPicture.asset(
              'assets/icons/ic_search.svg',
              fit: BoxFit.contain,
            ),
          ),
        ),
        suffix: buildEraseButton(),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFE9EDF5), width: 1),
          color: const Color(0xFFF6F8FA),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        onChanged: (input) => bloc.add(SearchEvent.search(input.trim())),
      ),
    );
  }

  Widget buildEraseButton() {
    return GestureDetector(
      onTap: () {
        controller.clear();
        bloc.add(SearchEvent.search(''));
      },
      behavior: HitTestBehavior.opaque,
      child: const Padding(
        padding: EdgeInsets.fromLTRB(4, 3, 11, 3),
        child: Icon(
          Icons.cancel,
          size: 18,
          color: Color(0xff0FF697896),
        ),
      ),
    );
  }
}
