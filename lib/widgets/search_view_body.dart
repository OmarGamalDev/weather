import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_service.dart';
import 'package:weather/views/home_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 150.h),
        Padding(
          padding: EdgeInsets.all(10.0.h),
          child: TextField(
            onSubmitted: (value) async {
              try {
                weatherModel = await WeatherService().getWeather(
                  cityName: value,
                );
                if (!context.mounted) return;
                showTopSnackBar(
                  Overlay.of(context, rootOverlay: true),
                  CustomSnackBar.info(message: weatherModel!.cityName),
                );
              } on Exception catch (e) {
                showTopSnackBar(
                  Overlay.of(context, rootOverlay: true),
                  CustomSnackBar.error(message: e.toString()),
                );
              }
              Navigator.pop(context);
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                icon: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

WeatherModel? weatherModel;
