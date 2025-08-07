import 'package:dio/dio.dart';
import 'package:weather/models/weather_model.dart';

class WeatherService {
  final Dio dio=Dio();
  final String baseUrl ="https://api.weatherapi.com/v1";
  final String apiKey="00fcdf0d152240458e881427250408";
  Future<WeatherModel> getWeather({required String cityName})async{
     Response response  =await dio.get("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1");
     WeatherModel weatherModel = WeatherModel.fromJson(response.data);
     return weatherModel;
  }
}