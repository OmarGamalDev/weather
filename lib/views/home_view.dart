import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/views/search_view.dart';
import 'package:weather/widgets/no_weather_body.dart';
import 'package:weather/widgets/search_view_body.dart';
import 'package:weather/widgets/weather_info_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2297f4),
        title: Text(
          "Weather",
          style: TextStyle(
            color: Colors.white,
            fontSize: 26.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SearchView();
                  },
                ),
              );
            },
            icon: Icon(Icons.search, color: Colors.white, size: 30.sp),
          ),
        ],
      ),
      body:weatherModel==null? NoWeatherBody(): WeatherInfoBody(),
    );
  }
}
