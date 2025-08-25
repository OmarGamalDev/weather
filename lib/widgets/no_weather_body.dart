import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            "there is no weather 😔",
            style: TextStyle(color: Colors.black, fontSize: 28.sp),
          ),
        ),
        Text(
          "start searching now 🔍",
          style: TextStyle(color: Colors.black, fontSize: 28.sp),
        ),
      ],
    );
  }
}
