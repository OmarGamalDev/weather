import 'package:flutter/material.dart';
import 'package:weather/widgets/search_view_body.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          weatherModel!.cityName,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          weatherModel!.time,
          style: const TextStyle(color: Colors.black, fontSize: 25),
        ),
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network("https:${weatherModel!.image}"),
            Text(
              weatherModel!.temp.toString(),
              style: const TextStyle(color: Colors.black, fontSize: 32),
            ),
            Column(
              children: [
                Text(
                  "Max temp: ${weatherModel!.maxTemp}",
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
                Text(
                  "Min temp: ${weatherModel!.minTemp}",
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 50),
        Text(
          weatherModel!.weatherCondation,
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
