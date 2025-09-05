import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/cubit/weather_cubit.dart';
import 'package:weather/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, context) {
        return BlocProvider(
          create: (context) => WeatherCubit(),
          child: MaterialApp(
            debugShowCheckedModeBanner: true,
            home: HomeScreen(),
          ),
        );
      },
    );
  }
}
