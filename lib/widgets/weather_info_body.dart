import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/weather_cubit.dart';
import 'package:weather/main.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});
  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<WeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [getThemeColor(weatherModel.weatherCondation), Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherModel.cityName,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Updated At ${weatherModel.time.hour}:${weatherModel.time.minute}",
            style: const TextStyle(
              color: Color.fromARGB(255, 51, 46, 46),
              fontSize: 25,
            ),
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network(
                "https:${weatherModel.image}",
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error);
                },
              ),
              Text(
                weatherModel.temp.toString(),
                style: const TextStyle(color: Colors.black, fontSize: 32),
              ),
              Column(
                children: [
                  Text(
                    "Max temp: ${weatherModel.maxTemp.round()}",
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  Text(
                    "Min temp: ${weatherModel.minTemp.round()}",
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 50),
          Text(
            weatherModel.weatherCondation,
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
