import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_service.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
  final TextEditingController controller = TextEditingController();
  getCurrentWeather({required String cityName}) async {
    emit(WeatherLoadingState());
    try {
      WeatherModel weatherModel = await WeatherService().getWeather(
        cityName: cityName,
      );
      emit(WeatherSuccessState(weatherModel: weatherModel));
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
void clear() {
    controller.clear();
    emit(WeatherInitial());
  }
}