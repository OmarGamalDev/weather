import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:weather/cubit/weather_cubit.dart';
import 'package:weather/services/weather_service.dart';
import 'package:weather/views/home_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {
        if (state is WeatherSuccessState) {
          showTopSnackBar(
            Overlay.of(context, rootOverlay: true),
            CustomSnackBar.info(message: state.weatherModel.cityName),
          );
        } else if (state is WeatherFailureState) {
          showTopSnackBar(
            Overlay.of(context, rootOverlay: true),
            CustomSnackBar.error(message: "Something went wrong"),
          );
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(height: 150.h),
            Padding(
              padding: EdgeInsets.all(10.0.h),
              child: TextField(
                controller: context.read<WeatherCubit>().controller,
                onSubmitted: (value) async {
                  if (value.isNotEmpty) {
                    context.read<WeatherCubit>().getCurrentWeather(
                      cityName: value,
                    );
                    Navigator.pop(context);
                  }
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 30.h,
                    horizontal: 16.w,
                  ),
                  label: Text("Search city"),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  hintText: "Enter City Name",
                  suffixIcon: IconButton(
                    onPressed: () {
                      final cubit = context
                          .read<
                            WeatherCubit
                          >(); // ✅ نفس الـ Cubit بتاع BlocProvider
                      final text = cubit.controller.text;

                      if (text.isNotEmpty) {
                        cubit.clear(); // دي هتمسح التكست وترجع الحالة Initial
                        cubit.getCurrentWeather(cityName: text);
                        Navigator.pop(context);
                      }
                    },
                    icon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
