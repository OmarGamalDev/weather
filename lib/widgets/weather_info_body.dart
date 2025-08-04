import 'package:flutter/material.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Alxendria",
          style: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Updated at 7:30",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset("assets/images/clear.png"),
            Text("17", style: TextStyle(color: Colors.black, fontSize: 32)),
            Column(
              children: [
                Text(
                  "Max temp:17",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                Text(
                  "Min temp:30",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 50),
        Text(
          "Light Rain",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
