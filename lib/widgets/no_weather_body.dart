import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            "there is no weather 🤨 start",
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
        ),
        Text(
          "searching now 🔍",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ],
    );
  }
}
