import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather/models/weather_model.dart';

class WeatherService {
  final Dio dio = Dio();
  final String baseUrl = dotenv.env['BASE_URL']??"" ;
  final String apiKey = dotenv.env['API_KEY']??"";
  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
        "$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no",
      );
      log(response.data.toString());
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
        final String errorMessage = e.response?.data["error"]["message"] ?? "Oops There Was An Error Try Later";
          throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("Oops There Was An Error Try Later");
    }
  }
}
