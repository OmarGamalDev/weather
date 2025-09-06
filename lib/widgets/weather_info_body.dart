import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/cubit/weather_cubit.dart';
import 'package:weather/main.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherModel = BlocProvider.of<WeatherCubit>(context).weatherModel!;
    final themeColor = getThemeColor(weatherModel.weatherCondation);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            themeColor.shade500.withValues(alpha: 0.9),
            Colors.white.withValues(alpha: 0.3),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Card(
            elevation: 10,
            shadowColor: themeColor.shade700.withValues(alpha: 0.4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            color: Colors.white.withValues(alpha: 0.95),
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    weatherModel.cityName,
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: themeColor.shade900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Updated at ${weatherModel.time.hour.toString().padLeft(2, '0')}:${weatherModel.time.minute.toString().padLeft(2, '0')}",
                    style: TextStyle(fontSize: 16.sp, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.network(
                          "https:${weatherModel.image}",
                          width: 80.w,
                          height: 80.w,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 80.w,
                              height: 80.w,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Icon(
                                Icons.cloud_off,
                                size: 40.sp,
                                color: Colors.grey[600],
                              ),
                            );
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return SizedBox(
                              width: 80.w,
                              height: 80.w,
                              child: Center(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    themeColor,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Text(
                        "${weatherModel.temp.round()}°C",
                        style: TextStyle(
                          fontSize: 36.sp,
                          fontWeight: FontWeight.w600,
                          color: themeColor.shade900,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "Max: ${weatherModel.maxTemp.round()}°C",
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: themeColor.shade800,
                            ),
                          ),
                          Text(
                            "Min: ${weatherModel.minTemp.round()}°C",
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: themeColor.shade800,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      color: themeColor.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      weatherModel.weatherCondation,
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                        color: themeColor.shade900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
